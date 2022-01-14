---
title: TIS扩展点列表
linktitle: TIS扩展点列表
date: 2014-03-10
type: book
weight : 11
---

## 扩展点:com.qlangtech.tis.plugin.incr.TISSinkFactory

### ClickHouseSinkFactory

* **显示名:** Flink-ClickHouse-Sink 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.clickhouse.ClickHouseSinkFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-clickhouse-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/clickhouse/ClickHouseSinkFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-clickhouse-plugin.tpi]({{< relref "./tpis/#插件名tissinkclickhouseplugintpi">}})

* **参数说明:** 

1. numWriters

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** number of writers, which build and send requests
	* **默认值:** 1

2. 失败尝试

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 发送之后，最大重试次数。避免由于网络抖动导致的数据丢失
	* **默认值:** 3

3. 忽略错误

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		required boolean parameter responsible for raising (false) or not (true) ClickHouse sending exception in main thread. 
		 - if ignoring-clickhouse-sending-exception-enabled is **是**, exception while clickhouse sending is ignored and failed data automatically goes to the disk. 
		 - if ignoring-clickhouse-sending-exception-enabled is **否**, clickhouse sending exception thrown in "main" thread (thread which called ClickhHouseSink::invoke) and data also goes to the disk.
		 
	* **默认值:** true

4. 记录缓冲

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 缓冲区中最大记录容量
	* **默认值:** 10000

5. 批次容量

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** max capacity (batches) of blank's queue
	* **默认值:** 1000

6. 超时时间

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		 加载数据超时时间
		 
		 单位: **秒**
	* **默认值:** 20

### ElasticSearchSinkFactory

* **显示名:** Flink-ElasticSearch-Sink 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.elasticsearch7.ElasticSearchSinkFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-elasticsearch7-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/elasticsearch7/ElasticSearchSinkFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-elasticsearch7-plugin.tpi]({{< relref "./tpis/#插件名tissinkelasticsearch7plugintpi">}})

* **参数说明:** 

1. bulkFlushMaxActions

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		设置使 sink 在接收每个元素之后立即提交，否则这些元素将被缓存起来
		
	* **默认值:** 无

2. bulkFlushMaxSizeMb

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		刷新前最大缓存的数据量（以兆字节为单位）
		
	* **默认值:** 无

3. bulkFlushIntervalMs

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		刷新的时间间隔（不论缓存操作的数量或大小如何）
	* **默认值:** 无

### StarRocksSinkFactory

* **显示名:** Flink-StarRocks-Sink 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.starrocks.StarRocksSinkFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-starrocks-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/starrocks/StarRocksSinkFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-starrocks-plugin.tpi]({{< relref "./tpis/#插件名tissinkstarrocksplugintpi">}})

* **参数说明:** 

1. sinkBatchFlushInterval

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 10000

2. sinkBatchMaxSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

3. sinkConnectTimeout

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

4. sinkMaxRetries

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

5. sinkBatchMaxRows

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

6. sinkSemantic

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.plugin.incr.IncrStreamFactory

### TISFlinkCDCStreamFactory

* **显示名:** Flink-CDC 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.TISFlinkCDCStreamFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/TISFlinkCDCStreamFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#插件名tisrealtimeflinktpi">}})

* **参数说明:** 

