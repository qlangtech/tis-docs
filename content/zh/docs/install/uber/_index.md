---
title: "单机版安装"
linktitle: 单机版安装
date: 2021-03-30
type: book
weight: 9
---

## 环境准备

1. 准备一台2核4G以上配置的Linux机器节点(CentOs、macOS等)
2. `Java SE Development Kit 8`及以上版本[安装](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)
3. 确保本机节点hostname对应的ip正确
   
   因为进程启动时候会去拿本机的ip地址,所以要保证`/etc/hosts`文件中hostname 对应ip地址正确
   ```shell script
     hostname
     # 得到上面显示的结果，例如：baisui-host-1
     ping baisui-host-1
     # 确认ip节点是否为本机ip无误,如不正确，请在/etc/hosts将正确的hostname与ip映射关系加上
   ```
4. 确保lsof安装成功，`sudo yum install -y lsof`
5. 准备一个可连通的MySQL或者TiDB数据库作流程体验，百万数据量为佳。


## 安装

> [<i class="fa fa-film" aria-hidden="true"></i>&nbsp;安装示例](https://www.bilibili.com/video/BV18q4y1p73B/)



<div class="row ">
  <div class="col-14 col-sm-8">
  
  1. 下载
  
     ```shell script
      wget http://mirror.qlangtech.com/3.5.0/tis/tis-uber.tar.gz
     ```
  
  2. 解压
     ```shell script
       tar xvf tis-uber.tar.gz -C ./
     ```
     
  3. 启动
     * TIS启停
         
         进入目录 
         ```shell script
         cd tis-uber
         ```
         执行shell启动
         ```shell script
         ./bin/tis start
         ```
         重新启动
         ```shell script
         ./bin/tis restart
         ```
         终止TIS进程
         ```shell script
         ./bin/tis stop
         ```
         
         TIS日志查看： 
         ```shell script
           tail -f -n 300 ./logs/tis.log
         ```
         
     * TIS启动端口修改
         
         ```shell script
            vi ./bin/tis
         ```
         里面有一个变量，可修改默认**8080**为其他端口，重启TIS（**./bin/tis restart**）即可生效，
         ```
         SERVER_PORT=8080
         ```
     
      
  4. 进入TIS管理控制台，[http://127.0.0.1:8080](http://127.0.0.1:8080)  
   
  </div>
  <div class="col-10 col-sm-4 featurette">
   <h3>钉钉讨论群</h3>
      <h4>使用过程中有任何问题请随时联系我们</h4>
      <center><img src="/img/tis/dingding_talk_group.jpg" width="250"></center>
  </div>
</div>


    

## 操作说明

   [查看]({{< relref "../../guide/" >}})
   
## QA 

1. TIS启动时发现错误：**Caused by: java.lang.IllegalStateException: ip can not be 127.0.0.1**，具体如下：

    ```shell script
    Caused by: java.lang.RuntimeException: java.lang.IllegalStateException: ip can not be 127.0.0.1
     at com.qlangtech.tis.solrj.util.ZkUtils.registerMyIp(ZkUtils.java:166)
     at com.qlangtech.tis.solrj.util.ZkUtils.registerAddress2ZK(ZkUtils.java:107)
     at com.qlangtech.tis.order.center.IndexSwapTaskflowLauncher.initIncrTransferStateCollect(IndexSwapTaskflowLauncher.java:174)
     at com.qlangtech.tis.order.center.IndexSwapTaskflowLauncher.contextInitialized(IndexSwapTaskflowLauncher.java:120)
     ... 24 more
    Caused by: java.lang.IllegalStateException: ip can not be 127.0.0.1
     at com.qlangtech.tis.solrj.util.ZkUtils.registerMyIp(ZkUtils.java:158)
     ... 27 more
    ``` 
    
    产生这个异常的原因是TIS启动时会获取所在节点IP地址，默认网络接口的IP地址此时为`127.0.0.1`，导致TIS启动异常。修复的办法是：
    
    首先执行： `ifconfig | grep -B 4 inet` 这个命令查看本地网络接口配置：
    例如：
    ```shell script
    lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
        options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>
        inet 127.0.0.1 netmask 0xff000000
        inet6 ::1 prefixlen 128
        inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1
    --
        media: autoselect (<unknown type>)
        status: inactive
    en3: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        ether ac:de:48:00:11:22
        inet6 fe80::aede:48ff:fe00:1122%en3 prefixlen 64 scopeid 0x9
    --
        media: autoselect
        status: inactive
    en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
        ether a4:83:e7:46:45:52
        inet6 fe80::1cdd:c047:7849:13df%en0 prefixlen 64 secured scopeid 0xb
        inet 192.168.28.156 netmask 0xffffff00 broadcast 192.168.28.255
    ```
    发现本地局域网IP 192.168.28.156对应的接口名称为 `en0`，因此需要在 `/bin/tis` 脚本中添加指定网络接口配置参数：`-Dtis.network.interface.preferred=en0`
    
    将java 启动的配置参数修改为：
    
    ```shell script
    JAVA_OPTS="-Dtis.network.interface.preferred=en0 -Xms2G -Xmx3G -XX:MetaspaceSize=512m -XX:MaxMetaspaceSize=1024m -XX:ParallelGCThreads=4 -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=utf-8 -Dtis.launch.port=$SERVER_PORT -DnotFetchFromCenterRepository=true -Ddata.dir=${TIS_TIP}/data -Dlog.dir=$LOG_FILE -Dweb.root.dir=${TIS_TIP}/  -Xrunjdwp:transport=dt_socket,address=50000,suspend=n,server=y"
    ```
    
    完成之后再启动TIS，就可以正常启动啦


      
