---
title: 基于DataX的TIS数据抽取组件
type: book
icon_pack: fas
icon: flag-checkered
date: 2021-03-30
weight: 9
---
## 数据抽取(Extraction)架构
TIS的愿景是实现企业大数据ETL(Extraction-Transformation-Loading)全覆盖的中台产品，数据抽取（Extraction）是大数据处理所有环节中的第一步，也是最重要的环节。最新版本的TIS数据抽取组件是基于[Alibaba DataX](https://github.com/alibaba/DataX)实现的，
并且在原生DataX之上添加了[功能特性]({{< relref "./#i-classfa-fa-eercast-aria-hiddentruei%E5%8A%9F%E8%83%BD%E7%89%B9%E6%80%A7" >}} )大大提交了DataX的可用性

## 视频示例


* [<i class="fa fa-film" aria-hidden="true"></i>&nbsp;启用分布式执行功能](https://www.bilibili.com/video/BV1Cq4y1D7z4?share_source=copy_web)
* [<i class="fa fa-film" aria-hidden="true"></i>&nbsp;MySQL导入ElasticSearch](https://www.bilibili.com/video/BV1G64y1B7wm?share_source=copy_web)
* [<i class="fa fa-film" aria-hidden="true"></i>&nbsp;MySQL导入Hive](https://www.bilibili.com/video/BV1Vb4y1z7DN?share_source=copy_web)
* [<i class="fa fa-film" aria-hidden="true"></i>&nbsp;MySQL导入Clickhouse](https://www.bilibili.com/video/BV1x64y1B7V8/)

## TIS安装

* [<i class="fa fa-download" aria-hidden="true"></i>安装指南]({{< relref "../install/uber" >}})
* [<i class="fa fa-film" aria-hidden="true"></i>&nbsp;安装示例](https://www.bilibili.com/video/BV18q4y1p73B/)

{{< figure src="/img/tis/tis-synoptic.png"  >}}





## <i class="fa fa-eercast" aria-hidden="true"></i>功能特性

### <i class="fa fa-star" aria-hidden="true"></i>基于Web UI的开箱即用

  TIS基于[ng-zorro-antd](https://ng.ant.design/docs/introduce/zh) UI组件开发了一套覆盖DataX 任务定义、执行、更新等生命周期的流程实现，让用户轻松点击鼠标，让各种类型的数据在个端之间畅通无阻。
  
  系统中提供了各种校验及错误提示机制，让用户不需要直接编辑DataX JSON格式的脚本，而是，TIS系统自动生成DataX JSON配置脚本。因此，大大避免了原生DataX配置目繁杂带来的不必要的错误。

### <i class="fa fa-star" aria-hidden="true"></i>支持分布式任务分发
  
  原生开源版DataX解决方案是单机执行的，由于单节点执行任务吞吐量的限制，需要对DataX进行二次开发才能在生产环境中部署。
  
  TIS支持`单节点`和`分布式`两种任务执行模式。`分布式`模式基于ZK的Curator分布式任务队列实现Master-Slaver模式，由K8S容器中的Slaver节点来消费任务。


### <i class="fa fa-star" aria-hidden="true"></i>全新的基于微内核的运行环境
  
  按照[DataX UserGuid](https://github.com/alibaba/DataX/blob/master/userGuid.md)介绍，为了运行DataX需要在本地部署多个组件，对于普通小白用户来说有一定门槛。
  
  TIS采用微内核的架构设计，参照Jenkins的插件架构体系，初始安装包只有300兆。运行时根据需要，在控制台中轻点鼠标，动态加载具体的DataX Plugin(Reader/Writer)。
  
  对于企业级大数据中台产品内部会有非常多的组件，但是用户只会用到部分组件，采用微内核按需加载的方式会带来非常多的好处。
  
  
### <i class="fa fa-star" aria-hidden="true"></i>功能覆盖DataX大部分（Reader/Writer）Plugin

- 最新版本已经支持了DataX官方大部分核心Reader/Writer插件，其他插件将会在后续版本中添加。
- 新版本额外添加了对TiDB Reader Plugin支持

### <i class="fa fa-star" aria-hidden="true"></i>重构DataX的Classloader

重构DataX默认ClassLoader`com.alibaba.datax.core.util.container.JarLoader`，对其功能嫁接到了TIS的`com.qlangtech.tis.datax.TISJarLoader`之上，实现了基于TIS平台可视化的插件加载机制，提升了用户体验。

### <i class="fa fa-star" aria-hidden="true"></i>支持RDBMS类型的Writer自动生成目标表

  部分RDMS类型的Writer数据源如MySQL，Clickhouse等系统实现了通过反射Reader数据源的Meta信息，自动生成Writer Plugin对应的目标数据表，免去了手动创建Writer目标表的DDL语句。
  
  支持`Hive`，`Spark`表自动创建，自动添加Partition(基于日期的)

### <i class="fa fa-star" aria-hidden="true"></i>简化DataX部署方式：
  
  原生DataX部署方案要求，需要在本地环境中支持Python运行环境[DataX UserGuid](https://github.com/alibaba/DataX/blob/master/userGuid.md)，根据以往经验，Python运行环境的各种问题，**常常导致DataX脚本无法正常执行**，其实Python只是起到了DataX命令行参数的传递的作用。
  所以在TIS的DataX整合方案中已经将Pyhton环境部署的环节去除掉了，这样一来提高了DataX运行稳定性。

## 功能一瞥 

选择Reader/Writer插件类型
{{< figure src="datax-add-step2.png"  >}}

添加MySqlReader
{{< figure src="add-mysql-reader.png"  >}}

设置MySqlReader目标表、列  
{{< figure src="select-tab-cols.png"  >}}   

添加ElasticWriter,可视化设置ElasticSearch的Schema Mapping
{{< figure src="add-elastic-writer.png"  >}}

执行MySql->ElasticSearch DataX实例，运行状态 
{{< figure src="datax-exec-status.png"  >}}

执行MySql->ElasticSearch 执行成功
{{< figure src="datax-exec-success.png"  >}}      

## <i class="fa fa-eercast" aria-hidden="true"></i>TIS支持的DataX（Reader/Writer）Plugin


| 类型           | <div style="width:200px">数据源</div>        | <div style="width:100px">Reader(读)</div> | <div style="width:100px">Writer(写)</div> |
| ------------ | ---------- | :--------: | :------- |
| RDBMS 关系型数据库 | MySQL      |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | Oracle     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | SQLServer  |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | PostgreSQL |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | DRDS |         |          |
|              | TiDB |     <i class="fa fa-check-circle" aria-hidden="true"></i>      |         |
|              | ClickHouse |           |    <i class="fa fa-check-circle" aria-hidden="true"></i>  [<i class="fa fa-film" aria-hidden="true"></i>](https://www.bilibili.com/video/BV1x64y1B7V8/)   |
|              | Doris/StarRocks |           |    <i class="fa fa-check-circle" aria-hidden="true"></i>    |
| 阿里云数仓数据存储    | ODPS       |          |          |
|              | ADS        |           |          |
|              | OSS        |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>    |
| NoSQL数据存储    | OTS        |          |          |
|              | Hbase0.94  |          |          |
|              | Hbase1.1   |          |          |
|              | Phoenix4.x   |          |          |
|              | Phoenix5.x   |         |          |
|              | MongoDB    |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | Hive        |          |     <i class="fa fa-check-circle" aria-hidden="true"></i> [<i class="fa fa-film" aria-hidden="true"></i>](https://www.bilibili.com/video/BV1Vb4y1z7DN?share_source=copy_web)    |
|              | Spark       |          |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | Cassandra       |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
| 无结构化数据存储     | TxtFile    |         |          |
|              | FTP        |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | HDFS       |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |     <i class="fa fa-check-circle" aria-hidden="true"></i>     |
|              | Elasticsearch       |         |     <i class="fa fa-check-circle" aria-hidden="true"></i> [<i class="fa fa-film" aria-hidden="true"></i>](https://www.bilibili.com/video/BV1G64y1B7wm?share_source=copy_web)     |
| 时间序列数据库 | OpenTSDB |  |  |
|  | TSDB |  |  |

## 联系我们

<div class="row featurette">
  <div class="col-12 col-sm-6">
    <h3>钉钉讨论群</h3>
    <h4>使用过程中有任何问题请随时联系我们</h4>
    <center><img src="/img/tis/dingding_talk_group.jpeg" width="250"></center>
  </div>
  <div class="col-12 col-sm-6">
  </div>
</div>