1. flinkCluster

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		对应Flink的执行任务集群，TIS组装好Flink Job之后，提交任务时会向 Flink Cluster中提交任务。
		
		TIS平台中提交Flink任务之前，请先创建Flink Cluster，支持两种模式：
		
		1. Native Kubernetes: [详细请查看](https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/deployment/resource-providers/native_kubernetes/)
		   [安装说明](http://tis.pub/docs/install/flink-cluster/)：
		      - 在本地局域网中安装k8s环境
		      - 在TIS中部署Flink-Cluster，[入口](/base/flink-cluster)
		
		2. Standalone: [详细请查看](https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/deployment/resource-providers/standalone/overview/)
		   
		   [安装说明](http://tis.pub/docs/install/flink-cluster/standalone/):
		      - 下载
		        ```shell script
		         wget http://tis-release.oss-cn-beijing.aliyuncs.com/3.4.0/tis/flink-tis-1.13.1-bin.tar .gz && rm -rf flink-tis-1.13.1 && mkdir flink-tis-1.13.1 && tar xvf flink-tis-1.13.1-bin.tar.gz -C ./flink-tis-1.13.1
		        ```
		      - 启动Flink-Cluster：
		         ```shell script
		          sh ./bin/start-cluster.sh
		         ```
		         
		
	* **默认值:** 无

2. parallelism

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		任务执行并行度的意思。
		
		在 Flink 里面代表每个任务的并行度，适当的提高并行度可以大大提高 job 的执行效率，比如你的 job 消费 kafka 数据过慢，适当调大可能就消费正常了。
		
	* **默认值:** 1

## 扩展点:com.qlangtech.tis.offline.FlatTableBuilder

### HiveFlatTableBuilder

* **显示名:** hive 

* **全路径名:** [com.qlangtech.tis.offline.flattable.HiveFlatTableBuilder](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/offline/flattable/HiveFlatTableBuilder.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. dbName

	* **类型:** 单行文本

	* **必须:** 是

2. name

	* **类型:** 单行文本

	* **必须:** 是

3. hiveAddress

	* **类型:** 单行文本

	* **必须:** 是

4. fsName

	* **类型:** 单选

	* **必须:** 是

## 扩展点:com.qlangtech.tis.manage.IAppSource

### com.qlangtech.tis.plugin.datax.DefaultDataxProcessor

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-common-plugin.tpi]({{< relref "./tpis/#插件名tisdataxcommonplugintpi">}})

## 扩展点:com.qlangtech.tis.datax.impl.DataxWriter

### DataXCassandraWriter

* **显示名:** Cassandra 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXCassandraWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-cassandra-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXCassandraWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-cassandra-plugin.tpi]({{< relref "./tpis/#插件名tisdataxcassandraplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

3. maxPendingPerConnection

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 描述：客户端连接池配置：每个连接最大请求数。默认值：128
	* **默认值:** 无

4. connectionsPerHost

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 描述：客户端连接池配置：与服务器每个节点建多少个连接。默认值：8
	* **默认值:** 无

5. batchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 默认值：1,描述：一次批量提交(UNLOGGED BATCH)的记录数大小（条数）。注意batch的大小有如下限制：（1）不能超过65535。
(2) batch中的内容大小受到服务器端batch_size_fail_threshold_in_kb的限制。
(3) 如果batch中的内容超过了batch_size_warn_threshold_in_kb的限制，会打出warn日志，但并不影响写入，忽略即可。
如果批量提交失败，会把这个批量的所有内容重新逐条写入一遍。
	* **默认值:** 无

6. 一致性级别

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：数据一致性级别。可选ONE|QUORUM|LOCAL_QUORUM|EACH_QUORUM|ALL|ANY|TWO|THREE|LOCAL_ONE
	* **默认值:** LOCAL_QUORUM

### DataXClickhouseWriter

* **显示名:** ClickHouse 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXClickhouseWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-clickhouse-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXClickhouseWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-clickhouse-plugin.tpi]({{< relref "./tpis/#插件名tisdataxclickhouseplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. postSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 写入数据到目的表后，会执行这里的标准语句。（原理同 preSql ）
	* **默认值:** 无

3. 自动建表

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		 在开始执行DataX任务前，自动在目标数据库中创建表，目标表Engine类型为'CollapsingMergeTree' 构建原理请参考[MySQL到ClickHouse实时同步](https://www.askcug.com/topic/76/mysql%E5%88%B0clickhouse%E5%AE%9E%E6%97%B6%E5%90%8C%E6%AD%A5-cloudcanal%E5%AE%9E%E6%88%98)
		 
	* **默认值:** true

4. batchByteSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 13421772

5. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

6. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** insert

7. batchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		 * 描述：一次性批量提交的记录数大小，该值可以极大减少DataX与Mysql的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成DataX运行进程OOM情况。
	* **默认值:** 2048

8. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### DataXStarRocksWriter

* **显示名:** StarRocks 

* **全路径名:** [com.qlangtech.tis.plugin.datax.starrocks.DataXStarRocksWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/datax/starrocks/DataXStarRocksWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#插件名tisdataxdorisplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. postSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 写入数据到目的表后，会执行这里的标准语句。（原理同 preSql ）
	* **默认值:** 无

3. 自动建表

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 解析Reader的元数据，自动生成Writer create table DDL语句
	* **默认值:** true

4. loadProps

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		StreamLoad 的请求参数，详情参照[StreamLoad介绍页面](http://doris.apache.org/master/zh-CN/administrator-guide/load-data/stream-load-manual.html#%E5%9F%BA%E6%9C%AC%E5%8E%9F%E7%90%86)
		
		默认传入的数据均会被转为字符串，并以 **\t** 作为列分隔符，**\n** 作为行分隔符，组成csv文件进行 [StreamLoad导入参数说明](http://doris.apache.org/master/zh-CN/administrator-guide/load-data/stream-load-manual.html#%E5%AF%BC%E5%85%A5%E4%BB%BB%E5%8A%A1%E5%8F%82%E6%95%B0)。 如需更改列分隔符， 则正确配置 loadProps 即可：
		
		```json
		 {
		    "column_separator": "\\x01",
		    "row_delimiter": "\\x02"
		}
		```
		
		如需更改导入格式为json， 则正确配置 loadProps 即可：
		```json
		 {
		    "format": "json",
		    "strip_outer_array": true
		}
		```
		
	* **默认值:** 无

5. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

6. maxBatchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		- 描述：单次StreamLoad导入的最大字节数。
		- 必选：否
		- 默认值：104857600 (100M)
		
		
	* **默认值:** 104857600

7. maxBatchRows

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		- 描述：单次StreamLoad导入的最大行数
		- 必选：否
		- 默认值：500000 (50W)
		
	* **默认值:** 无

8. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### DataXDorisWriter

* **显示名:** Doris 

* **全路径名:** [com.qlangtech.tis.plugin.datax.doris.DataXDorisWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/datax/doris/DataXDorisWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#插件名tisdataxdorisplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. postSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 写入数据到目的表后，会执行这里的标准语句。（原理同 preSql ）
	* **默认值:** 无

3. 自动建表

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 解析Reader的元数据，自动生成Writer create table DDL语句
	* **默认值:** true

4. loadProps

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		StreamLoad 的请求参数，详情参照[StreamLoad介绍页面](http://doris.apache.org/master/zh-CN/administrator-guide/load-data/stream-load-manual.html#%E5%9F%BA%E6%9C%AC%E5%8E%9F%E7%90%86)
		
		默认传入的数据均会被转为字符串，并以 **\t** 作为列分隔符，**\n** 作为行分隔符，组成csv文件进行 [StreamLoad导入参数说明](http://doris.apache.org/master/zh-CN/administrator-guide/load-data/stream-load-manual.html#%E5%AF%BC%E5%85%A5%E4%BB%BB%E5%8A%A1%E5%8F%82%E6%95%B0)。 如需更改列分隔符， 则正确配置 loadProps 即可：
		
		```json
		 {
		    "column_separator": "\\x01",
		    "row_delimiter": "\\x02"
		}
		```
		
		如需更改导入格式为json， 则正确配置 loadProps 即可：
		```json
		 {
		    "format": "json",
		    "strip_outer_array": true
		}
		```
		
	* **默认值:** 无

5. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

6. maxBatchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		- 描述：单次StreamLoad导入的最大字节数。
		- 必选：否
		- 默认值：104857600 (100M)
		
		
	* **默认值:** 104857600

7. maxBatchRows

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		- 描述：单次StreamLoad导入的最大行数
		- 必选：否
		- 默认值：500000 (50W)
		
	* **默认值:** 无

8. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### DataXElasticsearchWriter

* **显示名:** Elasticsearch 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXElasticsearchWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-elasticsearch-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXElasticsearchWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-elasticsearch-plugin.tpi]({{< relref "./tpis/#插件名tisdataxelasticsearchplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. settings

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 
		 创建index时候的settings, 与elasticsearch官方相同，详细配置请参考：[index-modules-settings](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules.html#index-modules-settings)
	* **默认值:** {"index" :{"number_of_shards": 1, "number_of_replicas": 0}}

3. aliasMode

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 数据导入完成后增加别名的模式，append(增加模式), exclusive(只留这一个)
	* **默认值:** append

4. index

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Elasticsearch中的index名
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@68c87fc3

5. type

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** Elasticsearch中index的type名
	* **默认值:** 无

6. splitter

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 如果插入数据是array，就使用指定分隔符
	* **默认值:** ,

7. timeout

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 客户端超时时间
	* **默认值:** 600000

8. multiThread

	* **类型:** 单选

	* **必须:** 否

	* **说明:** http请求，是否有多线程
	* **默认值:** true

9. endpoint

	* **类型:** 单选

	* **必须:** 是

	* **说明:** ElasticSearch的连接地址
	* **默认值:** 无

10. cleanup

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 是否删除原表
	* **默认值:** false

11. discovery

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 启用节点发现将(轮询)并定期更新客户机中的服务器列表
	* **默认值:** false

12. trySize

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 失败后重试的次数
	* **默认值:** 30

13. alias

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 数据导入完成后写入别名
	* **默认值:** 无

14. dynamic

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 不使用datax的mappings，使用es自己的自动mappings
	* **默认值:** false

15. ignoreParseError

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 忽略解析数据格式错误，继续写入
	* **默认值:** true

16. compression

	* **类型:** 单选

	* **必须:** 否

	* **说明:** http请求，开启压缩
	* **默认值:** true

17. batchSize

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 每次批量数据的条数
	* **默认值:** 1000

18. 忽略错误

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 忽略写入错误，不重试，继续写入
	* **默认值:** false

### DataXFtpWriter

* **显示名:** FTP 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXFtpWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-ftp-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXFtpWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-ftp-plugin.tpi]({{< relref "./tpis/#插件名tisdataxftpplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. nullFormat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：文本文件中无法使用标准字符串定义null(空指针)，DataX提供nullFormat定义哪些字符串可以表示为null。例如如果用户配置: nullFormat="\N"，那么如果源头数据是"\N"，DataX视作null字段。
	* **默认值:** 无

3. dateFormat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：日期类型的数据序列化到文件中时的格式，例如 "dateFormat": "yyyy-MM-dd"。
	* **默认值:** 无

4. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		 FtpWriter写入前数据清理处理模式： 
		 
		 1. **truncate**:  写入前清理目录下一fileName前缀的所有文件。
		 
		 2. **append**: 写入前不做任何处理，DataX FtpWriter直接使用filename写入，并保证文件名不冲突。
		  
		 3. **nonConflict**: 如果目录下有fileName前缀的文件，直接报错。
		 
	* **默认值:** 无

5. suffix

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：最后输出文件的后缀，当前支持 ".text"以及".csv"
	* **默认值:** 无

6. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：读取文件的编码配置。
	* **默认值:** utf-8

7. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：读取的字段分隔符，可以用'\t','\001'等字符 默认值：,
	* **默认值:** 无

8. timeout

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 描述：连接ftp服务器连接超时时间，单位毫秒。默认值：60000（1分钟） 
	* **默认值:** 无

9. path

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：FTP文件系统的路径信息，FtpWriter会写入Path目录下属多个文件。 
	* **默认值:** 无

10. password

	* **类型:** 密码

	* **必须:** 是

	* **说明:** 描述：ftp服务器访问密码。 
	* **默认值:** 无

11. protocol

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：ftp服务器协议，目前支持传输协议有ftp和sftp。 
	* **默认值:** 无

12. port

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** ftp服务器端口。若传输协议是sftp协议，默认值是22；若传输协议是标准ftp协议，默认值是21 
	* **默认值:** 无

13. host

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：ftp服务器地址。 
	* **默认值:** 无

14. header

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：txt写出时的表头，是否在文件头将key写入
	* **默认值:** false

15. fileFormat

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 
		
		 文件写出的格式，包括[csv](http://zh.wikipedia.org/wiki/%E9%80%97%E5%8F%B7%E5%88%86%E9%9A%94%E5%80%BC) 和**text**两种，**csv**是严格的**csv**格式，如果待写数据包括列分隔符，则会按照**csv**的转义语法转义，转义符号为双引号。**text**格式是用列分隔符简单分割待写数据，对于待写数据包括列分隔符情况下不做转义。
		    
		
		  
	* **默认值:** 无

16. username

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：ftp服务器访问用户名。 
	* **默认值:** 无

### DataXMongodbWriter

* **显示名:** MongoDB 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXMongodbWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-mongodb-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXMongodbWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-mongodb-plugin.tpi]({{< relref "./tpis/#插件名tisdataxmongodbplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. upsertInfo

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 
		 指定了传输数据时更新的信息。填写JSONObject格式，需要有两个属性'isUpsert'(当设置为true时，表示针对相同的upsertKey做更新操作),'upsertKey'(upsertKey指定了没行记录的业务主键。用来做更新时使用)【选填】,例子：
		 ```json
		  {"isUpsert":true,"upsertKey":"unique_id"}
		  ```
	* **默认值:** 无

3. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. column

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		 * MongoDB的文档列名。是JSONArray结构类型，内部的JSONObject的元祖需要具有，'name'，'type'(可选以下`int`, `long`, `double`, `string`, `array`, `date`, `boolean`, `bytes`),样例：
		  ```json
		    [{ "name": "frontcat_id", "type": "Array", "splitter": " " },
		     { "name": "unique_id", "type": "string"  }    ]
		  ```
		 * 'splitter'(因为MongoDB支持数组类型，但是Datax框架本身不支持数组类型，所以mongoDB读出来的数组类型要通过这个分隔符合并成字符串)"
		 * 类型转换
		 
		 | DataX 内部类型| MongoDB 数据类型    |
		 | -------- | -----  |
		 | Long     | int, Long |
		 | Double   | double |
		 | String   | string, array |
		 | Date     | date  |
		 | Boolean  | boolean |
		 | Bytes    | bytes |
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@2f2d52ef

5. collectionName

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** MonogoDB的集合名。【必填】
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@f2ce6b

### DataXOracleWriter

* **显示名:** Oracle 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOracleWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOracleWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#插件名tisdataxoracleplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. postSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 写入数据到目的表后，会执行这里的标准语句。（原理同 preSql ）
	* **默认值:** 无

3. session

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		  DataX在获取Mysql连接时，执行session指定的SQL语句，修改当前connection session属性 
	* **默认值:** 无

4. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

5. batchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		 * 描述：一次性批量提交的记录数大小，该值可以极大减少DataX与Mysql的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成DataX运行进程OOM情况。
	* **默认值:** 1000

6. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### DataXOssWriter

* **显示名:** OSS 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOssWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax-oss-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOssWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oss-plugin.tpi]({{< relref "./tpis/#插件名tisdataxossplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. bucket

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：OSS的bucket  
	* **默认值:** 无

3. endpoint

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：OSS Server的EndPoint地址，例如http://oss.aliyuncs.com。
	* **默认值:** 无

4. nullFormat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：文本文件中无法使用标准字符串定义null(空指针)，DataX提供nullFormat定义哪些字符串可以表示为null。
	* **默认值:** \N

5. dateFormat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：日期类型的数据序列化到object中时的格式，例如 "dateFormat": "yyyy-MM-dd"。
	* **默认值:** 无

6. header

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 描述：Oss写出时的表头，示例['id', 'name', 'age']。
	* **默认值:** 无

7. maxFileSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 描述：Oss写出时单个Object文件的最大大小，默认为10000*10MB，类似log4j日志打印时根据日志文件大小轮转。OSS分块上传时，每个分块大小为10MB，每个OSS InitiateMultipartUploadRequest支持的分块最大数量为10000。轮转发生时，object名字规则是：在原有object前缀加UUID随机数的基础上，拼接_1,_2,_3等后缀。
	* **默认值:** 无

8. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：OSSWriter写入前数据清理处理. truncate，写入前清理object名称前缀匹配的所有object。例如: "object": "abc"，将清理所有abc开头的object。
append，写入前不做任何处理，DataX OSSWriter直接使用object名称写入，并使用随机UUID的后缀名来保证文件名不冲突。例如用户指定的object名为datax，实际写入为datax_xxxxxx_xxxx_xxxx
nonConflict，如果指定路径出现前缀匹配的object，直接报错。例如: "object": "abc"，如果存在abc123的object，将直接报错。
	* **默认值:** 无

9. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：写出文件的编码配置。
	* **默认值:** utf-8

10. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：读取的字段分隔符，可以用'\t','\001'等字符
	* **默认值:** ,

11. fileFormat

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：文件写出的格式，包括csv  (http://zh.wikipedia.org/wiki/%E9%80%97%E5%8F%B7%E5%88%86%E9%9A%94%E5%80%BC) 和text两种，csv是严格的csv格式，如果待写数据包括列分隔符，则会按照csv的转义语法转义，转义符号为双引号"；text格式是用列分隔符简单分割待写数据，对于待写数据包括列分隔符情况下不做转义。
	* **默认值:** text

12. object

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：OSSWriter写入的文件名，OSS使用文件名模拟目录的实现。 
	* **默认值:** 无

### DataXPostgresqlWriter

* **显示名:** PostgreSQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXPostgresqlWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax-postgresql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXPostgresqlWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-postgresql-plugin.tpi]({{< relref "./tpis/#插件名tisdataxpostgresqlplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. postSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 写入数据到目的表后，会执行这里的标准语句。（原理同 preSql ）
	* **默认值:** 无

3. 自动建表

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 解析Reader的元数据，自动生成Writer create table DDL语句
	* **默认值:** true

4. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

5. batchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		 * 描述：一次性批量提交的记录数大小，该值可以极大减少DataX与Mysql的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成DataX运行进程OOM情况。
	* **默认值:** 1000

6. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### DataXSqlserverWriter

* **显示名:** SqlServer 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXSqlserverWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax-sqlserver-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXSqlserverWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-sqlserver-plugin.tpi]({{< relref "./tpis/#插件名tisdataxsqlserverplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. postSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 写入数据到目的表后，会执行这里的标准语句。（原理同 preSql ）
	* **默认值:** 无

3. 自动建表

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 解析Reader的元数据，自动生成Writer create table DDL语句
	* **默认值:** true

4. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

5. batchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		 * 描述：一次性批量提交的记录数大小，该值可以极大减少DataX与Mysql的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成DataX运行进程OOM情况。
	* **默认值:** 1000

6. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### DataxMySQLWriter

* **显示名:** MySQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataxMySQLWriter](https://github.com/qlangtech/plugins/tree/master/tis-ds-mysql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataxMySQLWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-plugin.tpi]({{< relref "./tpis/#插件名tisdsmysqlplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. postSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 写入数据到目的表后，会执行这里的标准语句。（原理同 preSql ）
	* **默认值:** 无

3. 自动建表

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 解析Reader的元数据，自动生成Writer create table DDL语句
	* **默认值:** true

4. session

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		  DataX在获取Mysql连接时，执行session指定的SQL语句，修改当前connection session属性 
	* **默认值:** 无

5. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

6. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		控制写入数据到目标表采用 `insert into` 或者 `replace into` 或者 `ON DUPLICATE KEY UPDATE` 语句
	* **默认值:** insert

7. batchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		 * 描述：一次性批量提交的记录数大小，该值可以极大减少DataX与Mysql的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成DataX运行进程OOM情况。
	* **默认值:** 1000

8. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### DataXSparkWriter

* **显示名:** Spark 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXSparkWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXSparkWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. 分区保留数

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		每进行一次DataX导入在Hive表中会生成一个新的分区，现在系统分区名称为`pt`格式为开始导入数据的时间戳
		
	* **默认值:** 无

3. tabPrefix

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		每次导入Hive表，会在对应源表前加一个后缀，这样更加符合数据仓库的规范，一般是加`ods_`, 用户也可以修改成其他值
		
	* **默认值:** ods_

4. partitionFormat

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		每进行一次DataX导入在Hive表中会生成一个新的分区，现在系统分区名称为'pt'格式为开始导入数据的当前时间戳，格式为`yyyyMMddHHmmss`或者`yyyyMMdd`     
	* **默认值:** 无

5. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		hdfswriter写入前数据清理处理模式：
		
		- **append**: 写入前不做任何处理，DataX hdfswriter直接使用filename写入，并保证文件名不冲突，
		- **nonConflict**：如果目录下有fileName前缀的文件，直接报错
	* **默认值:** 无

6. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：写文件的编码配置。
	* **默认值:** utf-8

7. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：hdfswriter写入时的字段分隔符,
	* **默认值:** 	

8. fileType

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：文件的类型，目前只支持用户配置为"text"
	* **默认值:** 无

9. hiveConn

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

10. fsName

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：Hadoop hdfs文件系统namenode节点地址。格式：hdfs://ip:端口；例如：hdfs://127.0.0.1:9000
	* **默认值:** 无

### DataXHiveWriter

* **显示名:** Hive 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXHiveWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXHiveWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. 分区保留数

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		每进行一次DataX导入在Hive表中会生成一个新的分区，现在系统分区名称为`pt`格式为开始导入数据的时间戳
		
	* **默认值:** 无

3. tabPrefix

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		每次导入Hive表，会在对应源表前加一个后缀，这样更加符合数据仓库的规范，一般是加`ods_`, 用户也可以修改成其他值
		
	* **默认值:** ods_

4. partitionFormat

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		每进行一次DataX导入在Hive表中会生成一个新的分区，现在系统分区名称为'pt'格式为开始导入数据的当前时间戳，格式为`yyyyMMddHHmmss`或者`yyyyMMdd`     
	* **默认值:** 无

5. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		hdfswriter写入前数据清理处理模式：
		
		- **append**: 写入前不做任何处理，DataX hdfswriter直接使用filename写入，并保证文件名不冲突，
		- **nonConflict**：如果目录下有fileName前缀的文件，直接报错
	* **默认值:** 无

6. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：写文件的编码配置。
	* **默认值:** utf-8

7. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：hdfswriter写入时的字段分隔符,
	* **默认值:** 	

8. fileType

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：文件的类型，目前只支持用户配置为"text"
	* **默认值:** 无

9. hiveConn

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

10. fsName

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：Hadoop hdfs文件系统namenode节点地址。格式：hdfs://ip:端口；例如：hdfs://127.0.0.1:9000
	* **默认值:** 无

### DataXHdfsWriter

* **显示名:** Hdfs 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXHdfsWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXHdfsWriter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. path

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		存储到Hadoop hdfs文件系统的相对路径信息，HdfsWriter会根据并发配置在Path目录下写入多个文件。为与hive表关联，请填写hive表在hdfs上的存储路径。
		
		例：Hive上设置的数据仓库的存储路径为：`/user/hive/warehouse/` ，已建立数据库：`test.db`，表：`hello`；则输入框中可输入`test.db/hello`, 最终对应HDFS中存储路径为：`/user/hive/warehouse/test.db/hello`  
		  
	* **默认值:** 无

3. compress

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：hdfs文件压缩类型，默认不填写意味着没有压缩。其中：text类型文件支持压缩类型有gzip、bzip2;orc类型文件支持的压缩类型有NONE、SNAPPY（需要用户安装SnappyCodec）。 
	* **默认值:** 无

4. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		hdfswriter写入前数据清理处理模式：
		
		- **append**: 写入前不做任何处理，DataX hdfswriter直接使用filename写入，并保证文件名不冲突，
		- **nonConflict**：如果目录下有fileName前缀的文件，直接报错
	* **默认值:** 无

5. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：写文件的编码配置。
	* **默认值:** utf-8

6. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：hdfswriter写入时的字段分隔符,
	* **默认值:** 	

7. fileType

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：文件的类型，目前只支持用户配置为"text"或"orc" 
	* **默认值:** 无

8. fsName

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：Hadoop hdfs文件系统namenode节点地址。格式：hdfs://ip:端口；例如：hdfs://127.0.0.1:9000
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.config.ParamsConfig

### DataXGlobalConfig

* **显示名:** DataX-global 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXGlobalConfig](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-common-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXGlobalConfig.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-common-plugin.tpi]({{< relref "./tpis/#插件名tisdataxcommonplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

2. 最大错误百分比

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 0.02

3. 最大错误记录数

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 0

4. channel

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 3

5. 名称

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

### HttpEndpoint

* **显示名:** httpToken 

* **全路径名:** [com.qlangtech.tis.plugin.aliyun.HttpEndpoint](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-common-plugin/src/main/java/com/qlangtech/tis/plugin/aliyun/HttpEndpoint.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-common-plugin.tpi]({{< relref "./tpis/#插件名tisdataxcommonplugintpi">}})

* **参数说明:** 

1. keyId

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** aliyun服务的accessId，用在私有云环境下，例如自建Elasticsearch，服务端如不需要连接凭证，则该项可为空
	* **默认值:** 无

2. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** aliyun服务的accessKeySecret，用在私有云环境下，例如自建Elasticsearch，服务端如不需要连接凭证，则该项可为空
	* **默认值:** 无

3. endpoint

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Server的EndPoint地址，例如http://oss.aliyuncs.com
	* **默认值:** http://oss.aliyuncs.com

4. name

	* **类型:** 单行文本

	* **必须:** 是

### DefaultHiveConnGetter

* **显示名:** HiveConn 

* **全路径名:** [com.qlangtech.tis.hive.DefaultHiveConnGetter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/hive/DefaultHiveConnGetter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. password

	* **类型:** 密码

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

2. dbName

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Hive 数据库使用的库名，请在执行任务前先创建完成
	* **默认值:** 无

3. name

	* **类型:** 单行文本

	* **必须:** 是

4. 用户名

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

5. hiveAddress

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：Hive Thrift Server2。格式：ip:端口；例如：127.0.0.1:9000
	* **默认值:** {ip|host}:10000

6. 非匿名登录

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 当选择为'是', 用户需要填写用户名和密码
	* **默认值:** false

### YarnConfig

* **显示名:** yarn 

* **全路径名:** [com.qlangtech.tis.config.yarn.YarnConfig](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/yarn/YarnConfig.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. rmAddress

	* **类型:** 单行文本

	* **必须:** 是

2. schedulerAddress

	* **类型:** 单行文本

	* **必须:** 是

3. name

	* **类型:** 单行文本

	* **必须:** 是

### DefaultK8sContext

* **显示名:** k8s 

* **全路径名:** [com.qlangtech.tis.config.k8s.impl.DefaultK8sContext](https://github.com/qlangtech/plugins/tree/master/tis-k8s-plugin/src/main/java/com/qlangtech/tis/config/k8s/impl/DefaultK8sContext.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-k8s-plugin.tpi]({{< relref "./tpis/#插件名tisk8splugintpi">}})

* **参数说明:** 

1. Yaml配置内容

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		为了通过CS模式连接K8S服务端可以先通过kubectl config命令生成服务端连接的证书配置文件，config命令请查看
		[kubectl-commands#config](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#config)
		
		执行 `kubectl config view  --flatten=true` 将得到的内容粘贴到上面输入框中
		
		> TIS中有较多组件是运行在K8S容器中的，需要在TIS运行环境中安装部署K8S环境。有多种方式安装K8S环境，[详细请查看](http://tis.pub/blog/k8s-using/)
		
	* **默认值:** 无

2. 名称

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

3. 连接地址

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

### FlinkCluster

* **显示名:** Flink-Cluster 

* **全路径名:** [com.qlangtech.plugins.incr.flink.common.FlinkCluster](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/common/FlinkCluster.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#插件名tisrealtimeflinktpi">}})

* **参数说明:** 

1. name

	* **类型:** 单行文本

	* **必须:** 是

2. JMAddress

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		The JobManager is serving the web interface accessible at localhost:8081
		
	* **默认值:** 127.0.0.1:8081

3. clusterId

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Using [native_kubernetes](https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/deployment/resource-providers/native_kubernetes/), when launch the session,
		execute the shell script:
		
		```shell script
		./bin/kubernetes-session.sh -Dkubernetes.cluster-id=my-first-flink-cluster
		```
		
		the control of input textbox shall input the value what system `-Dkubernetes.cluster-id` setted
	* **默认值:** my-first-flink-cluster

## 扩展点:com.qlangtech.tis.plugin.k8s.K8sImage

### DefaultK8SImage

* **显示名:** image 

* **全路径名:** [com.qlangtech.tis.config.k8s.impl.DefaultK8SImage](https://github.com/qlangtech/plugins/tree/master/tis-k8s-plugin/src/main/java/com/qlangtech/tis/config/k8s/impl/DefaultK8SImage.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-k8s-plugin.tpi]({{< relref "./tpis/#插件名tisk8splugintpi">}})

* **参数说明:** 

1. 镜像地址

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

2. namespace

	* **类型:** 单行文本

	* **必须:** 是

3. 名称

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. hostAliases

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 启动Pod时会在容器内的hosts文件中添加所输入的内容，例子：
		 ``` yaml
		  - ip: "127.0.0.1"
		    hostnames:
		      - "foo.local"
		      - "bar.local"
		 ```
	* **默认值:** 无

5. k8sCfg

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.offline.FileSystemFactory

### AliyunOSSFileSystemFactory

* **显示名:** AliyunOSSFileSystemFactory 

* **全路径名:** [com.qlangtech.tis.plugin.fs.aliyun.oss.AliyunOSSFileSystemFactory](https://github.com/qlangtech/tis-parent/tis/tis-plugin-parent/tis-aliyun-fs-plugin/src/main/java/com/qlangtech/tis/plugin/fs/aliyun/oss/AliyunOSSFileSystemFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-aliyun-fs-plugin.tpi]({{< relref "./tpis/#插件名tisaliyunfsplugintpi">}})

* **参数说明:** 

1. aliyunToken

	* **类型:** 单选

	* **必须:** 是

2. bucketName

	* **类型:** 单行文本

	* **必须:** 是

3. endpoint

	* **类型:** 单行文本

	* **必须:** 是

4. name

	* **类型:** 单行文本

	* **必须:** 是

5. rootDir

	* **类型:** 单行文本

	* **必须:** 是

### HdfsFileSystemFactory

* **显示名:** HDFS 

* **全路径名:** [com.qlangtech.tis.hdfs.impl.HdfsFileSystemFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/hdfs/impl/HdfsFileSystemFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. name

	* **类型:** 单行文本

	* **必须:** 是

2. rootDir

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 系统会将源数据导入到该子目录下，用户需要保证该子目录有读/写权限
	* **默认值:** 无

3. hdfsSiteContent

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		配置实例,实现了HDFS HA高可用方案：
		
		[hdfs-site.xml参数详解](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml)
		
		```xml
		<?xml version="1.0" encoding="UTF-8"?>
		<configuration>
		  <property>
		    <name>dfs.nameservices</name>
		    <value>daily-cdh</value>
		  </property>
		  <property>
		    <name>dfs.client.failover.proxy.provider.daily-cdh</name>
		  <value>org.apache.hadoop.hdfs.server.namenode.ha.ConfiguredFailoverProxyProvider</value>
		  </property>
		  <property>
		    <name>dfs.ha.automatic-failover.enabled.daily-cdh</name>
		    <value>true</value>
		  </property>
		  <property>
		    <name>dfs.ha.namenodes.daily-cdh</name>
		    <value>namenode228,namenode295</value>
		  </property>
		  <property>
		    <name>dfs.namenode.rpc-address.daily-cdh.namenode228</name>
		    <value>192.168.28.200:9000</value>
		  </property>
		  <property>
		    <name>dfs.namenode.servicerpc-address.daily-cdh.namenode228</name>
		    <value>192.168.28.200:8022</value>
		  </property>
		  <property>
		    <name>dfs.namenode.http-address.daily-cdh.namenode228</name>
		    <value>192.168.28.200:50070</value>
		  </property>
		  <property>
		    <name>dfs.namenode.https-address.daily-cdh.namenode228</name>
		    <value>192.168.28.200:50470</value>
		  </property>
		  <property>
		    <name>dfs.namenode.rpc-address.daily-cdh.namenode295</name>
		    <value>192.168.28.200:9000</value>
		  </property>
		  <property>
		    <name>dfs.namenode.servicerpc-address.daily-cdh.namenode295</name>
		    <value>192.168.28.200:8022</value>
		  </property>
		  <property>
		    <name>dfs.namenode.http-address.daily-cdh.namenode295</name>
		    <value>192.168.28.200:50070</value>
		  </property>
		  <property>
		    <name>dfs.namenode.https-address.daily-cdh.namenode295</name>
		    <value>192.168.28.200:50470</value>
		  </property>
		  <property>
		    <name>dfs.replication</name>
		    <value>2</value>
		  </property>
		  <property>
		    <name>dfs.blocksize</name>
		    <value>134217728</value>
		  </property>
		  <property>
		    <name>dfs.client.use.datanode.hostname</name>
		    <value>false</value>
		  </property>
		  <property>
		    <name>fs.permissions.umask-mode</name>
		    <value>022</value>
		  </property>
		  <property>
		    <name>dfs.namenode.acls.enabled</name>
		    <value>false</value>
		  </property>
		  <property>
		    <name>dfs.client.use.legacy.blockreader</name>
		    <value>false</value>
		  </property>
		  <property>
		    <name>dfs.client.read.shortcircuit</name>
		    <value>false</value>
		  </property>
		  <property>
		    <name>dfs.domain.socket.path</name>
		    <value>/var/run/hdfs-sockets/dn</value>
		  </property>
		  <property>
		    <name>dfs.client.read.shortcircuit.skip.checksum</name>
		    <value>false</value>
		  </property>
		  <property>
		    <name>dfs.client.domain.socket.data.traffic</name>
		    <value>false</value>
		  </property>
		  <property>
		    <name>dfs.datanode.hdfs-blocks-metadata.enabled</name>
		    <value>true</value>
		  </property>
		</configuration>
		
		```
		
	* **默认值:** 无

4. hdfsAddress

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** hdfs://daily-cdh

## 扩展点:com.qlangtech.tis.datax.job.DataXJobWorker

### K8SDataXJobWorker

* **显示名:** DataX-Worker 

* **全路径名:** [com.qlangtech.tis.plugin.datax.K8SDataXJobWorker](https://github.com/qlangtech/plugins/tree/master/tis-k8s-plugin/src/main/java/com/qlangtech/tis/plugin/datax/K8SDataXJobWorker.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-k8s-plugin.tpi]({{< relref "./tpis/#插件名tisk8splugintpi">}})

* **参数说明:** 

1. zkQueuePath

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 分布式队列持久化元数据会保存在该Zookeeper子路径下
	* **默认值:** /datax/jobs

2. zkAddress

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 执行器利用基于Zookeeper的分布式队列来向K8S集群中分发DataX任务
	* **默认值:** 无

3. k8sImage

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 选择一个与该执行器匹配的Docker Image实例
	* **默认值:** 无

### FlinkK8SClusterManager

* **显示名:** Flink-Cluster 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cluster.FlinkK8SClusterManager](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/cluster/FlinkK8SClusterManager.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#插件名tisrealtimeflinktpi">}})

* **参数说明:** 

1. k8sImage

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 选择一个与该执行器匹配的Docker Image实例
	* **默认值:** 无

2. clusterId

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		The `cluster-id`, which should be no more than 45 characters, is used for identifying a unique Flink cluster. 
		 
	* **默认值:** tis-flink-cluster

3. tmMemory

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		`Total Flink Memory size for the TaskExecutors`. 
		
		This includes all the memory that a TaskExecutor consumes, except for JVM Metaspace and JVM Overhead. 
		It consists of Framework Heap Memory, Task Heap Memory, Task Off-Heap Memory, Managed Memory, and Network Memory. 
		See also '%s' for total process memory size configuration.
		
		单位：兆
	* **默认值:** 1728

4. jmMemory

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		`Total Process Memory size for the JobManager`. 
		
		This includes all the memory that a JobManager JVM process consumes, consisting of Total Flink Memory, JVM Metaspace, and JVM Overhead. 
		In containerized setups, this should be set to the container memory. 
		See also 'jobmanager.memory.flink.size' for Total Flink Memory size configuration.
		
		单位：兆
		
	* **默认值:** 1600

## 扩展点:com.qlangtech.tis.datax.impl.DataxReader

### DataXCassandraReader

* **显示名:** Cassandra 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXCassandraReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-cassandra-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXCassandraReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-cassandra-plugin.tpi]({{< relref "./tpis/#插件名tisdataxcassandraplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 执行数据批量导出时单次从数据库中提取记录条数，可以有效减少网络IO次数，提升导出效率。切忌不能设置太大以免OOM发生
	* **默认值:** 2000

3. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. allowFiltering

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：是否在服务端过滤数据。参考cassandra文档中ALLOW FILTERING关键字的相关描述。
	* **默认值:** false

5. 一致性级别

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：数据一致性级别。可选ONE|QUORUM|LOCAL_QUORUM|EACH_QUORUM|ALL|ANY|TWO|THREE|LOCAL_ONE
	* **默认值:** LOCAL_QUORUM

### DataXFtpReader

* **显示名:** FTP 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXFtpReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-ftp-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXFtpReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-ftp-plugin.tpi]({{< relref "./tpis/#插件名tisdataxftpplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. nullFormat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 
		
		 描述：文本文件中无法使用标准字符串定义null(空指针)，DataX提供nullFormat定义哪些字符串可以表示为null。
		 例如如果用户配置: nullFormat:"\N"，那么如果源头数据是"\N"，DataX视作null字段。默认值：\N
		  
	* **默认值:** 无

3. compress

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：文本压缩类型，默认不填写意味着没有压缩。支持压缩类型为zip、gzip、bzip2。 
	* **默认值:** 无

4. maxTraversalLevel

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 描述：允许遍历文件夹的最大层数。
	* **默认值:** 无

5. column

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		 描述：读取字段列表，type指定源数据的类型，index指定当前列来自于文本第几列(以0开始)，value指定当前类型为常量，不从源头文件读取数据，而是根据value值自动生成对应的列。
		 
		 用户可以指定Column字段信息，配置如下： 
		  ```json
		   {
		     "type": "long" , "index": 0
		   }
		  ```
		  从远程FTP文件文本第一列获取int字段
		  ```json
		  {
		       "type": "long" , "value": "alibaba"
		  }
		  ``` 
		  从FtpReader内部生成`alibaba`的字符串字段作为当前字段
		
		  >> 对于用户指定Column信息，type必须填写，index/value必须选择其一
		  
		  例子:
		  ```json5
		  [
		   { "index": 0,   "type": "long"  },
		   { "index": 1,   "type": "boolean" },
		   { "index": 2,   "type": "double" },
		   { "index": 3,   "type": "string" },
		   { "index": 4,   "type": "date",  "format": "yyyy.MM.dd" },
		   { "type": "string", "value": "alibaba"  //从FtpReader内部生成alibaba的字符串字段作为当前字段 
		   }
		  ]
		  ```
		
	* **默认值:** 无

6. skipHeader

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：类CSV格式文件可能存在表头为标题情况，需要跳过。默认不跳过。
	* **默认值:** 无

7. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：读取文件的编码配置。
	* **默认值:** utf-8

8. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：读取的字段分隔符，可以用'\t','\001'等字符 
	* **默认值:** ,

9. timeout

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 描述：连接ftp服务器连接超时时间，单位毫秒。默认值：60000（1分钟）
	* **默认值:** 60000

10. path

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		  
		  远程FTP文件系统的路径信息，注意这里可以支持填写多个路径。
		  
		  当指定单个远程FTP文件，FtpReader暂时只能使用单线程进行数据抽取。二期考虑在非压缩文件情况下针对单个File可以进行多线程并发读取。
		  
		  当指定多个远程FTP文件，FtpReader支持使用多线程进行数据抽取。线程并发数通过通道数指定。
		  
		  当指定通配符，FtpReader尝试遍历出多个文件信息。例如: 指定`/*`代表读取/目录下所有的文件，指定`/bazhen/*`代表读取bazhen目录下游所有的文件。FtpReader目前只支持*作为文件通配符。
		  
		  特别需要注意的是，DataX会将一个作业下同步的所有Text File视作同一张数据表。用户必须自己保证所有的File能够适配同一套schema信息。读取文件用户必须保证为类CSV格式，并且提供给DataX权限可读。
		  
		  特别需要注意的是，如果Path指定的路径下没有符合匹配的文件抽取，DataX将报错
		  
	* **默认值:** 无

11. password

	* **类型:** 密码

	* **必须:** 是

	* **说明:** 描述：ftp服务器访问密码。 
	* **默认值:** 无

12. protocol

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：ftp服务器协议，目前支持传输协议有ftp和sftp。 
	* **默认值:** 无

13. port

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 描述：ftp服务器端口。 
	* **默认值:** 无

14. host

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：ftp服务器地址。 
	* **默认值:** 无

15. csvReaderConfig

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		
		 描述：读取CSV类型文件参数配置，Map类型。读取CSV类型文件使用的CsvReader进行读取，会有很多配置，不配置则使用默认值。
		 
		 ```json
		{ "safetySwitch": false,  
		  "skipEmptyRecords": false,       
		  "useTextQualifier": false} 
		 ```
		 所有配置项及默认值,配置时 csvReaderConfig 的map中请严格按照以下字段名字进行配置：
		 ```java
		 boolean caseSensitive = true;
		 char textQualifier = 34;
		 boolean trimWhitespace = true;
		 boolean useTextQualifier = true;//是否使用csv转义字符
		 char delimiter = 44;//分隔符
		 char recordDelimiter = 0;
		 char comment = 35;
		 boolean useComments = false;
		 int escapeMode = 1;
		 boolean safetySwitch = true;//单列长度是否限制100000字符
		 boolean skipEmptyRecords = true;//是否跳过空行
		 boolean captureRawRecord = true;
		 ```
		
	* **默认值:** 无

16. username

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：ftp服务器访问用户名。 
	* **默认值:** 无

17. 连接模式

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 
		
		 连接模式（主动模式或者被动模式）。该参数只在传输协议是标准ftp协议时使用，值只能为：**PORT (主动)**，**PASV（被动）**。两种模式主要的不同是数据连接建立的不同。
		
		 1. 对于Port模式，是客户端在本地打开一个端口等服务器去连接建立数据连接，
		
		 2. 而Pasv模式就是服务器打开一个端口等待客户端去建立一个数据连接。
		    
	* **默认值:** PASV

### DataXMongodbReader

* **显示名:** MongoDB 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXMongodbReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-mongodb-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXMongodbReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-mongodb-plugin.tpi]({{< relref "./tpis/#插件名tisdataxmongodbplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. query

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 
		   MongoDB的额外查询条件。【选填】query是一个json结构体，详细语法请查询:
		  
		   * [https://docs.mongodb.com/guides/server/read_queries/](https://docs.mongodb.com/guides/server/read_queries/) 
		   * [https://docs.mongodb.com/manual/tutorial/query-documents/](https://docs.mongodb.com/manual/tutorial/query-documents/)
	* **默认值:** 无

3. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. column

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		 * MongoDB的文档列名。是JSONArray结构类型，内部的JSONObject的元祖需要具有，'name'，'type'(可选以下`int`, `long`, `double`, `string`, `array`, `date`, `boolean`, `bytes`),样例：
		  ```json
		    [{ "name": "frontcat_id", "type": "Array", "splitter": " " },
		     { "name": "unique_id", "type": "string"  }    ]
		  ```
		 * 'splitter'(因为MongoDB支持数组类型，但是Datax框架本身不支持数组类型，所以mongoDB读出来的数组类型要通过这个分隔符合并成字符串)"
		 * 类型转换
		 
		     | DataX 内部类型| MongoDB 数据类型    |
		     | -------- | -----  |
		     | Long     | int, Long |
		     | Double   | double |
		     | String   | string, array |
		     | Date     | date  |
		     | Boolean  | boolean |
		     | Bytes    | bytes |
		     
	* **默认值:** [{"name":"user_id","type":"string"},{"name":"user_name","type":"array","splitter":","}]

5. collectionName

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** MonogoDB的集合名。【必填】
	* **默认值:** 无

### DataXOracleReader

* **显示名:** Oracle 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOracleReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOracleReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#插件名tisdataxoracleplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 描述：该配置项定义了插件和数据库服务器端每次批量数据获取条数，该值决定了DataX和服务器端的网络交互次数，能够较大的提升数据抽取性能。
	* **默认值:** 2000

3. session

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 描述：控制写入数据的时间格式，时区等的配置，如果表中有时间字段，配置该值以明确告知写入 oracle 的时间格式。通常配置的参数为：NLS_DATE_FORMAT,NLS_TIME_FORMAT。其配置的值为 json 格式，例如：[
              "alter session set NLS_DATE_FORMAT='yyyy-mm-dd hh24:mi:ss'",
              "alter session set NLS_TIMESTAMP_FORMAT='yyyy-mm-dd hh24:mi:ss'",
              "alter session set NLS_TIMESTAMP_TZ_FORMAT='yyyy-mm-dd hh24:mi:ss'",
              "alter session set TIME_ZONE='US/Pacific'"
            ]
	* **默认值:** 无

4. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

5. splitPk

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：OracleReader进行数据抽取时，如果指定splitPk，表示用户希望使用splitPk代表的字段进行数据分片，DataX因此会启动并发任务进行数据同步，这样可以大大提供数据同步的效能。
	* **默认值:** false

### DataXOssReader

* **显示名:** OSS 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOssReader](https://github.com/qlangtech/plugins/tree/master/tis-datax-oss-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOssReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oss-plugin.tpi]({{< relref "./tpis/#插件名tisdataxossplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. bucket

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：OSS的bucket  
	* **默认值:** 无

3. endpoint

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：OSS Server的EndPoint地址，例如http://oss.aliyuncs.com。
	* **默认值:** 无

4. nullFormat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 描述：文本文件中无法使用标准字符串定义null(空指针)，DataX提供nullFormat定义哪些字符串可以表示为null。例如如果用户配置: nullFormat="\N"，那么如果源头数据是"\N"，DataX视作null字段
	* **默认值:** \N

5. compress

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：文本压缩类型，默认不填写意味着没有压缩。支持压缩类型为zip、gzip、bzip2。
	* **默认值:** 无

6. column

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 描述：读取字段列表，type指定源数据的类型，index指定当前列来自于文本第几列(以0开始)，value指定当前类型为常量，不从源头文件读取数据，而是根据value值自动生成对应的列。 默认情况下，用户可以全部按照String类型读取数据，配置如下："column": ["*"],用户可以指定Column字段信息，配置如下： {
    "type": "long",
    "index": 0    //从OSS文本第一列获取int字段
 },
 {
    "type": "string",
    "value": "alibaba"  //从OSSReader内部生成alibaba的字符串字段作为当前字段
 },对于用户指定Column信息，type必须填写，index/value必须选择其一。
	* **默认值:** 无

7. csvReaderConfig

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 描述：读取CSV类型文件参数配置，Map类型。读取CSV类型文件使用的CsvReader进行读取，会有很多配置，不配置则使用默认值。常见配置："csvReaderConfig":{
        "safetySwitch": false,
        "skipEmptyRecords": false,
        "useTextQualifier": false
}
	* **默认值:** 无

8. skipHeader

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：类CSV格式文件可能存在表头为标题情况，需要跳过。默认不跳过。
	* **默认值:** false

9. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：读取文件的编码配置，目前只支持utf-8/gbk
	* **默认值:** utf-8

10. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：读取的字段分隔符，可以用'\t','\001'等字符，默认值：","
	* **默认值:** ,

11. object

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：OSS的object信息，注意这里可以支持填写多个Object。 
	* **默认值:** 无

### DataXPostgresqlReader

* **显示名:** PostgreSQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXPostgresqlReader](https://github.com/qlangtech/plugins/tree/master/tis-datax-postgresql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXPostgresqlReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-postgresql-plugin.tpi]({{< relref "./tpis/#插件名tisdataxpostgresqlplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 描述：该配置项定义了插件和数据库服务器端每次批量数据获取条数，该值决定了DataX和服务器端的网络交互次数，能够较大的提升数据抽取性能。注意，该值过大(>2048)可能造成DataX进程OOM
	* **默认值:** 2000

3. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. splitPk

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：PostgresqlReader进行数据抽取时，如果指定splitPk，表示用户希望使用splitPk代表的字段进行数据分片，DataX因此会启动并发任务进行数据同步，这样可以大大提供数据同步的效能。推荐splitPk用户使用表主键，因为表主键通常情况下比较均匀，因此切分出来的分片也不容易出现数据热点。

目前splitPk仅支持整形数据切分，不支持浮点、字符串型、日期等其他类型。如果用户指定其他非支持类型，PostgresqlReader将报错！

splitPk设置为空，底层将视作用户不允许对单表进行切分，因此使用单通道进行抽取。
	* **默认值:** false

### DataXSqlserverReader

* **显示名:** SqlServer 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXSqlserverReader](https://github.com/qlangtech/plugins/tree/master/tis-datax-sqlserver-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXSqlserverReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-sqlserver-plugin.tpi]({{< relref "./tpis/#插件名tisdataxsqlserverplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 该配置项定义了插件和数据库服务器端每次批量数据获取条数，该值决定了DataX和服务器端的网络交互次数，能够较大的提升数据抽取性能。
	* **默认值:** 2000

3. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. splitPk

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** SqlServerReader进行数据抽取时，如果指定splitPk，表示用户希望使用splitPk代表的字段进行数据分片，DataX因此会启动并发任务进行数据同步，这样可以大大提供数据同步的效能。

推荐splitPk用户使用表主键，因为表主键通常情况下比较均匀，因此切分出来的分片也不容易出现数据热点。

目前splitPk仅支持整形型数据切分，不支持浮点、字符串、日期等其他类型。如果用户指定其他非支持类型，SqlServerReader将报错！

splitPk设置为空，底层将视作用户不允许对单表进行切分，因此使用单通道进行抽取。
	* **默认值:** false

### DataxMySQLReader

* **显示名:** MySQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataxMySQLReader](https://github.com/qlangtech/plugins/tree/master/tis-ds-mysql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataxMySQLReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-plugin.tpi]({{< relref "./tpis/#插件名tisdsmysqlplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 执行数据批量导出时单次从数据库中提取记录条数，可以有效减少网络IO次数，提升导出效率。切忌不能设置太大以免OOM发生
	* **默认值:** 2000

3. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. splitPk

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 进行数据抽取时，如果指定splitPk，表示用户希望使用splitPk代表的字段进行数据分片，DataX因此会启动并发任务进行数据同步，这样可以大大提供数据同步的效能。

推荐splitPk用户使用表主键，因为表主键通常情况下比较均匀，因此切分出来的分片也不容易出现数据热点。

 目前splitPk仅支持整形数据切分，不支持浮点、字符串、日期等其他类型。如果用户指定其他非支持类型，MysqlReader将报错！
 如果splitPk不填写，包括不提供splitPk或者splitPk值为空，DataX视作使用单通道同步该表数据。
	* **默认值:** false

### DataXTiDBReader

* **显示名:** TiDB 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXTiDBReader](https://github.com/qlangtech/plugins/tree/master/tis-ds-tidb-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXTiDBReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-tidb-plugin.tpi]({{< relref "./tpis/#插件名tisdstidbplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 执行数据批量导出时单次从数据库中提取记录条数，可以有效减少网络IO次数，提升导出效率。切忌不能设置太大以免OOM发生
	* **默认值:** 2000

3. 数据库名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

### DataXHdfsReader

* **显示名:** Hdfs 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXHdfsReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXHdfsReader.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin.tpi]({{< relref "./tpis/#插件名tishiveflattablebuilderplugintpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. path

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		要读取的文件路径，如果要读取多个文件，可以使用正则表达式"*"，注意这里可以支持填写多个路径
		
		要读取的文件路径，如果要读取多个文件，可以使用正则表达式"*"，注意这里可以支持填写多个路径。
		
		当指定单个Hdfs文件，HdfsReader暂时只能使用单线程进行数据抽取。二期考虑在非压缩文件情况下针对单个File可以进行多线程并发读取。
		
		当指定多个Hdfs文件，HdfsReader支持使用多线程进行数据抽取。线程并发数通过通道数指定。
		
		当指定通配符，HdfsReader尝试遍历出多个文件信息。例如: 指定/*代表读取/目录下所有的文件，指定/bazhen/\*代表读取bazhen目录下游所有的文件。HdfsReader目前只支持"*"和"?"作为文件通配符。
		
		**特别需要注意的是，DataX会将一个作业下同步的所有的文件视作同一张数据表。用户必须自己保证所有的File能够适配同一套schema信息。并且提供给DataX权限可读。**
		
		
	* **默认值:** 无

3. nullFormat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 文本文件中无法使用标准字符串定义null(空指针)，DataX提供nullFormat定义哪些字符串可以表示为null,例如如果用户配置: nullFormat:"\N"，那么如果源头数据是"\N"，DataX视作null字段
	* **默认值:** 无

4. compress

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 当fileType（文件类型）为csv下的文件压缩方式，目前仅支持 gzip、bz2、zip、lzo、lzo_deflate、hadoop-snappy、framing-snappy压缩；值得注意的是，lzo存在两种压缩格式：lzo和lzo_deflate，用户在配置的时候需要留心，不要配错了；另外，由于snappy目前没有统一的stream format，datax目前只支持最主流的两种：hadoop-snappy（hadoop上的snappy stream format）和framing-snappy（google建议的snappy stream format）;orc文件类型下无需填写
	* **默认值:** 无

5. column

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		* 描述：读取字段列表，type指定源数据的类型，index指定当前列来自于文本第几列(以0开始)，value指定当前类型为常量，不从源头文件读取数据，而是根据value值自动生成对应的列。 <br />
		
		  默认情况下，用户可以全部按照String类型读取数据，配置如下：
		
		  ```json
			 ["*"]
		  ```
		  用户可以指定Column字段信息，配置如下：
		  ```json5
		   [{
		    "type": "long",
		    "index": 0    //从本地文件文本第一列获取int字段
		   },
		   {
		    "type": "string",
		    "value": "alibaba"  //HdfsReader内部生成alibaba的字符串字段作为当前字段
		   }]
			```
			对于用户指定Column信息，type必须填写，index/value必须选择其一。
		   例子：
		   ```json
		  [
		    {
		       "index": 0,
		       "type": "long"
		    },
		    {
		       "index": 1,
		       "type": "boolean"
		    },
		    {
		       "type": "string",
		       "value": "hello"
		    },
		    {
		       "index": 2,
		       "type": "double"
		     }
		  ]
		```	
			
	* **默认值:** ["*"]

6. csvReaderConfig

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 读取CSV类型文件参数配置，Map类型。读取CSV类型文件使用的CsvReader进行读取，会有很多配置，不配置则使用默认值
	* **默认值:** 无

7. encoding

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 描述：读文件的编码配置
	* **默认值:** utf-8

8. fieldDelimiter

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 读取的字段分隔符,另外需要注意的是，HdfsReader在读取textfile数据时，需要指定字段分割符，如果不指定默认为','，HdfsReader在读取orcfile时，用户无需指定字段分割符
	* **默认值:** 无

9. fileType

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 描述：文件的类型，目前只支持用户配置为"text"、"orc"、"rc"、"seq"、"csv" 
	* **默认值:** text

10. fsName

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.datax.DataXJobSubmit

### com.qlangtech.tis.plugin.datax.DistributedOverseerDataXJobSubmit

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-local-executor.tpi]({{< relref "./tpis/#插件名tisdataxlocalexecutortpi">}})

### com.qlangtech.tis.plugin.datax.LocalDataXJobSubmit

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-local-executor.tpi]({{< relref "./tpis/#插件名tisdataxlocalexecutortpi">}})

## 扩展点:com.qlangtech.tis.async.message.client.consumer.impl.AbstractAsyncMsgDeserialize

### DefaultJSONFormatDeserialize

* **显示名:** defaultJson 

* **全路径名:** [com.qlangtech.async.message.client.to.impl.DefaultJSONFormatDeserialize](https://github.com/qlangtech/plugins/tree/master/tis-asyncmsg-rocketmq-plugin/src/main/java/com/qlangtech/async/message/client/to/impl/DefaultJSONFormatDeserialize.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-asyncmsg-rocketmq-plugin.tpi]({{< relref "./tpis/#插件名tisasyncmsgrocketmqplugintpi">}})

## 扩展点:com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory

### RocketMQListenerFactory

* **显示名:** RocketMq 

* **全路径名:** [com.qlangtech.async.message.client.consumer.RocketMQListenerFactory](https://github.com/qlangtech/plugins/tree/master/tis-asyncmsg-rocketmq-plugin/src/main/java/com/qlangtech/async/message/client/consumer/RocketMQListenerFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-asyncmsg-rocketmq-plugin.tpi]({{< relref "./tpis/#插件名tisasyncmsgrocketmqplugintpi">}})

* **参数说明:** 

1. ConsumeGroup

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		 用于标示消费客户端，当消费者重启之后可以利用该标示所对应的服务端游标，重新从上次消费点消费消息
		 
	* **默认值:** 无

2. mqTopic

	* **类型:** 单行文本

	* **必须:** 是

3. 服务端地址

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		  通过封装[rocketmq-client](https://github.com/apache/rocketmq/tree/master/client)，消费RocketMQ中的消息。
		  
		  样例代码[simple-example](https://rocketmq.apache.org/docs/simple-example/)
		  
		  ```java
		public class Consumer {
		
		    public static void main(String[] args) throws InterruptedException, MQClientException {
		
		        // Instantiate with specified consumer group name.
		        DefaultMQPushConsumer consumer = new DefaultMQPushConsumer("please_rename_unique_group_name");
		         
		        // Specify name server addresses.
		        consumer.setNamesrvAddr("localhost:9876");
		        
		        // Subscribe one more more topics to consume.
		        consumer.subscribe("TopicTest", "*");
		        // Register callback to execute on arrival of messages fetched from brokers.
		        consumer.registerMessageListener(new MessageListenerConcurrently() {
		
		            @Override
		            public ConsumeConcurrentlyStatus consumeMessage(List<MessageExt> msgs,
		                ConsumeConcurrentlyContext context) {
		                System.out.printf("%s Receive New Messages: %s %n", Thread.currentThread().getName(), msgs);
		                return ConsumeConcurrentlyStatus.CONSUME_SUCCESS;
		            }
		        });
		
		        //Launch the consumer instance.
		        consumer.start();
		
		        System.out.printf("Consumer Started.%n");
		    }
		}
		  ```
		 
		
	* **默认值:** 无

4. 反序列化器

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		* defaultJson
		
		    默认反序列化方式，从MQ中读取到字节流之后通过Alibaba FastJson反序列化成[DTO对象](https://github.com/qlangtech/tis-solr/blob/master/tis-plugin/src/main/java/com/qlangtech/tis/realtime/transfer/DTO.java)
		    
		    
	* **默认值:** 无

### FlinkCDCMongoDBSourceFactory

* **显示名:** Flink-CDC-MongoDB 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cdc.mongdb.FlinkCDCMongoDBSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-cdc-mongdb-plugin/src/main/java/com/qlangtech/plugins/incr/flink/cdc/mongdb/FlinkCDCMongoDBSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-cdc-mongdb-plugin.tpi]({{< relref "./tpis/#插件名tisflinkcdcmongdbplugintpi">}})

* **参数说明:** 

1. copyExistingMaxThreads

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		The number of threads to use when performing the data copy.
		
		Default: `Processors Count`
		
	* **默认值:** 无

2. copyExistingPipeline

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		
		An array of JSON objects describing the pipeline operations to run when copying existing data.
		
		This can improve the use of indexes by the copying manager and make copying more efficient. 
		eg. 
		```json
		[{"$match": {"closed": "false"}}] 
		```
		ensures that only documents in which the closed field is set to false are copied.
		
	* **默认值:** 无

3. errorsLogEnable

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 
		
		Whether details of failed operations should be written to the log file.
		
		Default: `true`
		
	* **默认值:** 无

4. connectionOptions

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 
		
		The ampersand-separated connection options of MongoDB. eg: `replicaSet=test&connectTimeoutMS=300000`
		
		Default: none
		
	* **默认值:** 无

5. copyExistingQueueSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		The max size of the queue to use when copying data.
		
		Default: `16000`
		
	* **默认值:** 无

6. pollAwaitTimeMillis

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		The amount of time to wait before checking for new results on the change stream.
		
		Default: `1500`
		
	* **默认值:** 无

7. copyExisting

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 
		
		Whether copy existing data from source collections.
		
	* **默认值:** 无

8. errorsTolerance

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 
		
		Whether to continue processing messages if an error is encountered. 
		Accept `none` or `all`. 
		
		* `none`: the connector reports an error and blocks further processing of the rest of the records when it encounters an error. 
		
		* `all`: the connector silently ignores any bad messages.
		
		Default: `none`
		
	* **默认值:** 无

9. heartbeatIntervalMillis

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		The length of time in milliseconds between sending heartbeat messages. Use 0 to disable.
		
		Default: `0` 
	* **默认值:** 无

10. pollMaxBatchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		Maximum number of change stream documents to include in a single batch when polling for new data.
		
		Default: `1000`
		
	* **默认值:** 无

### FlinkCDCMySQLSourceFactory

* **显示名:** Flink-CDC-MySQL 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cdc.mysql.FlinkCDCMySQLSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-cdc-mysql-plugin/src/main/java/com/qlangtech/plugins/incr/flink/cdc/mysql/FlinkCDCMySQLSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-cdc-mysql-plugin.tpi]({{< relref "./tpis/#插件名tisflinkcdcmysqlplugintpi">}})

* **参数说明:** 

1. startupOptions

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		Debezium startup options
		
		参数详细请参考：[https://ververica.github.io/flink-cdc-connectors/master/content/connectors/mysql-cdc.html#connector-options](https://ververica.github.io/flink-cdc-connectors/master/content/connectors/mysql-cdc.html#connector-options)
		，[https://debezium.io/documentation/reference/1.5/connectors/mysql.html#mysql-property-snapshot-mode](https://debezium.io/documentation/reference/1.5/connectors/mysql.html#mysql-property-snapshot-mode)
		
		* `Initial`:
		  Performs an initial snapshot on the monitored database tables upon first startup, and continue to read the latest binlog.
		     
		* `Earliest`:
		  Never to perform snapshot on the monitored database tables upon first startup, just read from the beginning of the binlog. This should be used with care, as it is only valid when the binlog is guaranteed to contain the entire history of the database.
		
		* `Latest`:
		  Never to perform snapshot on the monitored database tables upon first startup, just read from the end of the binlog which means only have the changes since the connector was started.
		
		     
	* **默认值:** latest

### FlinkCDCOracleSourceFactory

* **显示名:** Flink-CDC-Oracle 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cdc.oracle.FlinkCDCOracleSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-cdc-oracle-plugin/src/main/java/com/qlangtech/plugins/incr/flink/cdc/oracle/FlinkCDCOracleSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-cdc-oracle-plugin.tpi]({{< relref "./tpis/#插件名tisflinkcdcoracleplugintpi">}})

* **参数说明:** 

1. startupOptions

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		Optional startup mode for Oracle CDC consumer, valid enumerations are "initial" and "latest-offset". Please see Startup Reading Positionsection for more detailed information.
		
		参数详细请参考：[https://ververica.github.io/flink-cdc-connectors/master/content/connectors/oracle-cdc.html#connector-options](https://ververica.github.io/flink-cdc-connectors/master/content/connectors/oracle-cdc.html#connector-options)
		，[https://debezium.io/documentation/reference/1.5/connectors/oracle.html#oracle-connector-properties](https://debezium.io/documentation/reference/1.5/connectors/oracle.html#oracle-connector-properties)
		
		* `Initial`:
		  Performs an initial snapshot on the monitored database tables upon first startup, and continue to read the latest binlog.
		     
		* `Latest`:
		 Never to perform a snapshot on the monitored database tables upon first startup, just read from the change since the connector was started.
		 
		 **Note**: the mechanism of `scan.startup.mode` option relying on Debezium’s `snapshot.mode` configuration. So please do not use them together. 
		 If you specific both `scan.startup.mode` and `debezium.snapshot.mode` options in the table DDL, it may make `scan.startup.mode` doesn’t work.
		
		     
	* **默认值:** latest

### FlinkCDCPostreSQLSourceFactory

* **显示名:** Flink-CDC-PostgreSQL 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cdc.postgresql.FlinkCDCPostreSQLSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-cdc-postgresql-plugin/src/main/java/com/qlangtech/plugins/incr/flink/cdc/postgresql/FlinkCDCPostreSQLSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-cdc-postgresql-plugin.tpi]({{< relref "./tpis/#插件名tisflinkcdcpostgresqlplugintpi">}})

### TiKVKafkaMQListenerFactory

* **显示名:** TiCDC-Kafka 

* **全路径名:** [com.qlangtech.async.message.client.kafka.TiKVKafkaMQListenerFactory](https://github.com/qlangtech/plugins/tree/master/tis-kafka-plugin/src/main/java/com/qlangtech/async/message/client/kafka/TiKVKafkaMQListenerFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-kafka-plugin.tpi]({{< relref "./tpis/#插件名tiskafkaplugintpi">}})

* **参数说明:** 

1. 消费端ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

2. MQ服务端地址

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

3. 偏移量策略

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. 主题

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.plugin.ds.DataSourceFactory

### CassandraDatasourceFactory

* **显示名:** Cassandra 

* **全路径名:** [com.qlangtech.tis.plugin.ds.cassandra.CassandraDatasourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-cassandra-plugin/src/main/java/com/qlangtech/tis/plugin/ds/cassandra/CassandraDatasourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-cassandra-plugin.tpi]({{< relref "./tpis/#插件名tisdataxcassandraplugintpi">}})

* **参数说明:** 

1. password

	* **类型:** 密码

	* **必须:** 否

2. port

	* **类型:** 整型数字

	* **必须:** 是

3. keyspace

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 需要同步的表所在的keyspace
	* **默认值:** 无

4. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

5. host

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** Cassandra连接点的域名或ip，多个node之间用逗号分隔。
	* **默认值:** <ip|host>[,<ip|host>]

6. userName

	* **类型:** 单行文本

	* **必须:** 是

7. useSSL

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 是否使用SSL连接
	* **默认值:** 无

### ClickHouseDataSourceFactory

* **显示名:** ClickHouse 

* **全路径名:** [com.qlangtech.tis.plugin.ds.clickhouse.ClickHouseDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-clickhouse-plugin/src/main/java/com/qlangtech/tis/plugin/ds/clickhouse/ClickHouseDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-clickhouse-plugin.tpi]({{< relref "./tpis/#插件名tisdataxclickhouseplugintpi">}})

* **参数说明:** 

1. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

2. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 8123

3. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据库名,创建JDBC实例时用
	* **默认值:** 无

4. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

5. 节点描述

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

6. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** default

### StarRocksSourceFactory

* **显示名:** StarRocks 

* **全路径名:** [com.qlangtech.tis.plugin.ds.starrocks.StarRocksSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/ds/starrocks/StarRocksSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#插件名tisdataxdorisplugintpi">}})

* **参数说明:** 

1. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** Doris数据库的密码
	* **默认值:** 无

2. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 9030

3. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Doris表的数据库名称
	* **默认值:** 无

4. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

5. loadUrl

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		Doris FE的地址用于Streamload，可以为多个fe地址，fe_ip:fe_http_port
		样例：
		
		```json
		["172.28.17.100:8030", "172.28.17.100:8030"]
		```
	* **默认值:** []

6. 节点描述

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 目标数据库的 JDBC 连接信息，用于执行preSql及postSql
	* **默认值:** 无

7. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Doris数据库的用户名
	* **默认值:** root

### DorisSourceFactory

* **显示名:** Doris 

* **全路径名:** [com.qlangtech.tis.plugin.ds.doris.DorisSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/ds/doris/DorisSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#插件名tisdataxdorisplugintpi">}})

* **参数说明:** 

1. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** Doris数据库的密码
	* **默认值:** 无

2. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 9030

3. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Doris表的数据库名称
	* **默认值:** 无

4. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

5. loadUrl

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		Doris FE的地址用于Streamload，可以为多个fe地址，fe_ip:fe_http_port
		样例：
		
		```json
		["172.28.17.100:8030", "172.28.17.100:8030"]
		```
	* **默认值:** []

6. 节点描述

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 目标数据库的 JDBC 连接信息，用于执行preSql及postSql
	* **默认值:** 无

7. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Doris数据库的用户名
	* **默认值:** root

### MangoDBDataSourceFactory

* **显示名:** MongoDB 

* **全路径名:** [com.qlangtech.tis.plugin.ds.mangodb.MangoDBDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-mongodb-plugin/src/main/java/com/qlangtech/tis/plugin/ds/mangodb/MangoDBDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-mongodb-plugin.tpi]({{< relref "./tpis/#插件名tisdataxmongodbplugintpi">}})

* **参数说明:** 

1. password

	* **类型:** 密码

	* **必须:** 否

	* **说明:** MongoDB的密码。【选填】
	* **默认值:** 无

2. address

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** MongoDB的数据地址信息，因为MonogDB可能是个集群，则ip端口信息需要以Json数组的形式给出,可填写多个每个address中间可用';'分隔【必填】
	* **默认值:** <host>:27017[;<host>:27017]

3. 授权机制

	* **类型:** 单选

	* **必须:** 是

	* **说明:** the authentication mechanism
	* **默认值:** SCRAM-SHA-1

4. userSource

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 保存用户的库
	* **默认值:** admin

5. dbName

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** MongoDB 数据库名称
	* **默认值:** 无

6. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

7. username

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** MongoDB的用户名。【选填】
	* **默认值:** 无

### OracleDataSourceFactory

* **显示名:** Oracle 

* **全路径名:** [com.qlangtech.tis.plugin.ds.oracle.OracleDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/ds/oracle/OracleDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#插件名tisdataxoracleplugintpi">}})

* **参数说明:** 

1. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

2. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 1521

3. 以服务名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		从 Oracle 8i 开始，Oracle 已经引入了 Service Name 的概念以支持数据库的集群 (RAC) 部署，一个 Service Name 可作为一个数据库的逻辑概念，统一对该数据库不同的 SID 实例的连接。
		
		以服务名方式连接方式 (即 port 和 dbname 中间使用 “ / ” 分隔开)，即：
		
		"jdbc:oracle:thin:@" + hostname + ":" + port + **"/"** + dbname
		
	* **默认值:** true

4. SID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据库名,创建JDBC实例时用
	* **默认值:** xe

5. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

6. 服务节点

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

7. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** system

### PGDataSourceFactory

* **显示名:** PostgreSQL 

* **全路径名:** [com.qlangtech.tis.plugin.ds.postgresql.PGDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax-postgresql-plugin/src/main/java/com/qlangtech/tis/plugin/ds/postgresql/PGDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-postgresql-plugin.tpi]({{< relref "./tpis/#插件名tisdataxpostgresqlplugintpi">}})

* **参数说明:** 

1. 编码

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 数据数据
	* **默认值:** 无

2. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

3. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 5432

4. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据库名,创建JDBC实例时用
	* **默认值:** 无

5. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

6. 附加参数

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

7. 节点描述

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

8. tabSchema

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Specify the schema (or several schema separated by commas) to be set in the search-path. This schema will be used to resolve unqualified object names used in statements over this connection.
	* **默认值:** public

9. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** root

### SqlServerDatasourceFactory

* **显示名:** SqlServer 

* **全路径名:** [com.qlangtech.tis.plugin.ds.sqlserver.SqlServerDatasourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax-sqlserver-plugin/src/main/java/com/qlangtech/tis/plugin/ds/sqlserver/SqlServerDatasourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-sqlserver-plugin.tpi]({{< relref "./tpis/#插件名tisdataxsqlserverplugintpi">}})

* **参数说明:** 

1. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

2. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

3. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据库名,创建JDBC实例时用
	* **默认值:** 无

4. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

5. 附加参数

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

6. 节点描述

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

7. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** root

### MySQLV5DataSourceFactory

* **显示名:** MySQL-V5 

* **全路径名:** [com.qlangtech.tis.plugin.ds.mysql.MySQLV5DataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-mysql-v5-plugin/src/main/java/com/qlangtech/tis/plugin/ds/mysql/MySQLV5DataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-v5-plugin.tpi]({{< relref "./tpis/#插件名tisdsmysqlv5plugintpi">}})

* **参数说明:** 

1. 编码

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 数据数据
	* **默认值:** 无

2. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

3. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 3306

4. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据库名,创建JDBC实例时用
	* **默认值:** 无

5. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

6. 附加参数

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

7. 节点描述

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

8. 传输压缩

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		与服务端通信时采用zlib进行压缩，效果请参考[https://blog.csdn.net/Shadow_Light/article/details/100749537](https://blog.csdn.net/Shadow_Light/article/details/100749537)
		
		
	* **默认值:** true

9. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** root

### MySQLV8DataSourceFactory

* **显示名:** MySQL-V8 

* **全路径名:** [com.qlangtech.tis.plugin.ds.mysql.MySQLV8DataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-mysql-v8-plugin/src/main/java/com/qlangtech/tis/plugin/ds/mysql/MySQLV8DataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-v8-plugin.tpi]({{< relref "./tpis/#插件名tisdsmysqlv8plugintpi">}})

* **参数说明:** 

1. 编码

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 数据数据
	* **默认值:** 无

2. 密码

	* **类型:** 密码

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

3. 端口

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 3306

4. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据库名,创建JDBC实例时用
	* **默认值:** 无

5. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

6. 附加参数

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 无
	* **默认值:** 无

7. 节点描述

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

8. 传输压缩

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		与服务端通信时采用zlib进行压缩，效果请参考[https://blog.csdn.net/Shadow_Light/article/details/100749537](https://blog.csdn.net/Shadow_Light/article/details/100749537)
		
		
	* **默认值:** true

9. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** root

### TiKVDataSourceFactory

* **显示名:** TiDB 

* **全路径名:** [com.qlangtech.tis.plugin.ds.tidb.TiKVDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-ds-tidb-plugin/src/main/java/com/qlangtech/tis/plugin/ds/tidb/TiKVDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-tidb-plugin.tpi]({{< relref "./tpis/#插件名tisdstidbplugintpi">}})

* **参数说明:** 

1. 数据库名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

2. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义的名称
	* **默认值:** 无

3. PD地址

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

































