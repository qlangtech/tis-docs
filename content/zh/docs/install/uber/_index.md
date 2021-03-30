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
3. 准备一个可连通的MySQL或者TiDB数据库作流程体验，百万数据量为佳。


## 安装

1. 下载

   ```shell script
    wget https://mirror.qlangtech.com/2.2.0/tis/tis-uber.tar.gz
   ```

2. 解压
   ```shell script
     tar xvf tis-uber.tar.gz -C ./
   ```
   
3. 启动
   
   进入目录 
   ```shell script
   cd tis-uber
   ```
   执行shell启动
   ```shell script
   ./bin/tis.sh start
   ```

## 操作说明

   [查看]({{< relref "../../guide/" >}})
      
