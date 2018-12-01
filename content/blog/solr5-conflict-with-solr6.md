+++
title = "solr5和solr6相同集群共存冲突解决"
date = 2018-12-01T12:43:53+08:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["冲突"]
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

# 背景

公司内部从2015年9月开始部署了Solr5.3 搜素引擎服务，到今年年初Solr的版本已经发展到了Solr6.x，无奈开源社区的发张的确很快，因为Solr6服务端整合了Facebook的prestodb数据库的Sql解析引擎（[https://prestodb.io/](https://prestodb.io/) ），可以让Solr6服务端支持简单的sql语句查询，一时间搜索引擎可以支持Sql语句查询，虽然目前只能支持很简单的单表查询语句和集中功能简单的聚合查询，总之Solr在nosql DB方面走出了坚实的一步。更加方便的是Solrj代码包中提供了一个实现了jdbc接口的API包，这样使得一般的开发工程师可以轻松编写基于搜索引擎的查询操作。

 这么好的功能我们当然是尝试用一下的，所以当时以很快的速度在老版本Solr集群之上部署了新Solr6的collection，不过没有过多久发现了一个严重的问题。问题是，当调用创建Collection的API会出现异常：
 
> http://10.1.5.19:8080/solr/admin/collections?action=CREATE&name=collection1
 
 当调用admin/collections的API 来向集群提交一个创建新Collection的请求的时候，操作往往会超时，报序列化异常相关的异常，无论通过这个api创建的collection是solr5还是solr6的都会有问题，不能能成功创建。
 
 其他几个api也无一例外的会出现异常结果。比如删除一个Collection：

> curl 'http://localhost:8080/solr/admin/collections?action=DELETE&name=search4totalpay'
 
# 原因分析

找原因时很容易联想到是不是因为在原本只有solr5节点的集群中添加了版本为solr6的节点呢？最后看了一堆代码之后发现的确是因为在老集群中。

先来看一幅执行“/admin/collections” api的集群调用流程图，如下：
![](/img/blog/1abd7493-729e-3a31-87df-9738cfdae2a9.jpg)


 **集群创建collection流程说明：**

1. 对solr集群任何一个节点发起/admin/collections?action=CREATE 这样的API请求(对应处理类：org.apache.solr.handler.admin.CollectionsHandler)

2. 节点收收到请求之后，向zookeeper中写一个临时节点，节点内容是这次执行任务的内容（格式为json）,在 *OverseerCollectionProcessor* 中的run() 方法中执行，最终执行任务会代理到*org.apache.solr.cloud.OverseerCollectionProcessor.Runner* 类上执行

3. 上图中背景标注为黄色的节点（该节点为监工节点，是由所有节点竞争出来的）认领zookeeper临时节点的任务

4. 监工（overseer）节点执行该节点中的任务，当action=CREATE时，就是向其他节点再分发创建collection replic节点的命令了,对应该的命令路径为“/admin/cores”

5. 待所有replic都创建成功之后，有overseer节点再向zookeeper中写一个执行成功的标记，最终用户就能感知到本次任务已经执行成功了（当然该任务的执行也能够通过异步的方式来执行）

<font color="pink">到此，问题的关键点就明白了，关键在第二和第三步，由solr6向solr5节点（高版本节点向低版本）发送/admin/collections 这类请求是存在问题，Solr API在向前兼容上存在问题，但是测试中发现由solr5向solr6发送请求是没有问题，也就是Solr向后兼容没有问题</font>


# 解决之法

了解了问题点，现在就能着手解决了。很简单，只需要在Solr6引擎节点启的时候，**将Solr6节点参与Overseer角色竞争的流程去掉，让Solr6节点没有机会成为Overseer角色**，要达到这个目的，先要了解一下Overseer竞选相关的代码结构

先看以下类图
![](/img/blog/ade69bec-d321-3ab3-91db-3f50456dfdd7.jpg)

ZkController初始化时，会初始化LeaderElector对象，LeaderElector会将本地节点信息预先写到/overseer_elect/election 节点下参与leader竞选。solr有两种场景需要竞选Leader，一种是上面说到的集群监工负责执行提交给cloud任务，另外一个是执行share内master任务的节点。

执行逻辑分别被封装在OverseerElectionContext 和ShardLeaderElectionContextBase中。


需要修改的点是，ZkController中init()方法中：

``` java
private void init(CurrentCoreDescriptorProvider registerOnReconnect) {
    try {
      createClusterZkNodes(zkClient);
      zkStateReader.createClusterStateWatchersAndUpdate();
      // start the overseer first as following code may need it's processing
      if (!zkRunOnly) {
    //▼▼▼▼▼▼20161022 baisui add for solr6和solr5的节点在同一个集群中，solr的节点会抢overseer的角色但是执行不正常所以就把它抢overseer的
    // 的功能去掉，这样overseer的角色只会有solr5的节点抢夺到
        overseerElector = new LeaderElector(zkClient){
 
            @Override
            public int joinElection(ElectionContext context, boolean replacement)
                    throws KeeperException, InterruptedException, IOException {
                return 0;
            }
            @Override
            public int joinElection(ElectionContext context, boolean replacement, boolean joinAtHead)
                    throws KeeperException, InterruptedException, IOException {
                return 0;
            }
            @Override
            void retryElection(ElectionContext context, boolean joinAtHead)
                    throws KeeperException, InterruptedException, IOException {
            }
        };
        //▲▲▲▲▲▲
        this.overseer = new Overseer(cc.getShardHandlerFactory().getShardHandler(), cc.getUpdateShardHandler(),
            CommonParams.CORES_HANDLER_PATH, zkStateReader, this, cloudConfig);
        ElectionContext context = new OverseerElectionContext(zkClient,
            overseer, getNodeName());
        overseerElector.setup(context);
        overseerElector.joinElection(context, false);
      }
 
      Stat stat = zkClient.exists(ZkStateReader.LIVE_NODES_ZKNODE, null, true);
      if (stat != null && stat.getNumChildren() > 0) {
        publishAndWaitForDownStates();
      }
 
      // Do this last to signal we're up.
      createEphemeralLiveNode();
    } catch (IOException e) {
      log.error("", e);
      throw new SolrException(SolrException.ErrorCode.SERVER_ERROR,
          "Can't create ZooKeeperController", e);
    } catch (InterruptedException e) {
      // Restore the interrupted status
      Thread.currentThread().interrupt();
      log.error("", e);
      throw new ZooKeeperException(SolrException.ErrorCode.SERVER_ERROR,
          "", e);
    } catch (KeeperException e) {
      log.error("", e);
      throw new ZooKeeperException(SolrException.ErrorCode.SERVER_ERROR,
          "", e);
    }
 
  }
```
如上只需要重载LeaderElector的三个方法，joinElection()，retryElection()在方法体中什么事儿都不干就能让Solr节点竞选集群监工的流程去掉了。

# 总结
  至此，Solr5和Solr6 可以在一个Zookeeper域中共存，正常执行了。当然，最简单的办法是，另外启一个zk集群，把solr6的索引完全放到一个独立的集群中去，但是这样无形中增加了集群维护成本，得不偿失。
