---
title: MQ消息反序列化
linktitle: MQ消息反序列化
date: 2014-03-10
type: book
weight : 10
---

## 功能说明

通过MQ订阅到的二进制消息反序列化

## 扩展点

``` java
com.qlangtech.tis.async.message.client.consumer.impl.AbstractAsyncMsgDeserialize
```

## 实现

- com.qlangtech.async.message.client.to.impl.DefaultJSONFormatDeserialize
  
  默认的基于JSON格式反序列化实现





