---
title: 利用TIS助力Apache Dolphinscheduler数据抽取功能
date: 2021-10-02
type: blog
abstract: 利用TIS助力Apache Dolphinscheduler数据抽取功能
---

## 背景

记得三年前因为工作需要接触了[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)，经过试用瞬间被它可视化界面构建DAG工作流的方式吸引了。轻松点击记下鼠标，通过简单配置就能够构建出一个完成的大数据ETL任务的调度流程。
比同类型的产品azkaban、Apache Airflow有不少优势。公司内部用[DolphinScheduler](https://dolphinscheduler.apache.org/)在大数据ETL分析调度的场景中，会从各种数据源（例如：MySQL、SqlServer、Hive）中抽取数据，然后通过[DolphinScheduler](https://dolphinscheduler.apache.org/)d
的任务调度进行各种分析，最后将分析结果导出到各种类型的目标库中（例如：ClickHouse、Apache Doris、ElasticSearch）。

在使用过程中发现[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)的任务节点虽然已经
集成了[阿里DataX](https://github.com/alibaba/DataX)，和[Apache Sqoop](http://sqoop.apache.org/)，但还是无法完全覆盖到我们的需求点，例如，需要将MySQL数据导入到Hive中使用[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)的DataX任务类型是无法实现的，最终还是需要通过Shell节点类型来实现，
但是这样实现感觉又回到了石器时代，实现方式没有形成标准化，而且写Shell脚本非常容易出错导致开发调试周期比较长。

另外，现有[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)DataX节点只支持：MySqll、PostgreSQL、Clickhouse、Oracle、SqlServer这5种DBRMS类型的数据源，如需要使用其他非DBRMS类型的数据源
如：MongoDB、HBase也还是无法实现。

正好，那时公司内部开发了一款基于DataX的大数据ETL数据抽取工具TIS，TIS基于UI定制流程专注于对各种数据源的抽取，兼容了DataX中大部分Reader和Writer的插件。
本文对如何将TIS与[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)整合作以详细介绍。

## TIS是什么

## TIS和Apache Dolphinscheduler如何整合

说到两个系统如何整合，这个话题由来已久，为了避免重复造轮子，实现强强[Mashup](https://baike.baidu.com/item/Mashup)整合。业界早先就大力推行REST风格API标准，这可以更加高效，快捷地对两个系统进行整合，达到1+1大于2的效果。

要实现TIS与[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)整合，初步分析有以下方案可作参考：

### 1.Apache Dolphinscheduler系统中利用TIS REST API进行整合

   将TIS支持的功能暴露成REST API，在[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)中基于这些REST API接口进行二次开发，将TIS的DataX的数据抽取能力输出到DolphinScheduler中，
   这种方式是业界使用得最多的，但是这种方式在当前整合场景中存在非常大的弊端，即重复造轮子。因为在TIS中已经在TIS中基于API开发了一套UI流程，如果再基于API在DS中开发一套UI流程那就是标准的重复造轮子了，而且，以后TIS每次功能迭代还要到Dolphinscheduler中提交PR作相应更新。
   
   可见，整合两个本身提供UI界面流程的系统，使用REST API方式整合并不合适。

### 2.借鉴[ELK stack](https://www.elastic.co/cn/what-is/elk-stack)实现多系统整合

   为了避免重复造轮子实现两个系统的整合，并且将[Apache DolphinScheduler](https://dolphinscheduler.apache.org/)与TIS的耦合性降到最低，可以借鉴当下最流行的[ELK stack](https://www.elastic.co/cn/what-is/elk-stack)套件整合的思路，
   
   > ELK三个子模块：Elasticsearch、LogStash、Kibana。Elasticsearch 是一个搜索和分析引擎。Logstash 是服务器端数据处理管道，能够同时从多个来源采集数据，转换数据，然后将数据发送到诸如 Elasticsearch 等“存储库”中。Kibana 则可以让用户在 Elasticsearch 中使用图形和图表对数据进行可视化。

   ELK三个组件各自独立，又可以组合在一起。核心组件Elasticsearch可以独立使用，比如用在企业级应用搜索，订单查询搜索，会员画像系统中快速筛选目标会员等。也可以将ELK三个组件组合，实现企业级日志分析的需求。我们发现Elastic公司实现方式上并没有将这是那个
   子系统揉搓在一个系统中，独立成三个独立的子系统，这样带来的好处是显而易见，可以最大化适应不同的业务场景，而又最大限度提高子系统的内聚性，从而降低整个系统的复杂度。
   
   回到DolphinScheduler和TIS的整合场景中，DolphinScheduler擅长的是DAG任务调度，TIS擅长的是数据抽取。借鉴ELK的思路，可以先在TIS中定义数据抽取任务，然后将TIS任务ID配置到DolphinScheduler工作流去，最终在DolphinScheduler系统中触发工作流任务执行。
   
### 3.使用[Custom Elements](https://developer.mozilla.org/zh-CN/docs/Web/Web_Components/Using_custom_elements)实现多系统整合

   在**方案2**中还有一个不足，即为了实现依赖`TIS数据抽取任务`的工作流，需要用户操作两个系统中进行相应的操作来实现。从用户的角度出发，能够在一个系统中完成所有流程步骤定义是最好的，需要在多个系统切换难免显得麻烦。
   在HTML5标准中提供了[Custom Elements](https://developer.mozilla.org/zh-CN/docs/Web/Web_Components/Using_custom_elements)机制，当有A和B两个基于UI的系统需要进行整合，可以将B系统的部分前端组件导出成`Custom Elements`标签形式，然后在A系统中直接引用该标签
   ，这种整合方式可以避免`方案1`中的重复造轮子和`方案2`中的多个系统切换的弊端。
   
   但是它的开发成本比较高，需要在A系统中预留`Custom Elements`的扩展点，在流程交互中还要针对`Custom Elements`生命周期的各个环节提供Hook扩展，所以该整合方案有待将来继续探究。

### 最终整合方案

  经过综合考量，最终决定使用`方案2`。我们在DolphinScheduler中提交了相应的[#ISSUE 5992](https://github.com/apache/dolphinscheduler/issues/5992)，在提交的[#PR 6229](https://github.com/apache/dolphinscheduler/pull/6229)中主要基于
  DolphinScheduler的SPI扩展机制在定义工作流的左侧工具栏中添加了一个新的PIGEON节点类型，通过PIGEON类型的节点，可以在DolphinScheduler中方便引用TIS中已经定义好的DataX任务节点了。

## TIS的优势

### 1.基于Web UI的开箱即用

  TIS基于[ng-zorro-antd](https://ng.ant.design/docs/introduce/zh) UI组件开发了一套覆盖DataX 任务定义、执行、更新等生命周期的流程实现，让用户轻松点击鼠标，让各种类型的数据在各个端之间畅通无阻。
  
  系统提供了各种校验及错误提示机制，让用户不需要直接编辑DataX JSON格式的脚本，TIS系统自动生成DataX JSON配置脚本，从而避繁杂配置带来的不必要错误。

### 2.支持分布式任务分发
  
  开源版DataX解决方案是单节点执行的，由于单节点执行任务吞吐量限制，TIS对DataX进行分布式执行能力扩展。TIS支持`单节点`和`分布式`两种任务执行模式。
  `分布式`模式基于ZK的[Curator](https://curator.apache.org/)分布式任务队列实现Master-Slaver模式，由部署在K8S容器中的Slaver节点来消费任务。

### 3.全新的基于微内核的运行环境
   
  TIS采用微内核的架构设计(参照[Jenkins的插件架构体系](https://www.jenkins.io/doc/developer/extensibility/)))，初始安装包非常小只有300兆，因此TIS运行起来非常快。
  使用时根据需要，在控制台中轻点鼠标，动态加载插件，实现按需加载。
  
### 4.功能覆盖DataX大部分（Reader/Writer）Plugin

- 最新版本已经支持了DataX官方大部分核心Reader/Writer插件，其他插件将会在后续版本中添加。
- 新版本额外添加了对TiDB Reader Plugin支持

### 5.支持RDBMS类型的Writer自动生成目标表

  部分RDMS类型的Writer数据源如MySQL，Clickhouse等系统实现了通过反射Reader数据源的Meta信息，自动生成Writer Plugin对应的目标数据表，免去了手动创建Writer目标表的DDL语句。
  
  支持`Hive`，`Spark`表自动创建，自动添加Partition(基于日期的)

### 6.简化DataX部署方式：
  
  根据原生DataX部署方案要求，需要在本地环境中支持Python运行环境[DataX UserGuid](https://github.com/alibaba/DataX/blob/master/userGuid.md)，根据以往经验，Python运行环境的各种问题，**常常导致DataX脚本无法正常执行**，其实Python只是起到了DataX命令行参数的传递的作用。
  TIS的DataX整合方案中已经将Pyhton环境部署的环节去除掉，用户只需要下载一个TIS的安装包，解压，并且执行`tis.sh start`就可以开始使用DataX组件了。

## 操作流程介绍

介绍在DS中如何利用TIS来实现ETL数据分析需求

## TIS后续的计划

