---
title: 安装步骤
linktitle: 安装步骤
date: 2014-03-10
type: book
weight : 20
---

## 安装Mysql数据库
  {{% alert note %}}
  如果集群中已经安装了Mysql则跳过这一步
  {{% /alert %}}
 1. 选择一台Mysql数据库服务器
 2. 下载mysql rpm包到本地
    
    ```  shell
      wget -i -c http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
    ```
 3. 将rpm安装到 yum的仓库列表中,执行：
  
     ```  shell
      yum localinstall -y mysql57-community-release-el7-10.noarch.rpm         
     ```
    
 4. 确认是否已经添加到yum列表中
          
    ``` shell
    yum search mysql-community-server    
    ```
    如看到有以下这一行就算成功了
    ``` shell
    mysql-community-server.x86_64 : A very fast and reliable SQL database server
    ```
 
 5. 执行安装mysql
    
    ``` shell
    yum install -y mysql-community-server  
    ```
 
 6. 安装完成之后需要对mysql进行配置，可以远端通过用户名密码登录
    
    1. vim /etc/my.cnf，在[mysqld]下添加skip-grant-tables 属性,然后重启
    2. 启动mysql，执行：service mysqld start
    3. 通过`mysql`命令登录数据库，执行：
    
       ``` sql
       update mysql.user set host='%' where user="root";
       flush privileges;
       ALTER USER 'root'@'%' IDENTIFIED BY '123456';
       ```
    

## 初始化配置文件

### 服务器节点配置

   编辑tis-ansible目录下 [inventory/hosts](https://github.com/qlangtech/tis-ansible/blob/master/inventory/hosts)文件，
   将准备好的服务器节点配置到hosts文件中

 {{% callout warning %}}
  测试环境中，以上所有角色可以用相同的IP地址，将所有角色安装在同一节点，以便达到节约资源的目的。生产环境请尽量每个角色安装在不同节点，以便保证系统可靠性。
 {{% /callout %}}
    
   文件内容格式如下：   
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
   需要配置serverGroup为：[tis-console]、[assemble]、[solr]、[hadoop-hdfs-namenode]、[hadoop-hdfs-datanode]、[hadoop-yarn-resource-manager]、[hadoop-yarn-node-manager]、[zookeeper]
      
### 系统配置参数配置 

配置文件[vars.yml](https://github.com/qlangtech/tis-ansible/blob/master/vars.yml)   
    
1. 其他
    
   |  Key                            |      说明             |  例子  | 必须|
   |----------                       |:-------------         |:------|:------:|
   |￿git_src                          | tis github地址，`当使用release包安装时可以不配置`       | https://github.com/qlangtech/tis-solr.git     | N|
   |git_branch                       | tis github 分支，`当使用release包安装时可以不配置`   |   master | N|
   |task_worker_memory               | 任务中心JVM启动分配的堆内存大小 | 400m       | Y |
   |tis_online_repository            | 线上TIS仓库地址           |http://myhost |N|
                
2. 数据库
    
   |  Key                            |      说明             |  例子  | 必须|
   |----------                       |:-------------   |:------|:------:|
   |tisconsole_db_url                |tisMysql数据库url     |127.0.0.1 |Y|
   |tisconsole_db_username           |tisMysql数据库用户名    |root |Y|
   |tisconsole_db_password           |tisMysql数据库密码       |root |Y|
   |tisconsole_db_dbname             |tisMysql数据库dbname  |tis_console |Y|

## 开始安装
 
 安装模式分为两种: [基于Release包安装]({{< relref "#基于Release包安装" >}}),[基于源码安装]({{< relref "#基于源码安装" >}})

### 基于Release包安装
  
Release包（已经deploy到aliyun OSS仓库中）直接在目标服务器上部署安装
    
  对应的脚本为: ./tis-ansible/deploy-tis-by-release.yml
    
Ansible脚本为: [deploy-tis-by-release.yml](https://github.com/qlangtech/tis-ansible/blob/master/deploy-tis-by-release.yml)

安装TIS
``` shell
cd tis-ansible
ansible-playbook ./deploy-tis-by-release.yml --tags=initos,zk,hadoop,spark,tjs,assemble,indexbuilder,solr -i ./inventory/hosts
```

 > `注意`：如果在本地环境中zookeeper、hadoop或者spark已经安装，则**tags**标签中zk,hadoop,spark可以去掉

 {{% callout note %}}
 初始用户建议使用***基于Release包安装***
 {{% /callout %}}
 
### 基于源码安装 
  
另外一种是通过Github源代码 [https://github.com/qlangtech/tis-solr](https://github.com/qlangtech/tis-solr)到本地执行编译打包之后自动部署到目标服务器上。
     
对应脚本为: [./tis-ansible/deploy-tis-by-compile.yml](https://github.com/qlangtech/tis-ansible/blob/master/deploy-tis-by-compile.yml)
     
```
 cd tis-ansible    
 ansible-playbook ./deploy-tis-by-compile.yml --tags pkg,pkg-plugin,ng-tis,tjs,assemble,indexbuilder,solr  -i ./inventory/hosts
```

 安装过程需要一点时间，请耐心等待。当顺利执行完成之后就可以进入下一步了




