---
title: TIS插件包列表
linktitle: TIS插件包列表
date: 2014-03-10
type: book
weight : 10
---

## tis-aliyun-fs-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-aliyun-fs-plugin.tpi

* **介绍：** 

	
	对阿里云**OSS**进行封装，作为TIS底层FS使用
* **扩展列表：** 

## tis-asyncmsg-rocketmq-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-asyncmsg-rocketmq-plugin.tpi

* **介绍：** 

	对RocketMQ进行进行封装，对接各种实时流消息（例如，MySQL binlog）执行流计算，可在TIS中构建实时同步的物化视图
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.AbstractAsyncMsgDeserialize]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplabstractasyncmsgdeserialize">}})

		 * [com.qlangtech.async.message.client.to.impl.DefaultJSONFormatDeserialize]({{< relref "./plugins/#comqlangtechasyncmessageclienttoimpldefaultjsonformatdeserialize">}})

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplmqlistenerfactory">}})

		 * [com.qlangtech.async.message.client.consumer.RocketMQListenerFactory]({{< relref "./plugins/#comqlangtechasyncmessageclientconsumerrocketmqlistenerfactory">}})

## tis-chunjun-base-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-chunjun-base-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.plugins.incr.flink.connector.UpdateMode]({{< relref "./plugins/#扩展点comqlangtechtispluginsincrflinkconnectorupdatemode">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.impl.ReplaceType]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorimplreplacetype">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.impl.UpdateType]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorimplupdatetype">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.impl.InsertType]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorimplinserttype">}})

	* [com.qlangtech.plugins.incr.flink.chunjun.poll.Polling]({{< relref "./plugins/#扩展点comqlangtechpluginsincrflinkchunjunpollpolling">}})

		 * [com.qlangtech.plugins.incr.flink.chunjun.poll.RunInterval]({{< relref "./plugins/#comqlangtechpluginsincrflinkchunjunpollruninterval">}})

	* [com.qlangtech.tis.plugin.datax.IncrSelectedTabExtend]({{< relref "./plugins/#扩展点comqlangtechtisplugindataxincrselectedtabextend">}})

		 * [com.qlangtech.plugins.incr.flink.chunjun.source.SelectedTabPropsExtends]({{< relref "./plugins/#comqlangtechpluginsincrflinkchunjunsourceselectedtabpropsextends">}})

		 * [com.qlangtech.plugins.incr.flink.chunjun.sink.SinkTabPropsExtends]({{< relref "./plugins/#comqlangtechpluginsincrflinkchunjunsinksinktabpropsextends">}})

## tis-datax-cassandra-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-cassandra-plugin.tpi

* **介绍：** 

	
	* 对Cassandra NoSql数据源进行封装,使TIS能以**Cassandra**作为数据源的表。
	* 支持以**Cassandra**作为目标源的DataX Reader和Writer
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXCassandraReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxcassandrareader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXCassandraWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxcassandrawriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.cassandra.CassandraDatasourceFactory]({{< relref "./plugins/#comqlangtechtisplugindscassandracassandradatasourcefactory">}})

## tis-datax-clickhouse-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-clickhouse-plugin.tpi

* **介绍：** 

	* 实现Clickhouse数据源
	    
	  支持定义Clickhouse的数据源，为定义`ClickhouseWriter`插件提供支持
	  
	* 支持Clickhouse类型的 DataX Writer插件
	  
	  1. ClickhouseWriter 插件实现了写入数据到 Clickhouse库的目的表的功能。
	  
	  2. ClickhouseWriter 面向ETL开发工程师，他们使用 ClickhouseWriter 从数仓导入数据到 Clickhouse。同时 ClickhouseWriter 亦可以作为数据迁移工具为DBA等用户提供服务
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXClickhouseWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxclickhousewriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.clickhouse.ClickHouseDataSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindsclickhouseclickhousedatasourcefactory">}})

## tis-datax-common-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-common-plugin.tpi

* **介绍：** 

	* 定义DataxProcessor实现录入DataX实例基本信息的功能
	
	* 为其他DataX Reader、Writer插件提供了公共类
	
	* 定义DataXGlobalConfig，提供DataX配置的基础配置参数，如：channel,errorLimitCount 等
	
	* 提供了DataX 任务提交方式的实现
	  
	  1. `LocalDataXJobSubmit`本地任务提交
	  2. `DistributedOverseerDataXJobSubmit`基于K8S的分布式任务提交方式（生产环境中建议使用该种提交方式）
