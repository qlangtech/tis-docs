---
title: "TIS安装"
linktitle: TIS安装
icon_pack: fas
icon: wrench
date: 2020-06-18
type: book
weight: 10
---

TIS安装包分为两种模式:

1. 单机安装版
   
   已经将TIS运行时依赖的所有组件，Zookeeper、数据库、Solr节点、任务协调器等都打包在一个tar包中，适合用户初次试用及开发环境开始测试之用。[安装]({{< relref "./uber" >}})
   
2. 分布式集群安装版
   
   生产环境中将各个组件分布式安装在集群各个节点中，从而大大提高系统稳定性及并发吞吐能力。[安装]({{< relref "./multi-nodes" >}})

 
