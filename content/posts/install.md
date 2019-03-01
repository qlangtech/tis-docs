+++
title = "TIS安装"
date = 2019-02-28T14:36:27+08:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++
## 前言

 由于TIS在分布式环境中有多个组件(Console、Assemble、Taskcenter、SolrCore)需要安装。为了简化安装过程，使用了Ansible进行组件安装，执行Ansible脚本前，先初始化配置文件，最后一键触发Ansible Playbook就能快速完成安装过程。

## 环境准备

### Ansible安装

Ansible提供了强大的集配置,部署,自动化于一身的playbook [http://www.ansible.com.cn](http://www.ansible.com.cn)
linux服务器可以使用以下命令来进行安装:

```shell
 yum install ansible
```
当前测试用的服务器上使用的版本为 **2.6.8**
### TIS Ansible安装脚本获取

Ansible脚本存放在github仓库中 [https://github.com/qlangtech/tis-ansible](https://github.com/qlangtech/tis-ansible)，将脚本clone到本地。

### 服务器准备

需要准备以下服务器节点：

| 节点Key           |      功能          |  数量  |建议配置|
|----------         |:------------- |------:|------:|
|tis-console        | TIS中央控制台 | 1     | 2核4G |
|assemble           | 全量流程控制及中央日志收集   |   1 |  2核4G     |
|buildtask-overseer | 任务调度中心监工 |    1 | 1核1G       |
|buildtask-worker   |任务调度中心执行者|1| 8核16G以上 |
|solr7.6          |SolrNode节点|根据业务可配置多台 | 4核8G以上|

***以上出了solr7.6节点外其他节点机器不会随着集群的扩展而增加***

## 安装步骤

### 安装Mysql数据库

- 选择一台Mysql数据库服务器，初始化一个名称为tis_console的数据库
  
- 初始化数据

     取得tis-ansible目录下的tis_console.sql，执行：
  ```
    mysql -h127.0.0.1 -uroot -proot tis_console <tis_console.sql
  ```
     这样数据库就安装成功了
     
### 初始化配置文件
 
  编辑tis-ansible目录下inventory/hosts文件，该文件配置信息分为两部分：
 
 - 服务器节点

      将准备好的服务器节点配置到hosts文件中

 ```
[tis-console]
10.1.1.1

[assemble]
10.1.1.2

[buildtask-overseer]
10.1.1.3

[buildtask-worker]
10.1.1.4

[solr7.6]
10.1.1.5
10.1.1.6
 ```

 - 系统配置参数
 
|  Key                            |      说明             |  例子  | 是否必须|
|----------                       |:-------------   |:------|:------:|
|git_src                          | tis github地址，当使用release包安装时可以不配置       | git@github.com:baisui1981/tis.git     | N|
|git_branch                       | tis github 分支，当使用release包安装时可以不配置   |   master | N|
|runtime                          | 系统运行的环境，有 **'daily'**和**'online'**  |    daily    |  Y |
|task_worker_memory               | 任务中心JVM启动分配的堆内存大小 | 400m       | Y |
|tis_online_repository            |SolrNode节点          |根据业务可配置多台 |
|hdfs_namenode_ha1                |SolrNode节点          |根据业务可配置多台 |
|hdfs_namenode_ha2                |SolrNode节点          |根据业务可配置多台 |
|tisconsole_db_url                |SolrNode节点          |根据业务可配置多台 |
|tisconsole_db_username           |SolrNode节点          |根据业务可配置多台 |
|tisconsole_db_password           |SolrNode节点          |根据业务可配置多台 |
|tisconsole_db_dbname             |SolrNode节点          |根据业务可配置多台 |
 
 

### 与远端节点SSH打通
 
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

