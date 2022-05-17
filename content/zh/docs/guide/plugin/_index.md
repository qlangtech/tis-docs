---
title: 插件管理
date: 2020-07-26
type: book
weight : 60
---

## 说明
TIS是一个搜索引擎中台，为了适应不同环境和用户对系统底层中间件产品的偏好，TIS提供了灵活的可插拔功能，具体的实现参考了 [Jenkins Plugin development](https://www.jenkins.io/doc/developer/plugin-development/)的实现机制

## 插件开发说明

通过对现有扩展点(`extend point`)的实现，可以方便实现对现有系统功能扩展。创建一个定制的Maven项目，最终打包生成一个tpi后缀的压缩包，提交上传到TIS平台使其生效。
详细插件开发说明请查阅[开发自定义TIS插件]({{< relref "./plugin-develop">}})


## TIS拥有的扩展点(`extend point`)


