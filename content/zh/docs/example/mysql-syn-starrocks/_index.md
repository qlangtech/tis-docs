---
title: 基于TIS快速实现MySQL到StarRocks的实时数据同步方案
date: 2021-12-03
type: book
weight: 1
---
## 背景
 企业大数据处理场景中，往往需要对海量数据快速分析统计，但这并不是传统[OLTP](https://baike.baidu.com/item/OLTP/5019563?fr=aladdin)关系数据库（如：MySQL、PostgreSQL、Oracle等）所擅长的，
 幸运的是随着开源软件的兴起，最近社区出现了一款功能强大且容易上手的大数据MPP分析[OLAP](https://baike.baidu.com/item/%E8%81%94%E6%9C%BA%E5%88%86%E6%9E%90%E5%A4%84%E7%90%86/423874?fromtitle=OLAP&fromid=1049009&fr=aladdin)
 数据库[StarRocks](https://starrocks.com/zh-CN/index)，支持快速多维聚合分析，请求可以毫秒级响应、且高并发访问。
 
 利用OLAP和OLTP两种类型的数据库引擎相结合的方式来实现企业对于海量数据的实时分析需求成为切实可行的方案。但异构引擎节点之间需要实现实时数据同步，具体实施过程中有多个工序、细节需要考量，例如，元数据端中
 数据批量更新如何防止同步过程中不产生雪崩效应而导致数据堵塞。以及，如何标准且高效地可构建数据同步链路，让实施工程师专注于业务本身而不身陷于各种技术细节。
 
 基于以上场景，在本文中向大家介绍一款不错的工具TIS，可以快速高效地实现MySQL到[StarRocks](https://starrocks.com/zh-CN/index)的数据同步方案。

## TIS介绍

TIS可以快速为企业构建实时数仓库服务，基于批(DataX)流(Flink-CDC)一体DataOps数据中台，提供简单易用的操作界面，降低用户实施各端（MySQL、PostgreSQL、Oracle、ElasticSearch、ClickHouse、Doris等） 
之间数据同步的技术门槛，缩短任务配置时间，避免配置过程中出错，使数据同步变得简单、有趣且容易上手。

## TIS数据同步原理

TIS底层整合了[DataX](https://github.com/alibaba/DataX)，[Flink CDC](https://github.com/ververica/flink-cdc-connectors)等组件，借鉴[Jenkins](https://github.com/jenkinsci/jenkins)的微内核架构，将各个
功能模块封装成了可插拔的组件模块，在TIS运行期以插件为单位按需加载。

用户业务场景中，如只需要进行T+1离线数据分析那就只加载DataX相关的插件进行批量导入即可。如需要给MMP数据库如StarRock中同步数据，则需要开启基于[Flink CDC](https://github.com/ververica/flink-cdc-connectors)

## TIS安装

TIS的安装非常方便，只需三个步骤：下载一个tar压缩包，解压，最后启动即可。详细请查看 [<i class="fa fa-download" aria-hidden="true"></i>TIS安装说明]({{< relref "../../install/uber/" >}})

>TIS是基于微内核架构来实现的，初始安装包只有200兆，其他具体执行逻辑相关的执行逻辑都封装在了TIS的插件系统中，
本文相关的StarRocks和MySQL以及Flink增量同步、DataX批量同步相关的功能插件都是在TIS运行时按需加载且热部署生效的。

## 视频教程

如果觉得以下文字性的流程说明觉得枯燥乏味，直接进入该流程对应的视频介绍，对使用流程有一个直观感受
<a target="_blank" href="https://www.bilibili.com/video/BV1Ah411x7J8?share_source=copy_web">![](b-store-icon.png)</a>

## 创建MySQL到StarRocks数据通道

### 基本信息配置
|说明  | 图示    |
| --- | ------- |
|当完成**安装**步骤之后，进入TIS操作界面，点击菜单栏中`实例`链接|{{< figure src="enter-tis.png" >}}|
|进入实例列表，点击右侧`添加`下拉按钮中的`数据管道`，进行MySQL端到StarRocks端的数据同步通道构建 | {{< figure src="instance-list.png" >}}|
|添加流程一共分为5步，第1步添加数据通道的基本信息|{{< figure src="add-step-1.png" >}}|
|进入数据端选择步骤，选择**Reader** **Writer**类型选择，由于系统刚安装，数据端类型对应的插件还没有选取，需要点击插件安装`添加`按钮，安装插件 | {{< figure src="add-step-2-1.png" >}}|
|从插件列表中选择`tis-ds-mysql-plugin`,`tis-datax-doris-plugin`（Doris和StarRocks通用）两个插件进行安装 | {{< figure src="add-step-2-2.png" >}} {{< figure src="add-step-2-3.png" >}} {{< figure src="add-step-2-4.png" >}}|
|插件安装完毕，将`插件管理`页面关闭 |{{< figure src="add-step-2-5.png" >}}|
|Reader端选择`MySQL`,Writer端选择`StarRocks`，点击`下一步`按钮，进行MySQL Reader的设置 | {{< figure src="add-step-2-6.png" >}}|
|在Reader设置页面，点击`数据库名`项右侧`配置`下拉框中**MySqlV5** 数据源，完成表单填写，点击`保存`按钮，其他输入项目使用默认值即可，然后再点击`下一步`选取Reader端中需要处理的表|{{< figure src="add-step-3.png" >}}|
|选择需要的表，点击`设置`按钮，对目标表进行设置，选取目标表的目标列.<br> 点击`保存`按钮，然后点击下一步，进入StarRocks Writer表单设置|{{< figure src="add-step-3-1.png" >}} {{< figure src="add-step-3-2.png" >}}|
|StarRocks Writer表单，点击`数据库名`项右侧`配置`下拉框中**添加**按钮，进行StarRocks数据源添加。<br><br>输入表单中`自动建表`如果选择`是`，则会在数据同步流程中，自动通过解析数据源表的MetaData来自动生成Writer表的DDL语句并且自动执行。<br><br> 点击右上方`下一步`按钮，进入数据表映射关系设置页面|{{< figure src="add-step-4.png" >}}|
|表映射页面中，可以对目标表的名称进行修改。完成修改之后，点击`下一步`|{{< figure src="add-step-5-tab-mapper.png" >}}|
|确认页面，对上几步流程中录入的信息进行确认。对DataX脚本和目标库建表DDL进行确认。<br><br>点击`创建`按钮完成数据流通道定义|{{< figure src="add-step-6.png" >}}|

### 实时同步开通
|说明  | 图示    |
| --- | ------- |
|来到数据通道首页，可以打开`构建`页面，进行数据批量导入|{{< figure src="data-channel-index.png" >}}|
|点击`触发构建`按钮开始启动DataX执行批量构建，将MySQL中的数据全量导入StarRocks <br><br> 触发之后静待数据导入完成|触发{{< figure src="trigger-batch.png" >}} 执行中{{< figure src="trigger-batch-doing.png" >}} 完成{{< figure src="trigger-batch-success.png" >}}|
|接下来开通实时增量通道<br><br>首先需要安装**Flink单机版** [安装说明]({{< relref "../../install/flink-cluster/standalone" >}})| {{< figure src="install-flink-plugin.png" >}}|
|Flink集群启动之后，在TIS中添加Flink集群对应配置<br></br>表单填写完成之后，点击`保存&下一步`按钮进入下一步Sink，Source相关属性设置|{{< figure src="add-flink-cluster.png" >}}{{< figure src="add-flink-cluster-2.png" >}}|
|在该步骤添加Flink SourceFunction对应的[flink-connector-mysql-cdc](https://github.com/ververica/flink-cdc-connectors/tree/master/flink-connector-mysql-cdc)插件 和 Fink Sink对应的StarRocks 插件<br><br>设置完成之后进入下一步|{{< figure src="add-flink-cluster-3.png" >}}|
|TIS会解析Reader选取的表元数据信息，自动生成Flink Stream Code<br><br>在该版本中，自动生成的Flink Stream Code还不支持用户自定义编写业务逻辑  <br><br>点击`部署`按钮，进入向Flink Cluster中部署流处理逻辑|{{< figure src="add-flink-cluster-4-confirm-streamcode.png" >}}|
|至此，MySQL与StarRock数据增量通道已经添加完成，MySQL到StarRock实时数据同步可以保证在毫秒级完成|{{< figure src="add-flink-cluster-success.png" >}}




## 总结
通过以上流程介绍，我们发现通过使用[TIS](http://tis.pub)来实现MySQL和StarRocks有如下优势：
- 安装方便，组件按需加载，热生效
- 支持数据源分库，多表同步
- 支持目标库中自动创建表
- 完美实现低代码配置DataOps的目标，帮助用户大大提高工作效率，且避免出错

> 还等什么呢？赶快试用一下吧