* **扩展列表：** 

	* [com.qlangtech.tis.manage.IAppSource]({{< relref "./plugins/#扩展点comqlangtechtismanageiappsource">}})

		 * [com.qlangtech.tis.plugin.datax.DefaultDataxProcessor]({{< relref "./plugins/#comqlangtechtisplugindataxdefaultdataxprocessor">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigparamsconfig">}})

		 * [com.qlangtech.tis.plugin.datax.DataXGlobalConfig]({{< relref "./plugins/#comqlangtechtisplugindataxdataxglobalconfig">}})

		 * [com.qlangtech.tis.plugin.aliyun.HttpEndpoint]({{< relref "./plugins/#comqlangtechtispluginaliyunhttpendpoint">}})

## tis-datax-common-rdbms-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-common-rdbms-plugin.tpi

* **扩展列表：** 

## tis-datax-doris-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-doris-plugin.tpi

* **介绍：** 

	* DorisWriter / StarRocksWriter  
	
	    插件实现了写入数据到 StarRocks/Doris 主库的目的表的功能。在底层实现上，StarRocksWriter 通过Streamload以csv格式导入数据至StarRocks。
	    [详细](https://github.com/StarRocks/DataX/blob/main/starrockswriter/doc/starrockswriter.md)
	    
	    该插件现同时支持StarRocks和Doris两种数据库
	    
	* DorisSourceFactory / StarRocksSourceFactory
	
	  支持定义Doris和StarRocks两种类型的数据源   
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.starrocks.DataXStarRocksWriter]({{< relref "./plugins/#comqlangtechtisplugindataxstarrocksdataxstarrockswriter">}})

		 * [com.qlangtech.tis.plugin.datax.doris.DataXDorisWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdorisdataxdoriswriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.starrocks.StarRocksSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindsstarrocksstarrockssourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.doris.DorisSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindsdorisdorissourcefactory">}})

## tis-datax-elasticsearch-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-elasticsearch-plugin.tpi

* **介绍：** 

	* 数据导入elasticsearch的插件
	
	  使用elasticsearch的rest api接口， 批量把从reader读入的数据写入elasticsearch[详细](https://github.com/alibaba/DataX/blob/master/elasticsearchwriter/doc/elasticsearchwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXElasticsearchWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxelasticsearchwriter">}})

## tis-datax-ftp-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-ftp-plugin.tpi

* **介绍：** 

	* FtpReader 封装alibaba DataX功能，提供了读取远程FTP文件系统数据存储的能力。在底层实现上，FtpReader获取远程FTP文件数据，并转换为DataX传输协议传递给Writer。[详细](https://github.com/alibaba/DataX/blob/master/ftpreader/doc/ftpreader.md)
	* FtpWriter 封装aliabab DataX功能，提供了向远程FTP文件写入CSV格式的一个或者多个文件，在底层实现上，FtpWriter将DataX传输协议下的数据转换为csv格式，并使用FTP相关的网络协议写出到远程FTP服务器。[详细](https://github.com/alibaba/DataX/blob/master/ftpwriter/doc/ftpwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXFtpReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxftpreader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXFtpWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxftpwriter">}})

## tis-datax-hdfs-plugin_hadoop_2.7.3.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-hdfs-plugin/tis-datax-hdfs-plugin_hadoop_2.7.3.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigparamsconfig">}})

		 * [com.qlangtech.tis.kerberos.KerberosCfg]({{< relref "./plugins/#comqlangtechtiskerberoskerberoscfg">}})

	* [com.qlangtech.tis.offline.FileSystemFactory]({{< relref "./plugins/#扩展点comqlangtechtisofflinefilesystemfactory">}})

		 * [com.qlangtech.tis.hdfs.impl.HdfsFileSystemFactory]({{< relref "./plugins/#comqlangtechtishdfsimplhdfsfilesystemfactory">}})

## tis-datax-hdfs-reader-writer-plugin_hadoop_2.7.3.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-hdfs-reader-writer-plugin/tis-datax-hdfs-reader-writer-plugin_hadoop_2.7.3.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXHdfsReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxhdfsreader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXHdfsWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxhdfswriter">}})

## tis-datax-hudi-common_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-hudi-common/tis-datax-hudi-common_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.plugin.datax.SelectedTab]({{< relref "./plugins/#扩展点comqlangtechtisplugindataxselectedtab">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.HudiSelectedTab]({{< relref "./plugins/#comqlangtechtisplugindataxhudihudiselectedtab">}})

## tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi

* **介绍：** 

	封装[Apache Hudi](https://hudi.apache.org/)，为用户提供一站式、开箱即用的千表入湖的解决方案
	
	功能：
	
	本组件整合Hudi提供的[DeltaStreamer](https://hudi.apache.org/docs/hoodie_deltastreamer#deltastreamer)功能，通过TIS生成成DeltaStreamer需要的所有Hudi表摄入所需要的
	所有配置信息（Avro schemas、从数据源抽取数据的DataX配置，Hudi表分区信息及 [Key Generation](https://hudi.apache.org/docs/key_generation)配置）
	
	配合TIS提供的各种Source Connnector组件（MySQL，PostgreSQL，SqlServer等）快速实现各种数据源`批量`入湖
	
	
	
	
	
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.DataXHudiWriter]({{< relref "./plugins/#comqlangtechtisplugindataxhudidataxhudiwriter">}})

	* [com.qlangtech.tis.plugin.datax.hudi.spark.SparkSubmitParams]({{< relref "./plugins/#扩展点comqlangtechtisplugindataxhudisparksparksubmitparams">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.spark.SparkSubmitParams]({{< relref "./plugins/#comqlangtechtisplugindataxhudisparksparksubmitparams">}})

	* [com.qlangtech.tis.plugin.datax.hudi.partition.HudiTablePartition]({{< relref "./plugins/#扩展点comqlangtechtisplugindataxhudipartitionhuditablepartition">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.partition.SlashEncodedHourPartition]({{< relref "./plugins/#comqlangtechtisplugindataxhudipartitionslashencodedhourpartition">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.partition.SlashEncodedDayPartition]({{< relref "./plugins/#comqlangtechtisplugindataxhudipartitionslashencodeddaypartition">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.partition.FieldValBasedPartition]({{< relref "./plugins/#comqlangtechtisplugindataxhudipartitionfieldvalbasedpartition">}})

	* [com.qlangtech.tis.plugin.datax.hudi.keygenerator.HudiKeyGenerator]({{< relref "./plugins/#扩展点comqlangtechtisplugindataxhudikeygeneratorhudikeygenerator">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.ComplexKeyGenerator]({{< relref "./plugins/#comqlangtechtisplugindataxhudikeygeneratorimplcomplexkeygenerator">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.NonePartitionKeyGenerator]({{< relref "./plugins/#comqlangtechtisplugindataxhudikeygeneratorimplnonepartitionkeygenerator">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.SimpleKeyGenerator]({{< relref "./plugins/#comqlangtechtisplugindataxhudikeygeneratorimplsimplekeygenerator">}})

		 * [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.TimeStampKeyGenerator]({{< relref "./plugins/#comqlangtechtisplugindataxhudikeygeneratorimpltimestampkeygenerator">}})

## tis-datax-local-embedded-executor.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-local-embedded-executor.tpi

* **介绍：** 

	
	批量任务触发，用于本地功能测试用，请勿用于生成环境
* **扩展列表：** 

	* [com.qlangtech.tis.datax.DataXJobSubmit]({{< relref "./plugins/#扩展点comqlangtechtisdataxdataxjobsubmit">}})

		 * [com.qlangtech.tis.plugin.datax.EmbeddedDataXJobSubmit]({{< relref "./plugins/#comqlangtechtisplugindataxembeddeddataxjobsubmit">}})

## tis-datax-local-executor.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-local-executor.tpi

* **介绍：** 

	
	批量任务触发组件，有两种任务提交方式：
	
	1. 本地独立模式：在本地启动独立进程，特点是占用资源少轻量化。所有批量导入任务都在单个机器节点上执行，所以并发吞肚率比较低
	2. 分布式模式：向分布式队列中提交任务，由驻留在K8S机器中的Woker节点消费批量任务，优点是可以按照批量任务规模，水平扩容K8S集群中的执行节点，达到提高批量任务执行吞吐率
* **扩展列表：** 

	* [com.qlangtech.tis.datax.DataXJobSubmit]({{< relref "./plugins/#扩展点comqlangtechtisdataxdataxjobsubmit">}})

		 * [com.qlangtech.tis.plugin.datax.DistributedOverseerDataXJobSubmit]({{< relref "./plugins/#comqlangtechtisplugindataxdistributedoverseerdataxjobsubmit">}})

		 * [com.qlangtech.tis.plugin.datax.LocalDataXJobSubmit]({{< relref "./plugins/#comqlangtechtisplugindataxlocaldataxjobsubmit">}})

## tis-datax-mongodb-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-mongodb-plugin.tpi

* **介绍：** 

	* MongoDB DataSource 插件封装了MongoDB作为数据源的插件，可以向TIS导入MongoDB的数据表进行后续处理
	* MongoDBReader 封装alibaba DataX reader，插件利用 MongoDB 的java客户端MongoClient进行MongoDB的读操作。最新版本的Mongo已经将DB锁的粒度从DB级别降低到document级别，配合上MongoDB强大的索引功能，基本可以达到高性能的读取MongoDB的需求。[详细](https://github.com/alibaba/DataX/blob/master/mongodbreader/doc/mongodbreader.md)
	* MongoDBWriter 封装alibaba DataX writer，插件利用 MongoDB 的java客户端MongoClient进行MongoDB的写操作。最新版本的Mongo已经将DB锁的粒度从DB级别降低到document级别，配合上MongoDB强大的索引功能，基本可以满足数据源向MongoDB写入数据的需求，针对数据更新的需求，通过配置业务主键的方式也可以实现[详细](https://github.com/alibaba/DataX/blob/master/mongodbwriter/doc/mongodbwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXMongodbReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxmongodbreader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXMongodbWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxmongodbwriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.mangodb.MangoDBDataSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindsmangodbmangodbdatasourcefactory">}})

## tis-datax-oracle-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-oracle-plugin.tpi

* **介绍：** 

	* 封装Oracle作为数据源的DataSource插件，可以向TIS导入Oracle中的数据表作后续分析处理
	* OracleReader
	  
	  实现了alibaba DataXReader从Oracle读取数据。在底层实现上，OracleReader通过JDBC连接远程Oracle数据库，并执行相应的sql语句将数据从Oracle库中SELECT出来。[详细](https://github.com/alibaba/DataX/blob/master/oraclereader/doc/oraclereader.md)
	
	* OracleWriter
	
	 实现了alibaba DataXWriter写入数据到 Oracle 主库的目的表的功能。在底层实现上， OracleWriter 通过 JDBC 连接远程 Oracle 数据库，并执行相应的 insert into ... sql 语句将数据写入 Oracle，内部会分批次提交入库。
	 
	 OracleWriter 面向ETL开发工程师，他们使用 OracleWriter 从数仓导入数据到 Oracle。同时 OracleWriter 亦可以作为数据迁移工具为DBA等用户提供服务。 [详细](https://github.com/alibaba/DataX/blob/master/oraclewriter/doc/oraclewriter.md) 
	  
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOracleReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxoraclereader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOracleWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxoraclewriter">}})

	* [com.qlangtech.tis.plugin.ds.oracle.ConnEntity]({{< relref "./plugins/#扩展点comqlangtechtisplugindsoracleconnentity">}})

		 * [com.qlangtech.tis.plugin.ds.oracle.impl.SIDConnEntity]({{< relref "./plugins/#comqlangtechtisplugindsoracleimplsidconnentity">}})

		 * [com.qlangtech.tis.plugin.ds.oracle.impl.ServiceNameConnEntity]({{< relref "./plugins/#comqlangtechtisplugindsoracleimplservicenameconnentity">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.oracle.OracleDataSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindsoracleoracledatasourcefactory">}})

## tis-datax-oss-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-oss-plugin.tpi

* **介绍：** 

	为Alibaba DataX OOS reader、writer插件提供基于UI的开箱即用的插件实现
	
	* OSSReader提供了读取OSS数据存储的能力。在底层实现上，OSSReader使用OSS官方Java SDK获取OSS数据，并转换为DataX传输协议传递给Writer。[详细](https://github.com/alibaba/DataX/blob/master/ossreader/doc/ossreader.md)
	* OSSWriter提供了向OSS写入类CSV格式的一个或者多个表文件。[详细](https://github.com/alibaba/DataX/blob/master/osswriter/doc/osswriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOssReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxossreader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXOssWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxosswriter">}})

## tis-datax-postgresql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-postgresql-plugin.tpi

* **介绍：** 

	* 封装PostgreSQL作为数据源的DataSource插件，可以向TIS导入PostgreSQL中的数据表作后续分析处理
	* PostgresqlReader
	  
	  实现了Alibaba DataXReader从PostgreSQL读取数据。在底层实现上，PostgresqlReader通过JDBC连接远程PostgreSQL数据库，并执行相应的sql语句将数据从PostgreSQL库中SELECT出来[详细](https://github.com/alibaba/DataX/blob/master/postgresqlreader/doc/postgresqlreader.md)
	* PostgresqlWriter
	
	  实现了Alibaba DataXWriter 插件，写入数据到 PostgreSQL主库目的表的功能。在底层实现上，PostgresqlWriter通过JDBC连接远程 PostgreSQL 数据库，并执行相应的 insert into ... sql 语句将数据写入 PostgreSQL，内部会分批次提交入库。 [详细](https://github.com/alibaba/DataX/blob/master/postgresqlwriter/doc/postgresqlwriter.md)
	  
	* 使用postgresql JDBC驱动（Java JDBC 4.2 (JRE 8+) driver for PostgreSQL database），版本：**42.3.1** [https://github.com/pgjdbc/pgjdbc](https://github.com/pgjdbc/pgjdbc)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXPostgresqlReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxpostgresqlreader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXPostgresqlWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxpostgresqlwriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.postgresql.PGDataSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindspostgresqlpgdatasourcefactory">}})

## tis-datax-sqlserver-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-datax-sqlserver-plugin.tpi

* **介绍：** 

	* 封装SqlServer作为数据源的DataSource插件，可以向TIS导入SqlServer中的数据表作后续分析处理
	* SqlServerReader
	
	  插件实现了从SqlServer读取数据。在底层实现上，SqlServerReader通过JDBC连接远程SqlServer数据库，并执行相应的sql语句将数据从SqlServer库中SELECT出来。[详细](https://github.com/alibaba/DataX/blob/master/sqlserverreader/doc/sqlserverreader.md)
	  
	* PostgresqlWriter
	
	  实现了Alibaba DataXWriter 插件，写入数据到 PostgreSQL主库目的表的功能。在底层实现上，PostgresqlWriter通过JDBC连接远程 PostgreSQL 数据库，并执行相应的 insert into ... sql 语句将数据写入 PostgreSQL，内部会分批次提交入库。 [详细](https://github.com/alibaba/DataX/blob/master/postgresqlwriter/doc/postgresqlwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXSqlserverReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxsqlserverreader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXSqlserverWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxsqlserverwriter">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.sqlserver.SqlServerDatasourceFactory]({{< relref "./plugins/#comqlangtechtisplugindssqlserversqlserverdatasourcefactory">}})

## tis-ds-mysql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-ds-mysql-plugin.tpi

* **介绍：** 

	* 封装MySQL作为数据源的DataSource插件，可以向TIS导入MySQL中的数据表作后续分析处理
	* MysqlReader
	
	  MysqlReader插件实现了从Mysql读取数据。在底层实现上，MysqlReader通过JDBC连接远程Mysql数据库，并执行相应的sql语句将数据从mysql库中SELECT出来[详细](https://github.com/alibaba/DataX/blob/master/mysqlreader/doc/mysqlreader.md)
	  
	* MysqlWriter
	
	  实现了Alibaba DataXWriter 插件，写入数据到 Mysql 主库的目的表的功能。在底层实现上， MysqlWriter 通过 JDBC 连接远程 Mysql 数据库，并执行相应的 insert into ... 或者 ( replace into ...) 的 sql 语句将数据写入 Mysql，内部会分批次提交入库，需要数据库本身采用 innodb 引擎。 [详细](https://github.com/alibaba/DataX/blob/master/mysqlwriter/doc/mysqlwriter.md)
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataxMySQLReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxmysqlreader">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataxMySQLWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxmysqlwriter">}})

## tis-ds-mysql-v5-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-ds-mysql-v5-plugin.tpi

* **介绍：** 

	* 封装MySQL数据源驱动
	  
	  驱动版本为mysql-connector-java:5.1.30, 支持MySQL服务端5.X的数据源以JDBC的方式连接
* **扩展列表：** 

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.mysql.MySQLV5DataSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindsmysqlmysqlv5datasourcefactory">}})

## tis-ds-mysql-v8-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-ds-mysql-v8-plugin.tpi

* **介绍：** 

	* 封装MySQL数据源驱动
	  
	  驱动版本为mysql-connector-java:8.0.25, 支持MySQL服务端8.X的数据源以JDBC的方式连接
* **扩展列表：** 

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.mysql.MySQLV8DataSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindsmysqlmysqlv8datasourcefactory">}})

## tis-ds-tidb-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-ds-tidb-plugin.tpi

* **介绍：** 

	* 封装TiDB作为数据源的DataSource插件
	* DataXTiDBReader
	
	  DataXTiDBReader插件实现了从TiKV读取数据。在底层实现上，可以向TIS导入TiDB中的数据表作后续分析处理。
* **扩展列表：** 

	* [com.qlangtech.tis.datax.impl.DataxReader]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxreader">}})

		 * [com.qlangtech.tis.plugin.datax.DataXTiDBReader]({{< relref "./plugins/#comqlangtechtisplugindataxdataxtidbreader">}})

	* [com.qlangtech.tis.plugin.ds.DataSourceFactory]({{< relref "./plugins/#扩展点comqlangtechtisplugindsdatasourcefactory">}})

		 * [com.qlangtech.tis.plugin.ds.tidb.TiKVDataSourceFactory]({{< relref "./plugins/#comqlangtechtisplugindstidbtikvdatasourcefactory">}})

## tis-flink-cdc-mongdb-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-flink-cdc-mongdb-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplmqlistenerfactory">}})

		 * [com.qlangtech.plugins.incr.flink.cdc.mongdb.FlinkCDCMongoDBSourceFactory]({{< relref "./plugins/#comqlangtechpluginsincrflinkcdcmongdbflinkcdcmongodbsourcefactory">}})

## tis-flink-cdc-mysql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-flink-cdc-mysql-plugin.tpi

* **介绍：** 

	
	## MySQL CDC Connector
	
	The MySQL CDC connector allows for reading snapshot data and incremental data from MySQL database. This document describes how to setup the MySQL CDC connector to run SQL queries against MySQL databases.
	[https://ververica.github.io/flink-cdc-connectors/master/content/connectors/mysql-cdc.html](https://ververica.github.io/flink-cdc-connectors/master/content/connectors/mysql-cdc.html)
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplmqlistenerfactory">}})

		 * [com.qlangtech.plugins.incr.flink.cdc.mysql.FlinkCDCMySQLSourceFactory]({{< relref "./plugins/#comqlangtechpluginsincrflinkcdcmysqlflinkcdcmysqlsourcefactory">}})

## tis-flink-cdc-oracle-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-flink-cdc-oracle-plugin.tpi

* **介绍：** 

	
	## Oracle CDC Connector
	
	The Oracle CDC connector allows for reading snapshot data and incremental data from Oracle database. This document describes how to setup the Oracle CDC connector to run SQL queries against Oracle databases.
	[https://ververica.github.io/flink-cdc-connectors/master/content/connectors/oracle-cdc.html#startup-reading-position](https://ververica.github.io/flink-cdc-connectors/master/content/connectors/oracle-cdc.html#startup-reading-position)
	
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplmqlistenerfactory">}})

		 * [com.qlangtech.plugins.incr.flink.cdc.oracle.FlinkCDCOracleSourceFactory]({{< relref "./plugins/#comqlangtechpluginsincrflinkcdcoracleflinkcdcoraclesourcefactory">}})

## tis-flink-chunjun-mysql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-flink-chunjun-mysql-plugin.tpi

* **介绍：** 

	* 利用 袋鼠云纯钧 [https://dtstack.github.io/chunjun/](https://dtstack.github.io/chunjun/) 构建 MySQL实时Sink功能，可以将数据实时写入到指定的MySQL数据库当中
	* [MySQL Sink文档](https://dtstack.github.io/chunjun/documents/f3ba64df-5c05-5d97-bfed-51be0c55fdef/)
	* ChunJun 版本：1.12.5
* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrtissinkfactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.sink.MySQLSinkFactory]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorsinkmysqlsinkfactory">}})

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplmqlistenerfactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.source.MySQLSourceFactory]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorsourcemysqlsourcefactory">}})

## tis-flink-chunjun-postgresql-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-flink-chunjun-postgresql-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrtissinkfactory">}})

		 * [com.qlangtech.plugins.incr.flink.chunjun.postgresql.sink.ChunjunPostgreSQLSinkFactory]({{< relref "./plugins/#comqlangtechpluginsincrflinkchunjunpostgresqlsinkchunjunpostgresqlsinkfactory">}})

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplmqlistenerfactory">}})

		 * [com.qlangtech.plugins.incr.flink.chunjun.postgresql.source.ChunjunPostgreSQLSourceFactory]({{< relref "./plugins/#comqlangtechpluginsincrflinkchunjunpostgresqlsourcechunjunpostgresqlsourcefactory">}})

## tis-flink-dependency.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-flink-dependency.tpi

* **扩展列表：** 

## tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi

* **介绍：** 

	* 支持将数据写入到HDFS分布式存储中
* **扩展列表：** 

	* [com.qlangtech.tis.config.spark.SparkConnStrategy]({{< relref "./plugins/#扩展点comqlangtechtisconfigsparksparkconnstrategy">}})

		 * [com.qlangtech.tis.config.spark.impl.YarnConnStrategy]({{< relref "./plugins/#comqlangtechtisconfigsparkimplyarnconnstrategy">}})

		 * [com.qlangtech.tis.config.spark.impl.StandaloneConnStrategy]({{< relref "./plugins/#comqlangtechtisconfigsparkimplstandaloneconnstrategy">}})

	* [com.qlangtech.tis.datax.impl.DataxWriter]({{< relref "./plugins/#扩展点comqlangtechtisdataximpldataxwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXSparkWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxsparkwriter">}})

		 * [com.qlangtech.tis.plugin.datax.DataXHiveWriter]({{< relref "./plugins/#comqlangtechtisplugindataxdataxhivewriter">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigparamsconfig">}})

		 * [com.qlangtech.tis.config.spark.impl.DefaultSparkConnGetter]({{< relref "./plugins/#comqlangtechtisconfigsparkimpldefaultsparkconngetter">}})

		 * [com.qlangtech.tis.config.yarn.YarnConfig]({{< relref "./plugins/#comqlangtechtisconfigyarnyarnconfig">}})

		 * [com.qlangtech.tis.hive.DefaultHiveConnGetter]({{< relref "./plugins/#comqlangtechtishivedefaulthiveconngetter">}})

	* [com.qlangtech.tis.config.hive.HiveUserToken]({{< relref "./plugins/#扩展点comqlangtechtisconfighivehiveusertoken">}})

		 * [com.qlangtech.tis.config.hive.impl.DefaultHiveUserToken]({{< relref "./plugins/#comqlangtechtisconfighiveimpldefaulthiveusertoken">}})

		 * [com.qlangtech.tis.config.hive.impl.KerberosUserToken]({{< relref "./plugins/#comqlangtechtisconfighiveimplkerberosusertoken">}})

		 * [com.qlangtech.tis.config.hive.impl.OffHiveUserToken]({{< relref "./plugins/#comqlangtechtisconfighiveimploffhiveusertoken">}})

## tis-k8s-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-k8s-plugin.tpi

* **介绍：** 

	* 支持将将TIS中的部分任务提交到K8S容器中执行
	
	  现支持以下这些任务类型：
	  
	  1. Alibaba DataX任务
	  2. 数据实时增量同步任务
* **扩展列表：** 

	* [com.qlangtech.tis.datax.job.DataXJobWorker]({{< relref "./plugins/#扩展点comqlangtechtisdataxjobdataxjobworker">}})

		 * [com.qlangtech.tis.plugin.datax.K8SDataXJobWorker]({{< relref "./plugins/#comqlangtechtisplugindataxk8sdataxjobworker">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigparamsconfig">}})

		 * [com.qlangtech.tis.config.k8s.impl.DefaultK8sContext]({{< relref "./plugins/#comqlangtechtisconfigk8simpldefaultk8scontext">}})

	* [com.qlangtech.tis.plugin.k8s.K8sImage]({{< relref "./plugins/#扩展点comqlangtechtisplugink8sk8simage">}})

		 * [com.qlangtech.tis.config.k8s.impl.DefaultK8SImage]({{< relref "./plugins/#comqlangtechtisconfigk8simpldefaultk8simage">}})

## tis-kafka-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-kafka-plugin.tpi

* **介绍：** 

	* 支持以Kafka作为消息源的实时计算Source
	* TiCDC的消费端，监听TiDB中的增量消息
* **扩展列表：** 

	* [com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory]({{< relref "./plugins/#扩展点comqlangtechtisasyncmessageclientconsumerimplmqlistenerfactory">}})

		 * [com.qlangtech.async.message.client.kafka.TiKVKafkaMQListenerFactory]({{< relref "./plugins/#comqlangtechasyncmessageclientkafkatikvkafkamqlistenerfactory">}})

## tis-realtime-flink.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-realtime-flink.tpi

* **介绍：** 

	封装了和Flink任务相关的组件，启动Flink任务需要设置的`CheckPoint`、`statbackend`、`RestartStrategy` 相关配置都封装在该组件中
* **扩展列表：** 

	* [com.qlangtech.tis.datax.job.DataXJobWorker]({{< relref "./plugins/#扩展点comqlangtechtisdataxjobdataxjobworker">}})

		 * [com.qlangtech.plugins.incr.flink.cluster.FlinkK8SClusterManager]({{< relref "./plugins/#comqlangtechpluginsincrflinkclusterflinkk8sclustermanager">}})

	* [com.qlangtech.plugins.incr.flink.launch.StateBackendFactory]({{< relref "./plugins/#扩展点comqlangtechpluginsincrflinklaunchstatebackendfactory">}})

		 * [com.qlangtech.plugins.incr.flink.launch.statbackend.OFF]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchstatbackendoff">}})

		 * [com.qlangtech.plugins.incr.flink.launch.statbackend.FileSystemState]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchstatbackendfilesystemstate">}})

		 * [com.qlangtech.plugins.incr.flink.launch.statbackend.MemoryState]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchstatbackendmemorystate">}})

	* [com.qlangtech.tis.plugin.incr.IncrStreamFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrincrstreamfactory">}})

		 * [com.qlangtech.plugins.incr.flink.launch.TISFlinkCDCStreamFactory]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchtisflinkcdcstreamfactory">}})

	* [com.qlangtech.plugins.incr.flink.launch.CheckpointFactory]({{< relref "./plugins/#扩展点comqlangtechpluginsincrflinklaunchcheckpointfactory">}})

		 * [com.qlangtech.plugins.incr.flink.launch.ckpt.CKOn]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchckptckon">}})

		 * [com.qlangtech.plugins.incr.flink.launch.ckpt.CKOff]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchckptckoff">}})

	* [com.qlangtech.tis.config.ParamsConfig]({{< relref "./plugins/#扩展点comqlangtechtisconfigparamsconfig">}})

		 * [com.qlangtech.plugins.incr.flink.common.FlinkCluster]({{< relref "./plugins/#comqlangtechpluginsincrflinkcommonflinkcluster">}})

	* [com.qlangtech.plugins.incr.flink.launch.RestartStrategyFactory]({{< relref "./plugins/#扩展点comqlangtechpluginsincrflinklaunchrestartstrategyfactory">}})

		 * [com.qlangtech.plugins.incr.flink.launch.restart.FixedDelay]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchrestartfixeddelay">}})

		 * [com.qlangtech.plugins.incr.flink.launch.restart.ExponentialDelay]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchrestartexponentialdelay">}})

		 * [com.qlangtech.plugins.incr.flink.launch.restart.FailureRate]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchrestartfailurerate">}})

		 * [com.qlangtech.plugins.incr.flink.launch.restart.OFF]({{< relref "./plugins/#comqlangtechpluginsincrflinklaunchrestartoff">}})

## tis-sink-elasticsearch7-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-sink-elasticsearch7-plugin.tpi

* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrtissinkfactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.elasticsearch7.ElasticSearchSinkFactory]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorelasticsearch7elasticsearchsinkfactory">}})

## tis-sink-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-sink-hudi-plugin/tis-sink-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi

* **介绍：** 

	封装[Apache Hudi](https://hudi.apache.org/)，为用户提供一站式、开箱即用的千表入湖的解决方案
	
	功能：
	
	本组件整合Hudi提供的[Stream API Demo](https://github.com/apache/hudi/blob/master/hudi-flink-datasource/hudi-flink/src/main/java/org/apache/hudi/streamer/HoodieFlinkStreamer.java)功能，
	通过TIS中的元配置信息自动填充[FlinkStreamerConfig](https://github.com/apache/hudi/blob/master/hudi-flink-datasource/hudi-flink/src/main/java/org/apache/hudi/streamer/FlinkStreamerConfig.java)
	实例所需要配置属性，依赖配置信息（Avro schemas，Hudi表分区信息及 [Key Generation](https://hudi.apache.org/docs/key_generation)配置），
	
	配合TIS提供的各种Source Flink CDC 组件（MySQL，PostgreSQL，SqlServer等）用户可通过TIS控制台，快速实现各种数据源`实时增量`入湖
	
	依赖组件:
	
	 | 组件名称| 版本    |
	 | -------- | -----  |
	 | Apache Hudi     | 0.10.1 |
	 | Apache Spark   |  2.4.4 |
	 | Apache Flink   | tis-1.13.1 |
	 | Apache Hive     | 2.3.1  |
	 | Apache Hadoop  | 2.7.3 | 
	
	
	
	
	
* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrtissinkfactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.hudi.HudiSinkFactory]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorhudihudisinkfactory">}})

	* [com.qlangtech.tis.plugins.incr.flink.connector.hudi.scripttype.ScriptType]({{< relref "./plugins/#扩展点comqlangtechtispluginsincrflinkconnectorhudiscripttypescripttype">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.hudi.scripttype.StreamApiType]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorhudiscripttypestreamapitype">}})

	* [com.qlangtech.tis.plugins.incr.flink.connector.hudi.compaction.CompactionConfig]({{< relref "./plugins/#扩展点comqlangtechtispluginsincrflinkconnectorhudicompactioncompactionconfig">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.hudi.compaction.CompactionConfig]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorhudicompactioncompactionconfig">}})

## tis-sink-starrocks-plugin.tpi

* **下载地址：** http://mirror.qlangtech.com/3.6.0/tis-plugin/tis-sink-starrocks-plugin.tpi

* **介绍：** 

	封装了[StarRocks Flink Stream API:1.2.2_flink-1.13_2.11](https://github.com/StarRocks/starrocks-connector-for-apache-flink)相关的组件, 通过用户在TIS平台中定义的数据源元数据
	自动生成Flink Stream API 相关的全部代码，加上之后脚本编译、打包，Flink任务拉起在TIS平台中一气呵成，让用户在TIS中以低代码开发的方式轻松创建基于Flink的StarRocks实时数据同步通道
	
	
* **扩展列表：** 

	* [com.qlangtech.tis.plugin.incr.TISSinkFactory]({{< relref "./plugins/#扩展点comqlangtechtispluginincrtissinkfactory">}})

		 * [com.qlangtech.tis.plugins.incr.flink.connector.starrocks.StarRocksSinkFactory2]({{< relref "./plugins/#comqlangtechtispluginsincrflinkconnectorstarrocksstarrockssinkfactory2">}})










