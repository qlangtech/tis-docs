---
title: TIS插件包列表
linktitle: TIS插件包列表
date: 2014-03-10
type: book
weight : 10
---

## 插件名：tis-aliyun-fs-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-aliyun-fs-plugin.tpi

* **介绍：** 

	
	对阿里云**OSS**进行封装，作为TIS底层FS使用
* **扩展列表：** 

	* [com.qlangtech.tis.offline.FileSystemFactory]({{< relref "./plugins/#扩展点comqlangtechtisofflineFileSystemFactory">}})

		 * [com.qlangtech.tis.plugin.fs.aliyun.oss.AliyunOSSFileSystemFactory]({{< relref "./plugins/#AliyunOSSFileSystemFactory">}})

## 插件名：tis-asyncmsg-rocketmq-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-asyncmsg-rocketmq-plugin.tpi

* **介绍：** 

	对RocketMQ进行进行封装，对接各种实时流消息（例如，MySQL binlog）执行流计算，可在TIS中构建实时同步的物化视图
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.AbstractAsyncMsgDeserialize]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplAbstractAsyncMsgDeserialize">}})

		 * [com.qlangtech.async.message.client.to.impl.DefaultJSONFormatDeserialize]({{< relref "./plugins/#DefaultJSONFormatDeserialize">}})

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplMQListenerFactory">}})

		 * [com.qlangtech.async.message.client.consumer.RocketMQListenerFactory]({{< relref "./plugins/#RocketMQListenerFactory">}})

## 插件名：tis-datax-cassandra-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-cassandra-plugin.tpi

