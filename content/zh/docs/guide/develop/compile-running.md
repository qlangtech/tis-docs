---
title: 编译&运行
date: 2020-03-22
type: book
weight : 10
---

## 前言

如果想要为TIS贡献代码，首先需要为在本地环境中将TIS运行起来。本文向大家介绍从克隆代码仓库中代码，到编译并且运行TIS的每个步骤。

 {{% alert note %}}
  作者开发使用是**macOS**操作系统，安装过程中需要用到shell脚本，所以推荐大家也使用**macOS**操作系统进行开发
 {{% /alert %}} 

## 步骤

### 克隆代码

一个完整的TIS应用，是由三部分构成：

1. TIS主干逻辑 [https://github.com/qlangtech/tis](https://github.com/qlangtech/tis)
2. TIS插件 [https://github.com/qlangtech/plugins](https://github.com/qlangtech/plugins)
3. 前端逻辑 [https://github.com/qlangtech/ng-tis](https://github.com/qlangtech/ng-tis)

分别将他们clone到本地目录中

```shell script

    git clone git@github.com:qlangtech/tis.git
    
    git clone git@github.com:qlangtech/plugins.git
    
    git clone git@github.com:qlangtech/ng-tis.git
```

### 编译&构建

#### Maven setting.xml 修改
由于TIS对DataX项目进行Fork单独Deploy到TIS的Maven仓库中，另外依赖了Jenkins仓库的代码，在编译项目之前需要将本地maven仓库中 `MAVEN_HOME/config/setting.xml` 文件配置进行修改，

详细请参照：[https://github.com/qlangtech/tis-ansible/blob/master/template/settings.xml.j2](https://github.com/qlangtech/tis-ansible/blob/master/template/settings.xml.j2) ,开发者只需将示例中的
`qlangtech` ， `jenkins` 两个profile相关的配置拷贝到本地maven配置中即可。

TIS使用的Maven推荐使用**v3.8.1** 版本

#### 编译 qlangtech/tis 项目

```shell script
cd tis
mvn clean install -Dmaven.test.skip=true 
```

 {{% alert warning %}}
  由于qlangtech/plugins 项目需要依赖 qlangtech/tis 中的artifact，因此以上Maven执行命令中需要使用**install** 
 {{% /alert %}} 


#### 编译 qlangtech/plugins 项目

```shell script
cd plugins
mvn clean package -Dmaven.test.skip=true -Dappname=all
```

#### 构建 qlangtech/ng-tis

为了加速ng-tis构建速度，需要先执行下载

```shell script
cd ng-tis
wget http://tis-release.oss-cn-beijing.aliyuncs.com/tis-console-ng-node-modules.tar.gz
tar xvf tis-console-ng-node-modules.tar.gz
```

已经事先对本地项目中**node_modules**中npm依赖包进行打包

### 启动&调试

#### 安装数据库

1. 需要准备一个MySQL5.7节点
2. 执行Sql脚本[https://github.com/qlangtech/tis-ansible/blob/master/tis_console_mysql.sql](https://github.com/qlangtech/tis-ansible/blob/master/tis_console_mysql.sql)进行tis_console数据库初始化
3. 本地项目中配置数据库连接信息
   配置文件路径：/tis/tis-web-config/config.properties
   
   ```properties
    tis.datasource.type=mysql
    tis.datasource.url=192.168.28.1
    tis.datasource.port=3306
    tis.datasource.username=root
    tis.datasource.password=111111
    tis.datasource.dbname=tis_console
    zk.host=192.168.28.1:2181/tis/cloud
    
    assemble.host=192.168.28.1
    tis.host=192.168.28.1
   ```
   
   以上配置文件中IP相关都可以配置成本地IP地址
   
#### plugin软链接

由于TIS启动会默认到本地目录`/opt/data/tis/libs/plugins`中加载插件，所以需要将之前plugins项目打包之后生成的plugins软链到 `/opt/data/tis/libs/plugins`

具体执行命令为：

```shell script

for f in `find ./plugins  -name '*.tpi' -print`
do
   echo " ln -s $f "
   ln -s $f /opt/data/tis/libs/plugins/${f##*/}
done ;

```

#### 启动TIS

1. cd tis/tis-console/src/test/java/
2. 运行 StartTISWeb 单元测试
   
   启动过程需要指定以下JVM参数：
   
   ```shell script
     -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=50001 -Dtis.launch.port=9999
   ```
   开启50001的远程调试端口，并且以9999端口运行http servlet
   
#### 启动TIS Web

1.  cd ng-tis
2.  运行 npm run ng:serve-jit --scripts-prepend-node-path=auto
