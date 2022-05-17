---
title: 增量实例管理
date: 2020-07-26
type: book
weight : 40
---

## 功能说明

当索引实例创建成功，并且向里面批量构建数据数据之后，如需要开启实时数据同步通道，就需要使用本页说介绍的**增量实例管理**功能

## 组件依赖

需要运行增量实时同步功能，需要TIS系统外围已经部署能够监听数据源中数据增量变更事件的消息中间件，TIS默认的数据源是Mysql，需要在链路上有以下组件：

### 私有云实现

- Mysql

  目前TIS默认支持的数据源为Mysql

- [Canal](https://github.com/alibaba/canal)
  
  兼容Mysql Master-Slaver数据同步协议，负责监听Master节点BinLog数据变更事件的日志。

- [RocketMQ](http://rocketmq.apache.org/) 或者 [kafka](http://kafka.apache.org/)
  
  将Canal中采集到的数据变更事件的日志数据同步推送到MQ中间件的Producer中，TIS通过监听MQ Topic来获取数据增量更新事件，进行进一步流式计算
  
- [K8S容器](https://kubernetes.io/)
  
  本地环境中需要先启动一个K8S集群，增量通道会以`ReplicationController`方式启动
  
### 公有云实现

> 此处以阿里云为例

- [RDS](https://www.aliyun.com/product/rds/mysql?utm_content=se_1006691622)
  
  将MySql包装成RDS服务，用户不需要关心部署等细节服务，且能保证9999的稳定性。

- [DTS](https://www.aliyun.com/product/dts?spm=5176.10695662.796578.3.16995372G7fpIf)
  
  提供监听RDS中数据变更的功能，通过简单配置，用户可以启动Kafka客户端订阅到RDS数据库中变更信息

- [K8S容器服务(ACK)](https://www.aliyun.com/product/kubernetes?spm=5176.10695662.1362501.1.1b2d1b90wWaXVG)

  老实说在私有云环境中搭建K8S集群是非常麻烦的一件事儿，不是专业运维同学来搞的话，不折腾一番肯定是搞不定的。幸好，阿里云提供了ACK服务，用户只需要一键开通就能享受便捷且稳定的服务了
  
## 使用说明 

|||
|--|--|
|<div style="width:200px">进入`索引管理`子页面，点击**实时通道**Tab，再点击**创建增量通道**按钮，开始创建`增量通道`流程</div>|{{<figure src="incr-entry.png">}}| 
| 首先在第一步，需要设置`订阅的MQ Topic信息` 和 `Docker Image等相关信息`，表单填写完成之后可点击**保存&下一步** 进入下一步 | {{<figure src="incr-panel.png">}} |
| 增量通道运行时环境是K8S，需要填写K8S`ReplicationController`相关的属性参数，<br>如：<br> 1.pod数量 <br> 2.CPU规格 <br>3.Memory内存规格 <br><br> 全部填写完成之后，就可以点击**部署**按钮，将配置对应的增量通道实例部署到K8S容器中了 | {{<figure src="incr-k8s-spec.png">}}|
| 最终显示创建成功提示页面，点击**进入**按钮就能进入到`增量通道`维护及状态一览页面 | {{<figure src="incr-channel-success.png">}}|
| 进入`增量通道`维护及状态一览页面，可以查看各种增量执行的日志信息 |{{<figure src="incr-panel.png">}}|