* **介绍：** 

	
	* 对Cassandra NoSql数据源进行封装,使TIS能以**Cassandra**作为数据源的表。
	* 支持以**Cassandra**作为目标源的DataX Reader和Writer
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXCassandraReader]({{< relref "./plugins/#DataXCassandraReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXCassandraWriter]({{< relref "./plugins/#DataXCassandraWriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.cassandra.CassandraDatasourceFactory]({{< relref "./plugins/#CassandraDatasourceFactory">}})

## 插件名：tis-datax-clickhouse-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-clickhouse-plugin.tpi

* **介绍：** 

	* 实现Clickhouse数据源
	    
	  支持定义Clickhouse的数据源，为定义`ClickhouseWriter`插件提供支持
	  
	* 支持Clickhouse类型的 DataX Writer插件
	  
	  1. ClickhouseWriter 插件实现了写入数据到 Clickhouse库的目的表的功能。
	  
	  2. ClickhouseWriter 面向ETL开发工程师，他们使用 ClickhouseWriter 从数仓导入数据到 Clickhouse。同时 ClickhouseWriter 亦可以作为数据迁移工具为DBA等用户提供服务
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXClickhouseWriter]({{< relref "./plugins/#DataXClickhouseWriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.clickhouse.ClickHouseDataSourceFactory]({{< relref "./plugins/#ClickHouseDataSourceFactory">}})

## 插件名：tis-datax-common-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-common-plugin.tpi

* **介绍：** 

	* 定义DataxProcessor实现录入DataX实例基本信息的功能
	
	* 为其他DataX Reader、Writer插件提供了公共类
	
	* 定义DataXGlobalConfig，提供DataX配置的基础配置参数，如：channel,errorLimitCount 等
	
	* 提供了DataX 任务提交方式的实现
	  
	  1. `LocalDataXJobSubmit`本地任务提交
	  2. `DistributedOverseerDataXJobSubmit`基于K8S的分布式任务提交方式（生产环境中建议使用该种提交方式）
* **扩展列表：** 

	* [com.qlangtech.tis.manage.IAppSource]({{< relref "./plugins/#扩展点comqlangtechtismanageIAppSource">}})

		 * [com.qlangtech.tis.plugin.datax.DefaultDataxProcessor]({{< relref "./plugins/#DefaultDataxProcessor">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigParamsConfig">}})

		 * [com.qlangtech.tis.plugin.datax.DataXGlobalConfig]({{< relref "./plugins/#DataXGlobalConfig">}})

		 * [com.qlangtech.tis.plugin.aliyun.HttpEndpoint]({{< relref "./plugins/#HttpEndpoint">}})

## 插件名：tis-datax-common-rdbms-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-common-rdbms-plugin.tpi

* **扩展列表：** 

## 插件名：tis-datax-doris-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-doris-plugin.tpi

* **介绍：** 

	* DorisWriter / StarRocksWriter  
	
	    插件实现了写入数据到 StarRocks/Doris 主库的目的表的功能。在底层实现上，StarRocksWriter 通过Streamload以csv格式导入数据至StarRocks。
	    [详细](https://github.com/StarRocks/DataX/blob/main/starrockswriter/doc/starrockswriter.md)
	    
	    该插件现同时支持StarRocks和Doris两种数据库
	    
	* DorisSourceFactory / StarRocksSourceFactory
	
	  支持定义Doris和StarRocks两种类型的数据源   
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.starrocks.DataXStarRocksWriter]({{< relref "./plugins/#DataXStarRocksWriter">}})

		 * [com.qlangtech.tis.plugin.datax.doris.DataXDorisWriter]({{< relref "./plugins/#DataXDorisWriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.starrocks.StarRocksSourceFactory]({{< relref "./plugins/#StarRocksSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.doris.DorisSourceFactory]({{< relref "./plugins/#DorisSourceFactory">}})

## 插件名：tis-datax-elasticsearch-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-elasticsearch-plugin.tpi

* **介绍：** 

	* 数据导入elasticsearch的插件
	
	  使用elasticsearch的rest api接口， 批量把从reader读入的数据写入elasticsearch[详细](https://github.com/alibaba/DataX/blob/master/elasticsearchwriter/doc/elasticsearchwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXElasticsearchWriter]({{< relref "./plugins/#DataXElasticsearchWriter">}})

## 插件名：tis-datax-ftp-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-ftp-plugin.tpi

* **介绍：** 

	* FtpReader 封装alibaba DataX功能，提供了读取远程FTP文件系统数据存储的能力。在底层实现上，FtpReader获取远程FTP文件数据，并转换为DataX传输协议传递给Writer。[详细](https://github.com/alibaba/DataX/blob/master/ftpreader/doc/ftpreader.md)
	* FtpWriter 封装aliabab DataX功能，提供了向远程FTP文件写入CSV格式的一个或者多个文件，在底层实现上，FtpWriter将DataX传输协议下的数据转换为csv格式，并使用FTP相关的网络协议写出到远程FTP服务器。[详细](https://github.com/alibaba/DataX/blob/master/ftpwriter/doc/ftpwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXFtpReader]({{< relref "./plugins/#DataXFtpReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXFtpWriter]({{< relref "./plugins/#DataXFtpWriter">}})

## 插件名：tis-datax-local-executor.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-local-executor.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.datax.DataXJobSubmit]({{< relref "./plugins/#扩展点comqlangtechtisdataxDataXJobSubmit">}})

		 * [com.qlangtech.tis.plugin.datax.DistributedOverseerDataXJobSubmit]({{< relref "./plugins/#DistributedOverseerDataXJobSubmit">}})

		 * [com.qlangtech.tis.plugin.datax.LocalDataXJobSubmit]({{< relref "./plugins/#LocalDataXJobSubmit">}})

## 插件名：tis-datax-mongodb-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-mongodb-plugin.tpi

* **介绍：** 

	* MongoDB DataSource 插件封装了MongoDB作为数据源的插件，可以向TIS导入MongoDB的数据表进行后续处理
	* MongoDBReader 封装alibaba DataX reader，插件利用 MongoDB 的java客户端MongoClient进行MongoDB的读操作。最新版本的Mongo已经将DB锁的粒度从DB级别降低到document级别，配合上MongoDB强大的索引功能，基本可以达到高性能的读取MongoDB的需求。[详细](https://github.com/alibaba/DataX/blob/master/mongodbreader/doc/mongodbreader.md)
	* MongoDBWriter 封装alibaba DataX writer，插件利用 MongoDB 的java客户端MongoClient进行MongoDB的写操作。最新版本的Mongo已经将DB锁的粒度从DB级别降低到document级别，配合上MongoDB强大的索引功能，基本可以满足数据源向MongoDB写入数据的需求，针对数据更新的需求，通过配置业务主键的方式也可以实现[详细](https://github.com/alibaba/DataX/blob/master/mongodbwriter/doc/mongodbwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXMongodbReader]({{< relref "./plugins/#DataXMongodbReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXMongodbWriter]({{< relref "./plugins/#DataXMongodbWriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.mangodb.MangoDBDataSourceFactory]({{< relref "./plugins/#MangoDBDataSourceFactory">}})

## 插件名：tis-datax-oracle-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-oracle-plugin.tpi

* **介绍：** 

	* 封装Oracle作为数据源的DataSource插件，可以向TIS导入Oracle中的数据表作后续分析处理
	* OracleReader
	  
	  实现了alibaba DataXReader从Oracle读取数据。在底层实现上，OracleReader通过JDBC连接远程Oracle数据库，并执行相应的sql语句将数据从Oracle库中SELECT出来。[详细](https://github.com/alibaba/DataX/blob/master/oraclereader/doc/oraclereader.md)
	
	* OracleWriter
	
	 实现了alibaba DataXWriter写入数据到 Oracle 主库的目的表的功能。在底层实现上， OracleWriter 通过 JDBC 连接远程 Oracle 数据库，并执行相应的 insert into ... sql 语句将数据写入 Oracle，内部会分批次提交入库。
	 
	 OracleWriter 面向ETL开发工程师，他们使用 OracleWriter 从数仓导入数据到 Oracle。同时 OracleWriter 亦可以作为数据迁移工具为DBA等用户提供服务。 [详细](https://github.com/alibaba/DataX/blob/master/oraclewriter/doc/oraclewriter.md) 
	  
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOracleReader]({{< relref "./plugins/#DataXOracleReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOracleWriter]({{< relref "./plugins/#DataXOracleWriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.oracle.OracleDataSourceFactory]({{< relref "./plugins/#OracleDataSourceFactory">}})

## 插件名：tis-datax-oss-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-oss-plugin.tpi

* **介绍：** 

	为Alibaba DataX OOS reader、writer插件提供基于UI的开箱即用的插件实现
	
	* OSSReader提供了读取OSS数据存储的能力。在底层实现上，OSSReader使用OSS官方Java SDK获取OSS数据，并转换为DataX传输协议传递给Writer。[详细](https://github.com/alibaba/DataX/blob/master/ossreader/doc/ossreader.md)
	* OSSWriter提供了向OSS写入类CSV格式的一个或者多个表文件。[详细](https://github.com/alibaba/DataX/blob/master/osswriter/doc/osswriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOssReader]({{< relref "./plugins/#DataXOssReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOssWriter]({{< relref "./plugins/#DataXOssWriter">}})

## 插件名：tis-datax-postgresql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-postgresql-plugin.tpi

* **介绍：** 

	* 封装PostgreSQL作为数据源的DataSource插件，可以向TIS导入PostgreSQL中的数据表作后续分析处理
	* PostgresqlReader
	  
	  实现了Alibaba DataXReader从PostgreSQL读取数据。在底层实现上，PostgresqlReader通过JDBC连接远程PostgreSQL数据库，并执行相应的sql语句将数据从PostgreSQL库中SELECT出来[详细](https://github.com/alibaba/DataX/blob/master/postgresqlreader/doc/postgresqlreader.md)
	* PostgresqlWriter
	
	  实现了Alibaba DataXWriter 插件，写入数据到 PostgreSQL主库目的表的功能。在底层实现上，PostgresqlWriter通过JDBC连接远程 PostgreSQL 数据库，并执行相应的 insert into ... sql 语句将数据写入 PostgreSQL，内部会分批次提交入库。 [详细](https://github.com/alibaba/DataX/blob/master/postgresqlwriter/doc/postgresqlwriter.md)
	  
	* 使用postgresql JDBC驱动（Java JDBC 4.2 (JRE 8+) driver for PostgreSQL database），版本：**42.3.1** [https://github.com/pgjdbc/pgjdbc](https://github.com/pgjdbc/pgjdbc)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXPostgresqlReader]({{< relref "./plugins/#DataXPostgresqlReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXPostgresqlWriter]({{< relref "./plugins/#DataXPostgresqlWriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.postgresql.PGDataSourceFactory]({{< relref "./plugins/#PGDataSourceFactory">}})

## 插件名：tis-datax-sqlserver-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-datax-sqlserver-plugin.tpi

* **介绍：** 

	* 封装SqlServer作为数据源的DataSource插件，可以向TIS导入SqlServer中的数据表作后续分析处理
	* SqlServerReader
	
	  插件实现了从SqlServer读取数据。在底层实现上，SqlServerReader通过JDBC连接远程SqlServer数据库，并执行相应的sql语句将数据从SqlServer库中SELECT出来。[详细](https://github.com/alibaba/DataX/blob/master/sqlserverreader/doc/sqlserverreader.md)
	  
	* PostgresqlWriter
	
	  实现了Alibaba DataXWriter 插件，写入数据到 PostgreSQL主库目的表的功能。在底层实现上，PostgresqlWriter通过JDBC连接远程 PostgreSQL 数据库，并执行相应的 insert into ... sql 语句将数据写入 PostgreSQL，内部会分批次提交入库。 [详细](https://github.com/alibaba/DataX/blob/master/postgresqlwriter/doc/postgresqlwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXSqlserverReader]({{< relref "./plugins/#DataXSqlserverReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXSqlserverWriter]({{< relref "./plugins/#DataXSqlserverWriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.sqlserver.SqlServerDatasourceFactory]({{< relref "./plugins/#SqlServerDatasourceFactory">}})

## 插件名：tis-ds-mysql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-ds-mysql-plugin.tpi

* **介绍：** 

	* 封装MySQL作为数据源的DataSource插件，可以向TIS导入MySQL中的数据表作后续分析处理
	* MysqlReader
	
	  MysqlReader插件实现了从Mysql读取数据。在底层实现上，MysqlReader通过JDBC连接远程Mysql数据库，并执行相应的sql语句将数据从mysql库中SELECT出来[详细](https://github.com/alibaba/DataX/blob/master/mysqlreader/doc/mysqlreader.md)
	  
	* MysqlWriter
	
	  实现了Alibaba DataXWriter 插件，写入数据到 Mysql 主库的目的表的功能。在底层实现上， MysqlWriter 通过 JDBC 连接远程 Mysql 数据库，并执行相应的 insert into ... 或者 ( replace into ...) 的 sql 语句将数据写入 Mysql，内部会分批次提交入库，需要数据库本身采用 innodb 引擎。 [详细](https://github.com/alibaba/DataX/blob/master/mysqlwriter/doc/mysqlwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataxMySQLReader]({{< relref "./plugins/#DataxMySQLReader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataxMySQLWriter]({{< relref "./plugins/#DataxMySQLWriter">}})

## 插件名：tis-ds-mysql-v5-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-ds-mysql-v5-plugin.tpi

* **介绍：** 

	* 封装MySQL数据源驱动
	  
	  驱动版本为mysql-connector-java:5.1.30, 支持MySQL服务端5.X的数据源以JDBC的方式连接
* **扩展列表：** 

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.mysql.MySQLV5DataSourceFactory]({{< relref "./plugins/#MySQLV5DataSourceFactory">}})

## 插件名：tis-ds-mysql-v8-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-ds-mysql-v8-plugin.tpi

* **介绍：** 

	* 封装MySQL数据源驱动
	  
	  驱动版本为mysql-connector-java:8.0.25, 支持MySQL服务端8.X的数据源以JDBC的方式连接
* **扩展列表：** 

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.mysql.MySQLV8DataSourceFactory]({{< relref "./plugins/#MySQLV8DataSourceFactory">}})

## 插件名：tis-ds-tidb-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-ds-tidb-plugin.tpi

* **介绍：** 

	* 封装TiDB作为数据源的DataSource插件
	* DataXTiDBReader
	
	  DataXTiDBReader插件实现了从TiKV读取数据。在底层实现上，可以向TIS导入TiDB中的数据表作后续分析处理。
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXTiDBReader]({{< relref "./plugins/#DataXTiDBReader">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsDataSourceFactory">}})

		 * [com.qlangtech.tis.plugin.ds.tidb.TiKVDataSourceFactory]({{< relref "./plugins/#TiKVDataSourceFactory">}})

## 插件名：tis-flink-cdc-mongdb-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-flink-cdc-mongdb-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplMQListenerFactory">}})

		 * [com.qlangtech.plugins.incr.flink.cdc.mongdb.FlinkCDCMongoDBSourceFactory]({{< relref "./plugins/#FlinkCDCMongoDBSourceFactory">}})

## 插件名：tis-flink-cdc-mysql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-flink-cdc-mysql-plugin.tpi

* **介绍：** 

	
	## MySQL CDC Connector
	
	The MySQL CDC connector allows for reading snapshot data and incremental data from MySQL database. This document describes how to setup the MySQL CDC connector to run SQL queries against MySQL databases.
	[https://ververica.github.io/flink-cdc-connectors/master/content/connectors/mysql-cdc.html](https://ververica.github.io/flink-cdc-connectors/master/content/connectors/mysql-cdc.html)
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplMQListenerFactory">}})

		 * [com.qlangtech.plugins.incr.flink.cdc.mysql.FlinkCDCMySQLSourceFactory]({{< relref "./plugins/#FlinkCDCMySQLSourceFactory">}})

## 插件名：tis-flink-cdc-oracle-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-flink-cdc-oracle-plugin.tpi

* **介绍：** 

	
	## Oracle CDC Connector
	
	The Oracle CDC connector allows for reading snapshot data and incremental data from Oracle database. This document describes how to setup the Oracle CDC connector to run SQL queries against Oracle databases.
	[https://ververica.github.io/flink-cdc-connectors/master/content/connectors/oracle-cdc.html#startup-reading-position](https://ververica.github.io/flink-cdc-connectors/master/content/connectors/oracle-cdc.html#startup-reading-position)
	
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplMQListenerFactory">}})

		 * [com.qlangtech.plugins.incr.flink.cdc.oracle.FlinkCDCOracleSourceFactory]({{< relref "./plugins/#FlinkCDCOracleSourceFactory">}})

## 插件名：tis-flink-cdc-postgresql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-flink-cdc-postgresql-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplMQListenerFactory">}})

		 * [com.qlangtech.plugins.incr.flink.cdc.postgresql.FlinkCDCPostreSQLSourceFactory]({{< relref "./plugins/#FlinkCDCPostreSQLSourceFactory">}})

## 插件名：tis-flink-dependency.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-flink-dependency.tpi

* **扩展列表：** 

## 插件名：tis-hive-flat-table-builder-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-hive-flat-table-builder-plugin.tpi

* **介绍：** 

	* 支持将数据写入到HDFS分布式存储中
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxReader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXHdfsReader]({{< relref "./plugins/#DataXHdfsReader">}})

	* [com.qlangtech.tis.offline.FlatTableBuilder]({{< relref "./plugins/#扩展点comqlangtechtisofflineFlatTableBuilder">}})

		 * [com.qlangtech.tis.offline.flattable.HiveFlatTableBuilder]({{< relref "./plugins/#HiveFlatTableBuilder">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximplDataxWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXSparkWriter]({{< relref "./plugins/#DataXSparkWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXHiveWriter]({{< relref "./plugins/#DataXHiveWriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXHdfsWriter]({{< relref "./plugins/#DataXHdfsWriter">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigParamsConfig">}})

		 * [com.qlangtech.tis.hive.DefaultHiveConnGetter]({{< relref "./plugins/#DefaultHiveConnGetter">}})

		 * [com.qlangtech.tis.config.yarn.YarnConfig]({{< relref "./plugins/#YarnConfig">}})

	* [com.qlangtech.tis.offline.FileSystemFactory]({{< relref "./plugins/#扩展点comqlangtechtisofflineFileSystemFactory">}})

		 * [com.qlangtech.tis.hdfs.impl.HdfsFileSystemFactory]({{< relref "./plugins/#HdfsFileSystemFactory">}})

## 插件名：tis-k8s-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-k8s-plugin.tpi

* **介绍：** 

	* 支持将将TIS中的部分任务提交到K8S容器中执行
	
	  现支持以下这些任务类型：
	  
	  1. Alibaba DataX任务
	  2. 数据实时增量同步任务
* **扩展列表：** 

	* [com.qlangtech.tis.datax.job.DataXJobWorker]({{< relref "./plugins/#扩展点comqlangtechtisdataxjobDataXJobWorker">}})

		 * [com.qlangtech.tis.plugin.datax.K8SDataXJobWorker]({{< relref "./plugins/#K8SDataXJobWorker">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigParamsConfig">}})

		 * [com.qlangtech.tis.config.k8s.impl.DefaultK8sContext]({{< relref "./plugins/#DefaultK8sContext">}})

	* [com.qlangtech.tis.plugin.k8s.K8sImage]({{< relref "./plugins/#扩展点comqlangtechtisplugink8sK8sImage">}})

		 * [com.qlangtech.tis.config.k8s.impl.DefaultK8SImage]({{< relref "./plugins/#DefaultK8SImage">}})

## 插件名：tis-kafka-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-kafka-plugin.tpi

* **介绍：** 

	* 支持以Kafka作为消息源的实时计算Source
	* TiCDC的消费端，监听TiDB中的增量消息
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplMQListenerFactory">}})

		 * [com.qlangtech.async.message.client.kafka.TiKVKafkaMQListenerFactory]({{< relref "./plugins/#TiKVKafkaMQListenerFactory">}})

## 插件名：tis-realtime-flink.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-realtime-flink.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.datax.job.DataXJobWorker]({{< relref "./plugins/#扩展点comqlangtechtisdataxjobDataXJobWorker">}})

		 * [com.qlangtech.plugins.incr.flink.cluster.FlinkK8SClusterManager]({{< relref "./plugins/#FlinkK8SClusterManager">}})

	* [com.qlangtech.tis.plugin.incr.IncrStreamFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrIncrStreamFactory">}})

		 * [com.qlangtech.plugins.incr.flink.launch.TISFlinkCDCStreamFactory]({{< relref "./plugins/#TISFlinkCDCStreamFactory">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigParamsConfig">}})

		 * [com.qlangtech.plugins.incr.flink.common.FlinkCluster]({{< relref "./plugins/#FlinkCluster">}})

## 插件名：tis-sink-clickhouse-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-sink-clickhouse-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrTISSinkFactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.clickhouse.ClickHouseSinkFactory]({{< relref "./plugins/#ClickHouseSinkFactory">}})

## 插件名：tis-sink-elasticsearch7-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-sink-elasticsearch7-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrTISSinkFactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.elasticsearch7.ElasticSearchSinkFactory]({{< relref "./plugins/#ElasticSearchSinkFactory">}})

## 插件名：tis-sink-starrocks-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.4.0/tis-plugin/tis-sink-starrocks-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrTISSinkFactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.starrocks.StarRocksSinkFactory]({{< relref "./plugins/#StarRocksSinkFactory">}})





