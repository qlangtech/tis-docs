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

1. 下载

   ```shell script
    wget http://mirror.qlangtech.com/2.2.0/tis/tis-uber.tar.gz
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
   
4. 进入TIS管理控制台，[http://127.0.0.1:8080](http://127.0.0.1:8080)
   

## 操作说明

   [查看]({{< relref "../../guide/" >}})
      
