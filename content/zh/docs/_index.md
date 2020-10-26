---
title: TIS介绍
date: 2016-04-20
type: book
---

![](/img/tis/tis-vision.jpg)

## 功能介绍

  TIS平台是一套为企业级用户提供大数据多维、实时、查询的搜索中台产品。用户可以在TIS上自助快速构建搜索服务，它大大降低了搜索技术的门槛。
  
  平台分为三个子模块，分别是：
- 搜索引擎

  目前支持Solr
- 离线数仓

  目前支持Hive或者Spark两种计算引擎
- 流式实时同步组件

  目前使用了自研流式计算引擎实现高效数据近实时同步

TIS通过无缝整合以上三个组件为为上层系统提供稳定的数据搜索服务

![](/img/tis/tis-niaohan.png)

## 适用场景

- 数据库加速
  
  几乎所有成熟的关系型数据库中都有'视图'，在单机版小数量规模的应用中'视图'的确是解决OlAP问题的利器，但是在大数据海量数据的场景下，'视图'已经成为了看起来很美好，用起来很鸡肋的东西。所以，在生产环境中会用缓存技术（例如：Redis），来解决OlAP低延时请求响应的问题。但，缓存技术也有其限制，例如，只能支持Key-Value的查询等等。
  现在，可以使用TIS来弥补'数据库视图'和'缓存技术'的短板，轻松利用搜索来实现大数据OLAP的低延时数据访问的痛点问题。

- 优化分库分表

  数据库(例如：mysql)为了支持大数据量，会采用分库分表的部署方案。客户端查询，会以之前约定好的路由方式，将查询路由到某一特定分库分表上。但业务需求经常会需要查询进行跨库跨表进行查询，这对分库分表的架构提出了不小的挑战。
 
  可以将关系数据库中数据导入到TIS中，将原跨库跨表的数据库访问重路由到TIS，可以进行大并发低延时的查询。

- 企业级应用搜索
  
  例如：O2O基于经纬度的地理查询、会员营销CRM，会员画像查询、供应链业务线OLAP低延时查询、后台订单业务线查询、商品中心sku-spu NEST嵌套结构查询、
  店铺实体查询。


## 支持各种平台

  支持私有云，公有云，混合云部署。且能充分利用各种平台底层基础设施，可以最大限度地降低部署成本。
    
## 与ElasticSearcher的区别 

 这是一个经常被用户问起的问题，总体来说TIS和[ElasticSearcher](https://www.elastic.co/)的区别主要在使用场景上。
 
 - ElasticSearcher
   
   ElasticSearcher借助使用ELK工具套件，可以轻松实现，针对业务系统服务器产生的大量时序指标数据进行处理，形成可视化实时报表。用户借助Kibana提供强大的可视化组件，可以轻松可视化观测到系统的安全状况。所以它擅长的是时序数据为主的日志分析，并且针对的用户是`运维人员`。
   
 - TIS
 
   专注于企业级应用搜索，通过无缝整合数仓及流式计算模块，处理的数据是`非时序数据`，为企业级客户提供`企业应用搜索`服务。 LBS地理位置搜索，商品系统搜索都属于`企业应用搜索`的范畴。
   
   因为`非时序数据`的特点是，原始数据创建之后会更新，需要TIS在架构设计上有别与ELK工具套件的架构体系，需要增加一个离线数仓组件，为索引实例定期构建全量数据。
   
   另外，`企业应用搜索`中的数据字段类型会更加复杂，例如，经纬度类型，各种动态类型，保存JSON等都需要在平台中更加方便快捷地定义。


 