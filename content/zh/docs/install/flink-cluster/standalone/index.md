---
title: "Flink Cluster 单机版"
linktitle: Flink单机版
date: 2021-12-04
type: book
weight: 11
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

## 安装

1. 下载
   
    ```shell script
     wget http://mirror.qlangtech.com/3.4.0/tis/flink-tis-1.13.1-bin.tar.gz && rm -rf flink-tis-1.13.1 && mkdir flink-tis-1.13.1 && tar xvf flink-tis-1.13.1-bin.tar.gz -C ./flink-tis-1.13.1
    ```
2. 解压Tar包

     ```shell script
        tar xvf flink-tis-1.13.1-bin.tar.gz -C ./flink-tis-1.13.1
     ```

3. 启动Flink Cluster

      ```shell script
        cd ./flink-tis-1.13.1
        bash ./bin/start-cluster.sh
      ```

4. 确认端口是否正常

   ```shell script
    telnet localhost 8081
   ```
   
## 总结
  恭喜您已经把Flink Standalone模式的集群安装成功了
 
 {{% alert warning %}}
  TIS中使用Flink Standalone模式是经过TIS团队适配过的，修改了Flink JobManager中ClassLoader执行逻辑，所以此处安装不能使用Flink官方发布的安装包
 {{% /alert %}}   


