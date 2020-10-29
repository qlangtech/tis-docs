---
title: 安装环境准备
linktitle: 安装环境准备
date: 2014-03-10
type: book
weight : 10
---


## Ansible安装

Ansible提供了强大的集配置,部署,自动化于一身的playbook [http://www.ansible.com.cn](http://www.ansible.com.cn)
linux服务器可以使用以下命令来进行安装:

```shell
 yum install ansible
```
当前测试用的服务器上使用的版本为 **2.9.6**
## TIS Ansible安装脚本获取

Ansible脚本存放在github仓库中 [https://github.com/qlangtech/tis-ansible](https://github.com/qlangtech/tis-ansible)，将脚本clone到本地。

## 服务器节点清单

本方案已经在**Centos7.8**服务期中测试通过，需要准备以下服务器节点：

| 节点Key           |      功能          |  数量  |建议配置 |是否必须|
|----------         |:-------------     |------: |------:|:------:|
|tis-console        | TIS中央控制台       | 1     | 2核4G | 是 |
|assemble           | 全量流程控制及中央日志收集   |   1 |  2核4G |是|
|solr               |SolrNode节点|>=1 | 4核8G以上|是|
|hadoop-hdfs-namenode| hadoop HDFS NN节点 |1 | | |
|hadoop-hdfs-datanode| hadoop HDFS DN节点|>=1|||
|hadoop-yarn-resource-manager|任务调度中心监工| 1|||
|hadoop-yarn-node-manager|任务调度中心执行者|>=1|8核16G以上|否|
|zookeeper||建议3|2核4G|否|


 {{% callout note %}}
  如集群内已经部署有hive、spark、zookeeper，则`buildtask-overseer`和`buildtask-worker`不需要安装
 {{% /callout %}}
## Ansible堡垒节点与服务节点免密码登录

 ansible在安装节点执行playbook，会通过ssh连接到远端目标机器上执行安装命令，需要将安装节点上的私钥-公钥对的公钥先放置到远端服务器 **.ssh/authorized_keys** 文件中，执行：
 ```
 cd tis-ansible
 ansible all -m ping -i ./inventory/hosts
 ```
 结果如下:
 ```
 10.1.1.1 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
10.1.1.2 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
10.1.1.3 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
10.1.1.4 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
10.1.1.5 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
 ```
 显示全部节点能够联通，可进入下一步。

