---
title: TIS扩展点列表
linktitle: TIS扩展点列表
date: 2014-03-10
type: book
weight : 11
---

## 扩展点:com.qlangtech.tis.manage.IAppSource

### com.qlangtech.tis.plugin.datax.DefaultDataxProcessor

* **显示名:** DataxProcessor 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DefaultDataxProcessor](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-common-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DefaultDataxProcessor.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-common-plugin.tpi]({{< relref "./tpis/#tis-datax-common-plugintpi">}})

* **参数说明:** 

1. 所属部门

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

2. 实例名称

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

3. 全局配置

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** datax-global-config

4. 接口人

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

## 扩展点:com.qlangtech.plugins.incr.flink.launch.CheckpointFactory

### com.qlangtech.plugins.incr.flink.launch.ckpt.CKOn

* **显示名:** on 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.ckpt.CKOn](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/ckpt/CKOn.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. maxFaildNum

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The tolerable checkpoint failure number. If set to 0, that means we do not tolerance any checkpoint failure.
	* **默认值:** 0

2. ckpointInterval

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Gets the interval in which checkpoints are periodically scheduled.<br /><br />This setting defines the base interval. Checkpoint triggering may be delayed by the settings <code class="highlighter-rouge">execution.checkpointing.max-concurrent-checkpoints</code> and <code class="highlighter-rouge">execution.checkpointing.min-pause</code>
		
		 单位：`秒`
	* **默认值:** 200

3. enableExternal

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Externalized checkpoints write their meta data out to persistent storage and are not automatically cleaned up when the owning job fails or is suspended (terminating with job status <code class="highlighter-rouge">JobStatus#FAILED</code> or <code class="highlighter-rouge">JobStatus#SUSPENDED</code>. In this case, you have to manually clean up the checkpoint state, both the meta data and actual program state.<br /><br />The mode defines how an externalized checkpoint should be cleaned up on job cancellation. If you choose to retain externalized checkpoints on cancellation you have to handle checkpoint clean up manually when you cancel the job as well (terminating with job status <code class="highlighter-rouge">JobStatus#CANCELED</code>).<br /><br />The target directory for externalized checkpoints is configured via <code class="highlighter-rouge">state.checkpoints.dir</code>.
	* **默认值:** RETAIN_ON_CANCELLATION

4. maxConcurrentNum

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The maximum number of checkpoint attempts that may be in progress at the same time. If this value is n, then no checkpoints will be triggered while n checkpoint attempts are currently in flight. For the next checkpoint to be triggered, one checkpoint attempt would need to finish or expire.
	* **默认值:** 1

5. enableUnaligned

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Enables unaligned checkpoints, which greatly reduce checkpointing times under backpressure.<br /><br />Unaligned checkpoints contain data stored in buffers as part of the checkpoint state, which allows checkpoint barriers to overtake these buffers. Thus, the checkpoint duration becomes independent of the current throughput as checkpoint barriers are effectively not embedded into the stream of data anymore.<br /><br />Unaligned checkpoints can only be enabled if <code class="highlighter-rouge">execution.checkpointing.mode</code> is <code class="highlighter-rouge">EXACTLY_ONCE</code> and if <code class="highlighter-rouge">execution.checkpointing.max-concurrent-checkpoints</code> is 1
	* **默认值:** false

6. minPause

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The minimal pause between checkpointing attempts. This setting defines how soon thecheckpoint coordinator may trigger another checkpoint after it becomes possible to triggeranother checkpoint with respect to the maximum number of concurrent checkpoints(see <code class="highlighter-rouge">execution.checkpointing.max-concurrent-checkpoints</code>).<br /><br />If the maximum number of concurrent checkpoints is set to one, this setting makes effectively sure that a minimum amount of time passes where no checkpoint is in progress at all.
		
		 单位：`秒`
	* **默认值:** 0

7. checkpointTimeout

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The maximum time that a checkpoint may take before being discarded.
		
		 单位：`秒`
	* **默认值:** 600

8. checkpointMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		The checkpointing mode (exactly-once vs. at-least-once).
	* **默认值:** EXACTLY_ONCE

9. forceUnaligned

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Forces unaligned checkpoints, particularly allowing them for iterative jobs.
	* **默认值:** false

### com.qlangtech.plugins.incr.flink.launch.ckpt.CKOff

* **显示名:** off 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.ckpt.CKOff](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/ckpt/CKOff.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

## 扩展点:com.qlangtech.tis.config.ParamsConfig

### com.qlangtech.tis.plugin.datax.DataXGlobalConfig

* **显示名:** DataX-global 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXGlobalConfig](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-common-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXGlobalConfig.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-common-plugin.tpi]({{< relref "./tpis/#tis-datax-common-plugintpi">}})

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

### com.qlangtech.tis.plugin.aliyun.HttpEndpoint

* **显示名:** httpToken 

* **全路径名:** [com.qlangtech.tis.plugin.aliyun.HttpEndpoint](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-common-plugin/src/main/java/com/qlangtech/tis/plugin/aliyun/HttpEndpoint.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-common-plugin.tpi]({{< relref "./tpis/#tis-datax-common-plugintpi">}})

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

### com.qlangtech.tis.kerberos.KerberosCfg

* **显示名:** kerberos 

* **全路径名:** [com.qlangtech.tis.kerberos.KerberosCfg](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hdfs-plugin/src/main/java/com/qlangtech/tis/kerberos/KerberosCfg.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hdfs-plugin/tis-datax-hdfs-plugin_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hdfs-plugin/tis-datax-hdfs-plugin_hadoop_273tpi">}})

* **参数说明:** 

1. principal

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		[详细说明](https://docs.cloudera.com/documentation/enterprise/5-3-x/topics/cm_sg_principal_keytab.html)
		
		Kerberos 下的用户可以称为 Principal，缩写可以是 pric（见于一些配置文件中），由三个部分组成，分别是 primary, instance 和 realm。Kerberos principal 用于使用 Kerberos 做为安全加固的系统中，来代表一个用户唯一的身份。primary 又称为用户 user component，可以是任意的字符串或者就是操作系统下的用户名等等。
		
		然后接着的部分叫做 instance，是用来给某个角色的用户或者服务来创建 principal 的。一个 instance，会被 "/" 和 primary 分隔。最后一个部分是 realm，概念上很像 DNS 上的 domain 域名，可以用来定义一组相似的对象，也可以说 realm 定义了一组 principals。每一个 realm 可以有私有的配置，包括 KDC 的地址和加密的算法，都可以独立存在。有些大型公司通常会创建一个独立的 realm 来分发管理员的权限。
		
		Kerberos 给 principal 指定 ticket 票据，让他们可以访问用 Kerberos 做安全加固的 Hadoop 服务。principal 可以形如: username/fully.qualified.domain.name@YOUR_REALM.COM。username 是指原型 Hadoop 服务的 Unix 账户，例如 hdfs 或者 mapred 之类的。
		
		而对于个人用户（指那些需要访问集群，比如 Hive Client 或者 HDFS Client 连接的这些），username 也是指 Unix 账号，例如 Tony, runzhliu 之类。只包含 primary 的 principal 也是可以接受的，例如 runzhliu@YOUR_REALM.COM。
		
		
	* **默认值:** 无

2. name

	* **类型:** 单行文本

	* **必须:** 是

3. keytabPath

	* **类型:** 文件

	* **必须:** 是

	* **说明:** 
		
		Keytab 就是一个包含了（若干）principals 和一个加密了的 principal key的文件。一个 Keytab 文件每个 host 都是唯一的，因为 principal 的定义了包含了 hostname 的。这个文件可以用来认证，而不需要传递公开的密码，因为只要有这个 Keytab 就可以代表这个 principal 来操作 Hadoop 的服务。所以说 Keytab 是需要保管好的。
		
	* **默认值:** 无

### com.qlangtech.tis.config.spark.impl.DefaultSparkConnGetter

* **显示名:** SparkConn 

* **全路径名:** [com.qlangtech.tis.config.spark.impl.DefaultSparkConnGetter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/spark/impl/DefaultSparkConnGetter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. 连接方式

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		客户端连接Spark服务端可选择以下连接方式之一：
		
		* [Amazon EC2](https://github.com/amplab/spark-ec2): scripts that let you launch a cluster on EC2 in about 5 minutes
		* [Standalone Deploy Mode](https://spark.apache.org/docs/2.4.4/spark-standalone.html): launch a standalone cluster quickly without a third-party cluster manager
		* [Mesos](https://spark.apache.org/docs/2.4.4/running-on-mesos.html): deploy a private cluster using Apache Mesos
		* [YARN](https://spark.apache.org/docs/2.4.4/running-on-yarn.html): deploy Spark on top of Hadoop NextGen (YARN)
		* [Kubernetes](https://spark.apache.org/docs/2.4.4/running-on-kubernetes.html#cluster-mode): deploy Spark on top of Kubernetes
		
		例如，选择**Standalone Deploy Mode**模式模式，可设置：`spark://192.168.28.201:7077`
	* **默认值:** 无

2. name

	* **类型:** 单行文本

	* **必须:** 是

### com.qlangtech.tis.config.yarn.YarnConfig

* **显示名:** yarn 

* **全路径名:** [com.qlangtech.tis.config.yarn.YarnConfig](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/yarn/YarnConfig.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

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

### com.qlangtech.tis.hive.DefaultHiveConnGetter

* **显示名:** HiveConn 

* **全路径名:** [com.qlangtech.tis.hive.DefaultHiveConnGetter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/hive/DefaultHiveConnGetter.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. 元数据地址

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Hive元数据服务地址，用于获取Hive中存放的表的元数据信息
		
		地址格式如：`thrift://{{hiveserver}}:9083`
	* **默认值:** thrift://{{hiveserver}}:9083

2. userToken

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 当选择为'on', 用户需要填写用户名和密码
	* **默认值:** off

3. dbName

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Hive 数据库使用的库名，请在执行任务前先创建完成
	* **默认值:** default

4. name

	* **类型:** 单行文本

	* **必须:** 是

5. hiveAddress

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 描述：Hive Thrift Server2。格式：ip:端口；例如：127.0.0.1:9000
	* **默认值:** {ip|host}:10000

### com.qlangtech.tis.config.k8s.impl.DefaultK8sContext

* **显示名:** k8s 

* **全路径名:** [com.qlangtech.tis.config.k8s.impl.DefaultK8sContext](https://github.com/qlangtech/plugins/tree/master/tis-k8s-plugin/src/main/java/com/qlangtech/tis/config/k8s/impl/DefaultK8sContext.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-k8s-plugin.tpi]({{< relref "./tpis/#tis-k8s-plugintpi">}})

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

### com.qlangtech.plugins.incr.flink.common.FlinkCluster

* **显示名:** Flink-Cluster 

* **全路径名:** [com.qlangtech.plugins.incr.flink.common.FlinkCluster](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/common/FlinkCluster.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

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

## 扩展点:com.qlangtech.tis.plugin.datax.hudi.spark.SparkSubmitParams

### com.qlangtech.tis.plugin.datax.hudi.spark.SparkSubmitParams

* **显示名:** on 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.spark.SparkSubmitParams](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/spark/SparkSubmitParams.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. executorMemory

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Configuration key for the Spark executor memory. the value format like '1G' or '1024M'
	* **默认值:** 3G

2. driverMemory

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Configuration key for the Spark driver memory. the value format like '1G' or '1024M'
	* **默认值:** 1G

3. deployMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		--deploy-mode DEPLOY_MODE
		
		Whether to launch the driver program locally **("client")** or on one of the worker machines inside the
		cluster **("cluster")**(Default: client).
		
	* **默认值:** cluster

4. executorCores

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** Configuration key for the number of executor CPU cores
	* **默认值:** 2

## 扩展点:com.qlangtech.tis.datax.job.DataXJobWorker

### com.qlangtech.tis.plugin.datax.K8SDataXJobWorker

* **显示名:** DataX-Worker 

* **全路径名:** [com.qlangtech.tis.plugin.datax.K8SDataXJobWorker](https://github.com/qlangtech/plugins/tree/master/tis-k8s-plugin/src/main/java/com/qlangtech/tis/plugin/datax/K8SDataXJobWorker.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-k8s-plugin.tpi]({{< relref "./tpis/#tis-k8s-plugintpi">}})

* **参数说明:** 

1. zkQueuePath

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 分布式队列持久化元数据会保存在该Zookeeper子路径下
	* **默认值:** /datax/jobs

2. zkAddress

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		执行器利用基于Zookeeper的分布式队列来向K8S集群中分发DataX任务。
		
		如本地环境中还没有部署Zookeeper，TIS Uber安装包中提供了Zookeeper服务端安装包，启动方法：
		
		```shell script
		cd ./tis-uber
		sh ./bin/zookeeper start
		```
		
	* **默认值:** 无

3. k8sImage

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 选择一个与该执行器匹配的Docker Image实例
	* **默认值:** datax-worker

### com.qlangtech.plugins.incr.flink.cluster.FlinkK8SClusterManager

* **显示名:** Flink-Cluster 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cluster.FlinkK8SClusterManager](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/cluster/FlinkK8SClusterManager.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. k8sImage

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 选择一个与该执行器匹配的Docker Image实例
	* **默认值:** flink-cluster

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

## 扩展点:com.qlangtech.tis.datax.DataXJobSubmit

### com.qlangtech.tis.plugin.datax.EmbeddedDataXJobSubmit

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-local-embedded-executor.tpi]({{< relref "./tpis/#tis-datax-local-embedded-executortpi">}})

### com.qlangtech.tis.plugin.datax.DistributedOverseerDataXJobSubmit

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-local-executor.tpi]({{< relref "./tpis/#tis-datax-local-executortpi">}})

### com.qlangtech.tis.plugin.datax.LocalDataXJobSubmit

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-local-executor.tpi]({{< relref "./tpis/#tis-datax-local-executortpi">}})

## 扩展点:com.qlangtech.plugins.incr.flink.chunjun.poll.Polling

### com.qlangtech.plugins.incr.flink.chunjun.poll.RunInterval

* **显示名:** RunInterval 

* **全路径名:** [com.qlangtech.plugins.incr.flink.chunjun.poll.RunInterval](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-chunjun-base-plugin/src/main/java/com/qlangtech/plugins/incr/flink/chunjun/poll/RunInterval.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-chunjun-base-plugin.tpi]({{< relref "./tpis/#tis-chunjun-base-plugintpi">}})

* **参数说明:** 

1. startLocation

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 增量查询起始位置
	* **默认值:** 无

2. useMaxFunc

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		描述：用于标记是否保存endLocation位置的一条或多条数据，true：不保存，false(默认)：保存， 某些情况下可能出现最后几条数据被重复记录的情况，可以将此参数配置为true
		
		useMaxFunc的使用场景
		​ 考虑可能存在这样的场景：某一次增量同步后的endLocation为x，在下一次增量同步作业启动的间隙中，表内又写入了增量键的值=x的数据。按照默认的情况，假设增量键为id，下一次作业会拼接例如SELECT id,name,age FROM table WHERE id > x。此时在间隙中插入的id=x的数据将会丢失。
		
		​ 为了对应上述场景，chunjun增量同步提供了配置项useMaxFunc（默认值为false）。在设置useMaxFunc=true时，chunjun会在增量作业启动时获取当前数据库中增量键的最大值作为本次作业的endLocation，并且将用于startLocation的运算符号从'>'改为'>='。例如：
		
		某一次增量启动时上次作业的endLocation为10，id最大值为100，那么将会拼接SQL语句 SELECT id,name,age FROM table WHERE id >= 10 AND id < 100
		下一次增量作业启动时id的最大值为200，那么将会拼接SQL语句 SELECT id,name,age FROM table WHERE id >=100 AND id < 200
	* **默认值:** true

3. 轮询间隔

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 轮询间隔时间，从数据库中拉取数据的间隔时间，默认为5000毫秒
	* **默认值:** 5000

4. incrColumn

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 增量字段，可以是对应的增量字段名
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.plugin.ds.oracle.ConnEntity

### com.qlangtech.tis.plugin.ds.oracle.impl.SIDConnEntity

* **显示名:** SID 

* **全路径名:** [com.qlangtech.tis.plugin.ds.oracle.impl.SIDConnEntity](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/ds/oracle/impl/SIDConnEntity.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#tis-datax-oracle-plugintpi">}})

* **参数说明:** 

1. SID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** xe

### com.qlangtech.tis.plugin.ds.oracle.impl.ServiceNameConnEntity

* **显示名:** ServiceName 

* **全路径名:** [com.qlangtech.tis.plugin.ds.oracle.impl.ServiceNameConnEntity](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/ds/oracle/impl/ServiceNameConnEntity.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#tis-datax-oracle-plugintpi">}})

* **参数说明:** 

1. serviceName

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		从 Oracle 8i 开始，Oracle 已经引入了 Service Name 的概念以支持数据库的集群 (RAC) 部署，一个 Service Name 可作为一个数据库的逻辑概念，统一对该数据库不同的 SID 实例的连接。
		
		以服务名方式连接方式 (即 port 和 dbname 中间使用 “ / ” 分隔开)，即：
		
		"jdbc:oracle:thin:@" + hostname + ":" + port + **"/"** + dbname
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.plugins.incr.flink.connector.hudi.scripttype.ScriptType

### com.qlangtech.tis.plugins.incr.flink.connector.hudi.scripttype.StreamApiType

* **显示名:** StreamAPI 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.hudi.scripttype.StreamApiType](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-hudi-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/hudi/scripttype/StreamApiType.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-hudi-plugin/tis-sink-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-sink-hudi-plugin/tis-sink-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

## 扩展点:com.qlangtech.tis.async.message.client.consumer.impl.MQListenerFactory

### com.qlangtech.async.message.client.consumer.RocketMQListenerFactory

* **显示名:** RocketMq 

* **全路径名:** [com.qlangtech.async.message.client.consumer.RocketMQListenerFactory](https://github.com/qlangtech/plugins/tree/master/tis-asyncmsg-rocketmq-plugin/src/main/java/com/qlangtech/async/message/client/consumer/RocketMQListenerFactory.java) 

* **提供者:** [TIS](https://tis.pub/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-asyncmsg-rocketmq-plugin.tpi]({{< relref "./tpis/#tis-asyncmsg-rocketmq-plugintpi">}})

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

### com.qlangtech.plugins.incr.flink.cdc.mongdb.FlinkCDCMongoDBSourceFactory

* **显示名:** Flink-CDC-MongoDB 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cdc.mongdb.FlinkCDCMongoDBSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-cdc-mongdb-plugin/src/main/java/com/qlangtech/plugins/incr/flink/cdc/mongdb/FlinkCDCMongoDBSourceFactory.java) 

* **提供者:** [FlinkCDC](https://ververica.github.io/flink-cdc-connectors/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-cdc-mongdb-plugin.tpi]({{< relref "./tpis/#tis-flink-cdc-mongdb-plugintpi">}})

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

### com.qlangtech.plugins.incr.flink.cdc.mysql.FlinkCDCMySQLSourceFactory

* **显示名:** Flink-CDC-MySQL 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cdc.mysql.FlinkCDCMySQLSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-cdc-mysql-plugin/src/main/java/com/qlangtech/plugins/incr/flink/cdc/mysql/FlinkCDCMySQLSourceFactory.java) 

* **提供者:** [FlinkCDC](https://ververica.github.io/flink-cdc-connectors/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-cdc-mysql-plugin.tpi]({{< relref "./tpis/#tis-flink-cdc-mysql-plugintpi">}})

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

### com.qlangtech.plugins.incr.flink.cdc.oracle.FlinkCDCOracleSourceFactory

* **显示名:** Flink-CDC-Oracle 

* **全路径名:** [com.qlangtech.plugins.incr.flink.cdc.oracle.FlinkCDCOracleSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-cdc-oracle-plugin/src/main/java/com/qlangtech/plugins/incr/flink/cdc/oracle/FlinkCDCOracleSourceFactory.java) 

* **提供者:** [FlinkCDC](https://ververica.github.io/flink-cdc-connectors/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-cdc-oracle-plugin.tpi]({{< relref "./tpis/#tis-flink-cdc-oracle-plugintpi">}})

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

### com.qlangtech.tis.plugins.incr.flink.connector.source.MySQLSourceFactory

* **显示名:** Flink-Chunjun-MySQL 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.source.MySQLSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-chunjun-mysql-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/source/MySQLSourceFactory.java) 

* **提供者:** [Chunjun](https://dtstack.github.io/chunjun) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-chunjun-mysql-plugin.tpi]({{< relref "./tpis/#tis-flink-chunjun-mysql-plugintpi">}})

* **参数说明:** 

1. queryTimeOut

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		描述：查询超时时间，单位秒。
		
		注意：当数据量很大，或者从视图查询，或者自定义sql查询时，可通过此参数指定超时时间。
		
		必选：否
		
		参数类型：int
		
		默认值：1000
	* **默认值:** 1000

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		描述：一次性从数据库中读取多少条数据，默认一次将所有结果都读取到内存中，在数据量很大时可能会造成OOM，设置这个参数可以控制每次读取fetchSize条数据，而不是默认的把所有数据一次读取出来；开启fetchSize需要满足：数据库版本要高于5.0.2，连接参数useCursorFetch=true。
		
		注意：此参数的值不可设置过大，否则会读取超时，导致任务失败。
		
		必选：否
		
		参数类型：int
		
		默认值：1024
		
	* **默认值:** 1024

### com.qlangtech.plugins.incr.flink.chunjun.postgresql.source.ChunjunPostgreSQLSourceFactory

* **显示名:** Flink-Chunjun-Postgres 

* **全路径名:** [com.qlangtech.plugins.incr.flink.chunjun.postgresql.source.ChunjunPostgreSQLSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-chunjun-postgresql-plugin/src/main/java/com/qlangtech/plugins/incr/flink/chunjun/postgresql/source/ChunjunPostgreSQLSourceFactory.java) 

* **提供者:** [Chunjun](https://dtstack.github.io/chunjun) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-chunjun-postgresql-plugin.tpi]({{< relref "./tpis/#tis-flink-chunjun-postgresql-plugintpi">}})

* **参数说明:** 

1. queryTimeOut

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		描述：查询超时时间，单位秒。
		
		注意：当数据量很大，或者从视图查询，或者自定义sql查询时，可通过此参数指定超时时间。
		
		必选：否
		
		参数类型：int
		
		默认值：1000
	* **默认值:** 1000

2. fetchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		描述：一次性从数据库中读取多少条数据，默认一次将所有结果都读取到内存中，在数据量很大时可能会造成OOM，设置这个参数可以控制每次读取fetchSize条数据，而不是默认的把所有数据一次读取出来；开启fetchSize需要满足：数据库版本要高于5.0.2，连接参数useCursorFetch=true。
		
		注意：此参数的值不可设置过大，否则会读取超时，导致任务失败。
		
		必选：否
		
		参数类型：int
		
		默认值：1024
		
	* **默认值:** 1024

### com.qlangtech.async.message.client.kafka.TiKVKafkaMQListenerFactory

* **显示名:** TiCDC-Kafka 

* **全路径名:** [com.qlangtech.async.message.client.kafka.TiKVKafkaMQListenerFactory](https://github.com/qlangtech/plugins/tree/master/tis-kafka-plugin/src/main/java/com/qlangtech/async/message/client/kafka/TiKVKafkaMQListenerFactory.java) 

* **提供者:** [TIS](https://tis.pub/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-kafka-plugin.tpi]({{< relref "./tpis/#tis-kafka-plugintpi">}})

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

## 扩展点:com.qlangtech.tis.plugin.datax.hudi.keygenerator.HudiKeyGenerator

### com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.ComplexKeyGenerator

* **显示名:** COMPLEX 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.ComplexKeyGenerator](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/keygenerator/impl/ComplexKeyGenerator.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. 主键

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@60859f5a

2. 分区值析取

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		HDFS Path contain hive partition values for the keys it is partitioned on. This mapping is not straight forward and
		requires a pluggable implementation to extract the partition value from HDFS path.
		
		**e.g** Hive table partitioned by datestr=yyyy-mm-dd and hdfs path /app/hoodie/dataset1/YYYY=[yyyy]/MM=[mm]/DD=[dd]
		
		There are some types of partition strategies :
		
		- **fieldValBased**: base on Hudi class `org.apache.hudi.hive.MultiPartKeysValueExtractor` that Partition Key extractor treating each value delimited by slash as separate key.
		
		- **slashEncodedDay** :
		   base on hudi class `org.apache.hudi.hive.SlashEncodedDayPartitionValueExtractor`
		   HDFS Path contain hive partition values for the keys it is partitioned on. 
		   This mapping is not straight forward and requires a pluggable implementation to extract the partition value from HDFS path.
		   
		   This implementation extracts `datestr=yyyy-mm-dd` from path of type `/yyyy/mm/dd`
		
		- **slashEncodedHour** :   
		   
		   base on hudi class `org.apache.hudi.hive.SlashEncodedHourPartitionValueExtractor`
		
		   HDFS Path contain hive partition values for the keys it is partitioned on. This mapping is not straight forward and
		   requires a pluggable implementation to extract the partition value from HDFS path.
		   This implementation extracts `datestr=yyyy-mm-dd-HH` from path of type `/yyyy/mm/dd/HH`
	* **默认值:** 无

3. hiveStylePartitioning

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Flag to indicate whether to use Hive style partitioning.
		If set true, the names of partition folders follow <partition_column_name>=<partition_value> format.
		By default false (the names of partition folders are only partition values)
	* **默认值:** false

4. 分区字段

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

5. encodePartitionPath

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Should we url encode the partition path value, before creating the folder structure.
	* **默认值:** false

6. 逻辑时间

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		When set to true, consistent value will be generated for a logical timestamp type column, like timestamp-millis and timestamp-micros, irrespective of whether row-writer is enabled. Disabled by default so as not to break the pipeline that deploy either fully row-writer path or non row-writer path. For example, if it is kept disabled then record key of timestamp type with value `2016-12-29 09:54:00` will be written as timestamp `2016-12-29 09:54:00.0` in row-writer path, while it will be written as long value `1483023240000000` in non row-writer path. If enabled, then the timestamp value will be written in both the cases.
	* **默认值:** false

### com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.NonePartitionKeyGenerator

* **显示名:** NON_PARTITION 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.NonePartitionKeyGenerator](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/keygenerator/impl/NonePartitionKeyGenerator.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. 主键

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@18acfe88

### com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.SimpleKeyGenerator

* **显示名:** SIMPLE 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.SimpleKeyGenerator](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/keygenerator/impl/SimpleKeyGenerator.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. 分区值析取

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		HDFS Path contain hive partition values for the keys it is partitioned on. This mapping is not straight forward and
		requires a pluggable implementation to extract the partition value from HDFS path.
		
		**e.g** Hive table partitioned by datestr=yyyy-mm-dd and hdfs path /app/hoodie/dataset1/YYYY=[yyyy]/MM=[mm]/DD=[dd]
		
		There are some types of partition strategies :
		
		- **fieldValBased**: base on Hudi class `org.apache.hudi.hive.MultiPartKeysValueExtractor` that Partition Key extractor treating each value delimited by slash as separate key.
		
		- **slashEncodedDay** :
		   base on hudi class `org.apache.hudi.hive.SlashEncodedDayPartitionValueExtractor`
		   HDFS Path contain hive partition values for the keys it is partitioned on. 
		   This mapping is not straight forward and requires a pluggable implementation to extract the partition value from HDFS path.
		   
		   This implementation extracts `datestr=yyyy-mm-dd` from path of type `/yyyy/mm/dd`
		
		- **slashEncodedHour** :   
		   
		   base on hudi class `org.apache.hudi.hive.SlashEncodedHourPartitionValueExtractor`
		
		   HDFS Path contain hive partition values for the keys it is partitioned on. This mapping is not straight forward and
		   requires a pluggable implementation to extract the partition value from HDFS path.
		   This implementation extracts `datestr=yyyy-mm-dd-HH` from path of type `/yyyy/mm/dd/HH`
	* **默认值:** 无

2. hiveStylePartitioning

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Flag to indicate whether to use Hive style partitioning.
		If set true, the names of partition folders follow <partition_column_name>=<partition_value> format.
		By default false (the names of partition folders are only partition values)
	* **默认值:** false

3. 主键

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

4. 分区字段

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

5. encodePartitionPath

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Should we url encode the partition path value, before creating the folder structure.
	* **默认值:** false

6. 逻辑时间

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		When set to true, consistent value will be generated for a logical timestamp type column, like timestamp-millis and timestamp-micros, irrespective of whether row-writer is enabled. Disabled by default so as not to break the pipeline that deploy either fully row-writer path or non row-writer path. For example, if it is kept disabled then record key of timestamp type with value `2016-12-29 09:54:00` will be written as timestamp `2016-12-29 09:54:00.0` in row-writer path, while it will be written as long value `1483023240000000` in non row-writer path. If enabled, then the timestamp value will be written in both the cases.
	* **默认值:** false

### com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.TimeStampKeyGenerator

* **显示名:** TIMESTAMP 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.keygenerator.impl.TimeStampKeyGenerator](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/keygenerator/impl/TimeStampKeyGenerator.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. inputDateformat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** Input date format
	* **默认值:** 无

2. 分区值析取

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		HDFS Path contain hive partition values for the keys it is partitioned on. This mapping is not straight forward and
		requires a pluggable implementation to extract the partition value from HDFS path.
		
		**e.g** Hive table partitioned by datestr=yyyy-mm-dd and hdfs path /app/hoodie/dataset1/YYYY=[yyyy]/MM=[mm]/DD=[dd]
		
		There are some types of partition strategies :
		
		- **fieldValBased**: base on Hudi class `org.apache.hudi.hive.MultiPartKeysValueExtractor` that Partition Key extractor treating each value delimited by slash as separate key.
		
		- **slashEncodedDay** :
		   base on hudi class `org.apache.hudi.hive.SlashEncodedDayPartitionValueExtractor`
		   HDFS Path contain hive partition values for the keys it is partitioned on. 
		   This mapping is not straight forward and requires a pluggable implementation to extract the partition value from HDFS path.
		   
		   This implementation extracts `datestr=yyyy-mm-dd` from path of type `/yyyy/mm/dd`
		
		- **slashEncodedHour** :   
		   
		   base on hudi class `org.apache.hudi.hive.SlashEncodedHourPartitionValueExtractor`
		
		   HDFS Path contain hive partition values for the keys it is partitioned on. This mapping is not straight forward and
		   requires a pluggable implementation to extract the partition value from HDFS path.
		   This implementation extracts `datestr=yyyy-mm-dd-HH` from path of type `/yyyy/mm/dd/HH`
	* **默认值:** 无

3. hiveStylePartitioning

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Flag to indicate whether to use Hive style partitioning.
		If set true, the names of partition folders follow <partition_column_name>=<partition_value> format.
		By default false (the names of partition folders are only partition values)
	* **默认值:** false

4. timezone

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		格式化时间时区
	* **默认值:** Asia/Shanghai

5. 主键

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

6. timestampType

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		时间字段类型
	* **默认值:** EPOCHMILLISECONDS

7. 分区字段

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

8. encodePartitionPath

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Should we url encode the partition path value, before creating the folder structure.
	* **默认值:** false

9. outputDateformat

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** Output date format
	* **默认值:** 无

10. 逻辑时间

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		When set to true, consistent value will be generated for a logical timestamp type column, like timestamp-millis and timestamp-micros, irrespective of whether row-writer is enabled. Disabled by default so as not to break the pipeline that deploy either fully row-writer path or non row-writer path. For example, if it is kept disabled then record key of timestamp type with value `2016-12-29 09:54:00` will be written as timestamp `2016-12-29 09:54:00.0` in row-writer path, while it will be written as long value `1483023240000000` in non row-writer path. If enabled, then the timestamp value will be written in both the cases.
	* **默认值:** false

## 扩展点:com.qlangtech.tis.plugin.ds.DataSourceFactory

### com.qlangtech.tis.plugin.ds.cassandra.CassandraDatasourceFactory

* **显示名:** Cassandra 

* **全路径名:** [com.qlangtech.tis.plugin.ds.cassandra.CassandraDatasourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-cassandra-plugin/src/main/java/com/qlangtech/tis/plugin/ds/cassandra/CassandraDatasourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-cassandra-plugin.tpi]({{< relref "./tpis/#tis-datax-cassandra-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.clickhouse.ClickHouseDataSourceFactory

* **显示名:** ClickHouse 

* **全路径名:** [com.qlangtech.tis.plugin.ds.clickhouse.ClickHouseDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-clickhouse-plugin/src/main/java/com/qlangtech/tis/plugin/ds/clickhouse/ClickHouseDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-clickhouse-plugin.tpi]({{< relref "./tpis/#tis-datax-clickhouse-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.starrocks.StarRocksSourceFactory

* **显示名:** StarRocks 

* **全路径名:** [com.qlangtech.tis.plugin.ds.starrocks.StarRocksSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/ds/starrocks/StarRocksSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#tis-datax-doris-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.doris.DorisSourceFactory

* **显示名:** Doris 

* **全路径名:** [com.qlangtech.tis.plugin.ds.doris.DorisSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/ds/doris/DorisSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#tis-datax-doris-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.mangodb.MangoDBDataSourceFactory

* **显示名:** MongoDB 

* **全路径名:** [com.qlangtech.tis.plugin.ds.mangodb.MangoDBDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-mongodb-plugin/src/main/java/com/qlangtech/tis/plugin/ds/mangodb/MangoDBDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-mongodb-plugin.tpi]({{< relref "./tpis/#tis-datax-mongodb-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.oracle.OracleDataSourceFactory

* **显示名:** Oracle 

* **全路径名:** [com.qlangtech.tis.plugin.ds.oracle.OracleDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/ds/oracle/OracleDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#tis-datax-oracle-plugintpi">}})

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

3. 实例ID

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 数据源实例名称，请起一个有意义且唯一的名称
	* **默认值:** 无

4. 服务节点

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

5. 连接方式

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		连接方式选择，[Oracle SIDs vs. Oracle SERVICE NAMES](https://www.stechies.com/difference-between-oracle-sids-and-oracle-service-names/)
	* **默认值:** 无

6. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** system

7. 包含授权

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		Oracle系统会向用户授权其他用户名下的表
		
		* 如选择`是`可以包含系统授权的其他用户名下的表
		
		* 如选择`否`则只包含用户名下的表
		
	* **默认值:** false

### com.qlangtech.tis.plugin.ds.postgresql.PGDataSourceFactory

* **显示名:** PostgreSQL 

* **全路径名:** [com.qlangtech.tis.plugin.ds.postgresql.PGDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-postgresql-plugin/src/main/java/com/qlangtech/tis/plugin/ds/postgresql/PGDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-postgresql-plugin.tpi]({{< relref "./tpis/#tis-datax-postgresql-plugintpi">}})

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

8. schema

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** Specify the schema (or several schema separated by commas) to be set in the search-path. This schema will be used to resolve unqualified object names used in statements over this connection.
	* **默认值:** public

9. 用户名

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** root

### com.qlangtech.tis.plugin.ds.sqlserver.SqlServerDatasourceFactory

* **显示名:** SqlServer 

* **全路径名:** [com.qlangtech.tis.plugin.ds.sqlserver.SqlServerDatasourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-sqlserver-plugin/src/main/java/com/qlangtech/tis/plugin/ds/sqlserver/SqlServerDatasourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-sqlserver-plugin.tpi]({{< relref "./tpis/#tis-datax-sqlserver-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.mysql.MySQLV5DataSourceFactory

* **显示名:** MySQL-V5 

* **全路径名:** [com.qlangtech.tis.plugin.ds.mysql.MySQLV5DataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-mysql-v5-plugin/src/main/java/com/qlangtech/tis/plugin/ds/mysql/MySQLV5DataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-v5-plugin.tpi]({{< relref "./tpis/#tis-ds-mysql-v5-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.mysql.MySQLV8DataSourceFactory

* **显示名:** MySQL-V8 

* **全路径名:** [com.qlangtech.tis.plugin.ds.mysql.MySQLV8DataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-mysql-v8-plugin/src/main/java/com/qlangtech/tis/plugin/ds/mysql/MySQLV8DataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-v8-plugin.tpi]({{< relref "./tpis/#tis-ds-mysql-v8-plugintpi">}})

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

### com.qlangtech.tis.plugin.ds.tidb.TiKVDataSourceFactory

* **显示名:** TiDB 

* **全路径名:** [com.qlangtech.tis.plugin.ds.tidb.TiKVDataSourceFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-tidb-plugin/src/main/java/com/qlangtech/tis/plugin/ds/tidb/TiKVDataSourceFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-tidb-plugin.tpi]({{< relref "./tpis/#tis-ds-tidb-plugintpi">}})

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

## 扩展点:com.qlangtech.tis.plugin.incr.TISSinkFactory

### com.qlangtech.tis.plugins.incr.flink.connector.sink.MySQLSinkFactory

* **显示名:** Chunjun-Sink-MySQL 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.sink.MySQLSinkFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-chunjun-mysql-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/sink/MySQLSinkFactory.java) 

* **提供者:** [Chunjun](https://dtstack.github.io/chunjun) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-chunjun-mysql-plugin.tpi]({{< relref "./tpis/#tis-flink-chunjun-mysql-plugintpi">}})

* **参数说明:** 

1. semantic

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		**描述：** sink 端是否支持二阶段提交
		
		**注意：**
		    如果此参数为空，默认不开启二阶段提交，即 sink 端不支持 exactly_once 语义；
		    当前只支持 exactly-once 和 at-least-once
		    
	* **默认值:** at-least-once

2. parallelism

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** sink 并行度
	* **默认值:** 1

3. flushIntervalMills

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** "the flush interval mills, over this time, asynchronous threads will flush data. The default value is 10s.
	* **默认值:** 10000

4. batchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		描述：一次性批量提交的记录数大小，该值可以极大减少 ChunJun 与数据库的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成 ChunJun 运行进程 OOM 情况
		    
	* **默认值:** 1

### com.qlangtech.plugins.incr.flink.chunjun.postgresql.sink.ChunjunPostgreSQLSinkFactory

* **显示名:** Chunjun-Sink-Postgres 

* **全路径名:** [com.qlangtech.plugins.incr.flink.chunjun.postgresql.sink.ChunjunPostgreSQLSinkFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-flink-chunjun-postgresql-plugin/src/main/java/com/qlangtech/plugins/incr/flink/chunjun/postgresql/sink/ChunjunPostgreSQLSinkFactory.java) 

* **提供者:** [Chunjun](https://dtstack.github.io/chunjun) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-flink-chunjun-postgresql-plugin.tpi]({{< relref "./tpis/#tis-flink-chunjun-postgresql-plugintpi">}})

* **参数说明:** 

1. semantic

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		**描述：** sink 端是否支持二阶段提交
		
		**注意：**
		    如果此参数为空，默认不开启二阶段提交，即 sink 端不支持 exactly_once 语义；
		    当前只支持 exactly-once 和 at-least-once
		    
	* **默认值:** at-least-once

2. parallelism

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** sink 并行度
	* **默认值:** 1

3. flushIntervalMills

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** "the flush interval mills, over this time, asynchronous threads will flush data. The default value is 10s.
	* **默认值:** 10000

4. batchSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		描述：一次性批量提交的记录数大小，该值可以极大减少 ChunJun 与数据库的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成 ChunJun 运行进程 OOM 情况
		    
	* **默认值:** 1

### com.qlangtech.tis.plugins.incr.flink.connector.elasticsearch7.ElasticSearchSinkFactory

* **显示名:** Flink-ElasticSearch-Sink 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.elasticsearch7.ElasticSearchSinkFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-elasticsearch7-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/elasticsearch7/ElasticSearchSinkFactory.java) 

* **提供者:** [TIS](https://tis.pub/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-elasticsearch7-plugin.tpi]({{< relref "./tpis/#tis-sink-elasticsearch7-plugintpi">}})

* **参数说明:** 

1. bulkFlushMaxActions

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		
		设置使 sink 在接收每个元素之后立即提交，否则这些元素将被缓存起来，官方文档：
		[https://nightlies.apache.org/flink/flink-docs-master/zh/docs/connectors/datastream/elasticsearch/#%e9%85%8d%e7%bd%ae%e5%86%85%e9%83%a8%e6%89%b9%e9%87%8f%e5%a4%84%e7%90%86%e5%99%a8](https://nightlies.apache.org/flink/flink-docs-master/zh/docs/connectors/datastream/elasticsearch/#%e9%85%8d%e7%bd%ae%e5%86%85%e9%83%a8%e6%89%b9%e9%87%8f%e5%a4%84%e7%90%86%e5%99%a8)
		
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

### com.qlangtech.tis.plugins.incr.flink.connector.hudi.HudiSinkFactory

* **显示名:** Flink-Hudi-Sink 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.hudi.HudiSinkFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-hudi-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/hudi/HudiSinkFactory.java) 

* **提供者:** [TIS](https://tis.pub/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-hudi-plugin/tis-sink-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-sink-hudi-plugin/tis-sink-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. baseOnBach

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 强制要求增量执行逻辑是基于之前已经成功的批量导入基础之上，不然增量通道启动过程会报错
	* **默认值:** true

2. 操作类型

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		Detailed description:[https://hudi.apache.org/docs/write_operations](https://hudi.apache.org/docs/write_operations)
		
		
	* **默认值:** UPSERT

3. 脚本类型

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Hudi Flink实时同步脚本支持两种类型：
		
		1. **SQL**: 敬请期待
		
		2. **StreamAPI**: HoodieFlinkStreamer(推荐)
		
	* **默认值:** streamApi

4. compaction

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Background activity to reconcile differential data structures within Hudi 
		
		e.g: moving updates from row based log files to columnar formats. Internally, compaction manifests as a special commit on the timeline
		
		About compaction conception: [https://hudi.apache.org/docs/compaction/](https://hudi.apache.org/docs/compaction/)
		
		Detailed configuration description: [https://hudi.apache.org/docs/configurations#Compaction-Configs](https://hudi.apache.org/docs/configurations#Compaction-Configs)
		
	* **默认值:** default

5. 限流

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		如通过Flink-CDC Snapshot导入全量历史数据，由于一个checkpoint周期内的数据量巨大，导致执行checkpoint超时，可以通过限流的方式避免checkpoint超时
		
	* **默认值:** 200

### com.qlangtech.tis.plugins.incr.flink.connector.starrocks.StarRocksSinkFactory2

* **显示名:** Flink-StarRocks-Sink 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.starrocks.StarRocksSinkFactory2](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-starrocks-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/starrocks/StarRocksSinkFactory2.java) 

* **提供者:** [TIS](https://tis.pub/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-starrocks-plugin.tpi]({{< relref "./tpis/#tis-sink-starrocks-plugintpi">}})

* **参数说明:** 

1. sinkBatchFlushInterval

	* **类型:** 整型数字

	* **必须:** 否

2. sinkBatchMaxSize

	* **类型:** 整型数字

	* **必须:** 否

3. sinkConnectTimeout

	* **类型:** 整型数字

	* **必须:** 否

4. sinkMaxRetries

	* **类型:** 整型数字

	* **必须:** 否

5. sinkBatchMaxRows

	* **类型:** 整型数字

	* **必须:** 否

6. sinkSemantic

	* **类型:** 单选

	* **必须:** 是

## 扩展点:com.qlangtech.tis.plugin.incr.IncrStreamFactory

### com.qlangtech.plugins.incr.flink.launch.TISFlinkCDCStreamFactory

* **显示名:** Flink-CDC 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.TISFlinkCDCStreamFactory](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/TISFlinkCDCStreamFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. checkpoint

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Checkpoints make state in Flink fault tolerant by allowing state and the corresponding stream positions to be recovered, thereby giving the application the same semantics as a failure-free execution.
		
		Detailed description:
		1. [https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/checkpoints/](https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/checkpoints/)
		2. [https://nightlies.apache.org/flink/flink-docs-master/docs/dev/datastream/fault-tolerance/checkpointing/](https://nightlies.apache.org/flink/flink-docs-master/docs/dev/datastream/fault-tolerance/checkpointing/)
		
	* **默认值:** off

2. flinkCluster

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
		      - 下载、解压
		        ```shell script
		         wget http://tis-release.oss-cn-beijing.aliyuncs.com/3.6.0/tis/flink-tis-1.13.1-bin.tar.gz && rm -rf flink-tis-1.13.1 && mkdir flink-tis-1.13.1 && tar xvf flink-tis-1.13.1-bin.tar.gz -C ./flink-tis-1.13.1
		        ```
		      - 启动Flink-Cluster：
		         ```shell script
		         ./bin/start-cluster.sh
		         ```
		         
		
	* **默认值:** 无

3. stateBackend

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Flink provides different state backends that specify how and where state is stored.
		
		State can be located on Java’s heap or off-heap. Depending on your state backend, Flink can also manage the state for the application, meaning Flink deals with the memory management (possibly spilling to disk if necessary) to allow applications to hold very large state. By default, the configuration file flink-conf.yaml determines the state backend for all Flink jobs.
		
		However, the default state backend can be overridden on a per-job basis, as shown below.
		
		For more information about the available state backends, their advantages, limitations, and configuration parameters see the corresponding section in [Deployment & Operations](https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/state_backends/).
		
		
		
		
		
	* **默认值:** off

4. parallelism

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		任务执行并行度
		
		在 Flink 里面代表每个任务的并行度，适当的提高并行度可以大大提高 job 的执行效率，比如你的 job 消费 kafka 数据过慢，适当调大可能就消费正常了。
		
	* **默认值:** 1

5. 重启策略

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		The cluster can be started with a default restart strategy which is always used when no job specific restart strategy has been defined. In case that the job is submitted with a restart strategy, this strategy overrides the cluster’s default setting.
		
		Detailed description:[restart-strategies](https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/task_failure_recovery/#restart-strategies)
		
		There are 4 types of restart-strategy:
		
		1. `off`: No restart strategy.
		2. `fixed-delay`: Fixed delay restart strategy. More details can be found [here](https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/task_failure_recovery/#fixed-delay-restart-strategy).
		3. `failure-rate`: Failure rate restart strategy. More details can be found [here](https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/task_failure_recovery#failure-rate-restart-strategy).
		4. `exponential-delay`: Exponential delay restart strategy. More details can be found [here](https://nightlies.apache.org/flink/flink-docs-master/docs/ops/state/task_failure_recovery#exponential-delay-restart-strategy).
		
		
	* **默认值:** off

## 扩展点:com.qlangtech.tis.plugins.incr.flink.connector.UpdateMode

### com.qlangtech.tis.plugins.incr.flink.connector.impl.ReplaceType

* **显示名:** Replace 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.impl.ReplaceType](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-chunjun-base-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/impl/ReplaceType.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-chunjun-base-plugin.tpi]({{< relref "./tpis/#tis-chunjun-base-plugintpi">}})

* **参数说明:** 

1. updateKey

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		* 描述：当写入模式为 update 和 replace 时，需要指定此参数的值为唯一索引字段
		* 注意：如果此参数为空，并且写入模式为 update 和 replace 时，应用会自动获取数据库中的唯一索引；
		如果数据表没有唯一索引，但是写入模式配置为 update 和 replace，应用会以 insert 的方式写入数据；
		
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@3f702946

### com.qlangtech.tis.plugins.incr.flink.connector.impl.UpdateType

* **显示名:** Update 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.impl.UpdateType](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-chunjun-base-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/impl/UpdateType.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-chunjun-base-plugin.tpi]({{< relref "./tpis/#tis-chunjun-base-plugintpi">}})

* **参数说明:** 

1. updateKey

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		* 描述：当写入模式为 update 和 replace 时，需要指定此参数的值为唯一索引字段
		* 注意：如果此参数为空，并且写入模式为 update 和 replace 时，应用会自动获取数据库中的唯一索引；
		如果数据表没有唯一索引，但是写入模式配置为 update 和 replace，应用会以 insert 的方式写入数据；
		
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@750ff7d3

### com.qlangtech.tis.plugins.incr.flink.connector.impl.InsertType

* **显示名:** Insert 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.impl.InsertType](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-chunjun-base-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/impl/InsertType.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-chunjun-base-plugin.tpi]({{< relref "./tpis/#tis-chunjun-base-plugintpi">}})

## 扩展点:com.qlangtech.tis.datax.impl.DataxWriter

### com.qlangtech.tis.plugin.datax.DataXCassandraWriter

* **显示名:** Cassandra 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXCassandraWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-cassandra-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXCassandraWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-cassandra-plugin.tpi]({{< relref "./tpis/#tis-datax-cassandra-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXClickhouseWriter

* **显示名:** ClickHouse 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXClickhouseWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-clickhouse-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXClickhouseWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-clickhouse-plugin.tpi]({{< relref "./tpis/#tis-datax-clickhouse-plugintpi">}})

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

6. batchSize

	* **类型:** 整型数字

	* **必须:** 否

	* **说明:** 
		 * 描述：一次性批量提交的记录数大小，该值可以极大减少DataX与Mysql的网络交互次数，并提升整体吞吐量。但是该值设置过大可能会造成DataX运行进程OOM情况。
	* **默认值:** 2048

7. preSql

	* **类型:** 富文本

	* **必须:** 否

	* **说明:** 
		 描述：写入数据到目的表前，会先执行这里的标准语句。如果 Sql 中有你需要操作到的表名称，请使用 `@table` 表示，这样在实际执行 Sql 语句时，会对变量按照实际表名称进行替换。比如你的任务是要写入到目的端的100个同构分表(表名称为:datax_00,datax01, ... datax_98,datax_99)，并且你希望导入数据前，先对表中数据进行删除操作，那么你可以这样配置：`"preSql":["delete from 表名"]`，效果是：在执行到每个表写入数据前，会先执行对应的 delete from 对应表名称
	* **默认值:** 无

### com.qlangtech.tis.plugin.datax.starrocks.DataXStarRocksWriter

* **显示名:** StarRocks 

* **全路径名:** [com.qlangtech.tis.plugin.datax.starrocks.DataXStarRocksWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/datax/starrocks/DataXStarRocksWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#tis-datax-doris-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.doris.DataXDorisWriter

* **显示名:** Doris 

* **全路径名:** [com.qlangtech.tis.plugin.datax.doris.DataXDorisWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-doris-plugin/src/main/java/com/qlangtech/tis/plugin/datax/doris/DataXDorisWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-doris-plugin.tpi]({{< relref "./tpis/#tis-datax-doris-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXElasticsearchWriter

* **显示名:** Elasticsearch 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXElasticsearchWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-elasticsearch-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXElasticsearchWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-elasticsearch-plugin.tpi]({{< relref "./tpis/#tis-datax-elasticsearch-plugintpi">}})

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
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@17c2d509

5. splitter

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 如果插入数据是array，就使用指定分隔符
	* **默认值:** ,

6. timeout

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 客户端超时时间
	* **默认值:** 600000

7. multiThread

	* **类型:** 单选

	* **必须:** 否

	* **说明:** http请求，是否有多线程
	* **默认值:** true

8. endpoint

	* **类型:** 单选

	* **必须:** 是

	* **说明:** ElasticSearch的连接地址
	* **默认值:** 无

9. cleanup

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 是否删除原表
	* **默认值:** false

10. discovery

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 启用节点发现将(轮询)并定期更新客户机中的服务器列表
	* **默认值:** false

11. trySize

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 失败后重试的次数
	* **默认值:** 30

12. alias

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 数据导入完成后写入别名
	* **默认值:** 无

13. dynamic

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 不使用datax的mappings，使用es自己的自动mappings
	* **默认值:** false

14. ignoreParseError

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 忽略解析数据格式错误，继续写入
	* **默认值:** true

15. compression

	* **类型:** 单选

	* **必须:** 否

	* **说明:** http请求，开启压缩
	* **默认值:** true

16. batchSize

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 每次批量数据的条数
	* **默认值:** 1000

17. 忽略错误

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 忽略写入错误，不重试，继续写入
	* **默认值:** false

### com.qlangtech.tis.plugin.datax.DataXFtpWriter

* **显示名:** FTP 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXFtpWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-ftp-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXFtpWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-ftp-plugin.tpi]({{< relref "./tpis/#tis-datax-ftp-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXHdfsWriter

* **显示名:** Hdfs 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXHdfsWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hdfs-reader-writer-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXHdfsWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hdfs-reader-writer-plugin/tis-datax-hdfs-reader-writer-plugin_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hdfs-reader-writer-plugin/tis-datax-hdfs-reader-writer-plugin_hadoop_273tpi">}})

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
	* **默认值:** append

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

### com.qlangtech.tis.plugin.datax.hudi.DataXHudiWriter

* **显示名:** Hudi 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.DataXHudiWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/DataXHudiWriter.java) 

* **提供者:** [TIS](https://tis.pub/) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. 配置模版

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 无特殊情况请不要修改模版内容，避免不必要的错误
	* **默认值:** 无

2. 分区字段

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Field in the table to use for determining hive partition columns, [详细](https://hudi.apache.org/docs/configurations#hoodiedatasourcehive_syncpartition_fields)
		
	* **默认值:** pt

3. 重分区数

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		
		For any Hudi job using Spark, parallelism equals to the number of spark partitions that should be generated for a particular stage in the DAG
		[detail](https://hudi.apache.org/docs/faq/#how-to-tune-shuffle-parallelism-of-hudi-jobs-)
		
	* **默认值:** 2

4. 批量操作

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		* Takes one of these values : UPSERT (default), INSERT (use when input is  purely new data/inserts to gain speed)
		* Default: `BULK_INSERT`
		* Possible Values: `UPSERT`, `INSERT`, `BULK_INSERT`
		
	* **默认值:** BULK_INSERT

5. sparkConn

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		指定Spark服务端连接地址
		
	* **默认值:** 无

6. 表类型

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		Hudi 支持以下两种表类型：
		
		* [COPY_ON_WRITE](https://hudi.apache.org/docs/table_types#copy-on-write-table) ：Stores data using exclusively columnar file formats (e.g parquet). Updates simply version & rewrite the files by performing a synchronous merge during write.
		* [MERGE_ON_READ](https://hudi.apache.org/docs/table_types#merge-on-read-table) ：Stores data using a combination of columnar (e.g parquet) + row based (e.g avro) file formats. Updates are logged to delta files & later compacted to produce new versions of columnar files synchronously or asynchronously.
		
		详细请参考 [https://hudi.apache.org/docs/table_types](https://hudi.apache.org/docs/table_types)
		
		**How do I choose a storage type for my workload**
		
		A key goal of Hudi is to provide upsert functionality that is orders of magnitude faster than rewriting entire tables or partitions. 
		
		Choose Copy-on-write storage if : 
		
		- You are looking for a simple alternative, that replaces your existing parquet tables without any need for real-time data.
		- Your current job is rewriting entire table/partition to deal with updates, while only a few files actually change in each partition.
		- You are happy keeping things operationally simpler (no compaction etc), with the ingestion/write performance bound by the parquet file size and the number of such files affected/dirtied by updates
		- Your workload is fairly well-understood and does not have sudden bursts of large amount of update or inserts to older partitions. COW absorbs all the merging cost on the writer side and thus these sudden changes can clog up your ingestion and interfere with meeting normal mode ingest latency targets.
		
		Choose merge-on-read storage if :
		
		- You want the data to be ingested as quickly & queryable as much as possible.
		- Your workload can have sudden spikes/changes in pattern (e.g bulk updates to older transactions in upstream database causing lots of updates to old partitions on DFS). Asynchronous compaction helps amortize the write amplification caused by such scenarios, while normal ingestion keeps up with incoming stream of changes.
		Immaterial of what you choose, Hudi provides 
		
		Snapshot isolation and atomic write of batch of records
		- Incremental pulls
		- Ability to de-duplicate data
		
		Find more [here](https://hudi.apache.org/docs/concepts/).
		
		
		
	* **默认值:** COPY_ON_WRITE

7. writeMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		hdfswriter写入前数据清理处理模式：
		
		- **append**: 写入前不做任何处理，DataX hdfswriter直接使用filename写入，并保证文件名不冲突，
		- **nonConflict**：如果目录下有fileName前缀的文件，直接报错
	* **默认值:** append

8. sparkSubmitParam

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		Spark服务端执行`HoodieDeltaStreamer`对内存有一定要求，太小容易产生OOM导致终止运行
		
	* **默认值:** 无

9. hiveConn

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		Hive连接实例配置
		
	* **默认值:** 无

10. fsName

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		分布式文件系统源引用，
		
		`注`：实例名称必须为**hudi_hdfs**
		
	* **默认值:** 无

### com.qlangtech.tis.plugin.datax.DataXMongodbWriter

* **显示名:** MongoDB 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXMongodbWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-mongodb-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXMongodbWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-mongodb-plugin.tpi]({{< relref "./tpis/#tis-datax-mongodb-plugintpi">}})

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
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@6dbcf214

5. collectionName

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** MonogoDB的集合名。【必填】
	* **默认值:** com.qlangtech.tis.trigger.util.JsonUtil$UnCacheString@496a31da

### com.qlangtech.tis.plugin.datax.DataXOracleWriter

* **显示名:** Oracle 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOracleWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOracleWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#tis-datax-oracle-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXOssWriter

* **显示名:** OSS 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOssWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax-oss-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOssWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oss-plugin.tpi]({{< relref "./tpis/#tis-datax-oss-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXPostgresqlWriter

* **显示名:** PostgreSQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXPostgresqlWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-postgresql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXPostgresqlWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-postgresql-plugin.tpi]({{< relref "./tpis/#tis-datax-postgresql-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXSqlserverWriter

* **显示名:** SqlServer 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXSqlserverWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-sqlserver-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXSqlserverWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-sqlserver-plugin.tpi]({{< relref "./tpis/#tis-datax-sqlserver-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataxMySQLWriter

* **显示名:** MySQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataxMySQLWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-mysql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataxMySQLWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-plugin.tpi]({{< relref "./tpis/#tis-ds-mysql-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXSparkWriter

* **显示名:** Spark 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXSparkWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXSparkWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

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
	* **默认值:** append

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

### com.qlangtech.tis.plugin.datax.DataXHiveWriter

* **显示名:** Hive 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXHiveWriter](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXHiveWriter.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

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
	* **默认值:** append

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

## 扩展点:com.qlangtech.tis.config.spark.SparkConnStrategy

### com.qlangtech.tis.config.spark.impl.YarnConnStrategy

* **显示名:** Yarn 

* **全路径名:** [com.qlangtech.tis.config.spark.impl.YarnConnStrategy](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/spark/impl/YarnConnStrategy.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. yarnSite

	* **类型:** 富文本

	* **必须:** 是

	* **说明:** 
		
		```xml
		<?xml version="1.0"?>
		<configuration>
		 <!-- Site specific YARN configuration properties -->
		  <!--RM的主机名 -->
		  <property>
		    <name>yarn.resourcemanager.hostname</name>
		    <value>192.168.28.200</value>
		  </property>
		
		  <!--RM对客户端暴露的地址,客户端通过该地址向RM提交应用程序、杀死应用程序等-->
		  <property>
		    <name>yarn.resourcemanager.address</name>
		    <value>${yarn.resourcemanager.hostname}:8032</value>
		  </property>
		
		  <!--RM对AM暴露的访问地址,AM通过该地址向RM申请资源、释放资源等-->
		  <property>
		    <name>yarn.resourcemanager.scheduler.address</name>
		    <value>${yarn.resourcemanager.hostname}:8030</value>
		  </property>
		
		  <!--RM对外暴露的web http地址,用户可通过该地址在浏览器中查看集群信息-->
		  <property>
		    <name>yarn.resourcemanager.webapp.address</name>
		    <value>${yarn.resourcemanager.hostname}:8088</value>
		  </property>
		
		  <!--RM对NM暴露地址,NM通过该地址向RM汇报心跳、领取任务等-->
		  <property>
		    <name>yarn.resourcemanager.resource-tracker.address</name>
		    <value>${yarn.resourcemanager.hostname}:8031</value>
		  </property>
		
		  <!--RM对管理员暴露的访问地址,管理员通过该地址向RM发送管理命令等-->
		  <property>
		    <name>yarn.resourcemanager.admin.address</name>
		    <value>${yarn.resourcemanager.hostname}:8033</value>
		  </property>
		</configuration>
		```
	* **默认值:** 无

### com.qlangtech.tis.config.spark.impl.StandaloneConnStrategy

* **显示名:** Standalone 

* **全路径名:** [com.qlangtech.tis.config.spark.impl.StandaloneConnStrategy](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/spark/impl/StandaloneConnStrategy.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. master

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 无
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.plugin.k8s.K8sImage

### com.qlangtech.tis.config.k8s.impl.DefaultK8SImage

* **显示名:** image 

* **全路径名:** [com.qlangtech.tis.config.k8s.impl.DefaultK8SImage](https://github.com/qlangtech/plugins/tree/master/tis-k8s-plugin/src/main/java/com/qlangtech/tis/config/k8s/impl/DefaultK8SImage.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-k8s-plugin.tpi]({{< relref "./tpis/#tis-k8s-plugintpi">}})

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

## 扩展点:com.qlangtech.tis.plugin.datax.hudi.partition.HudiTablePartition

### com.qlangtech.tis.plugin.datax.hudi.partition.SlashEncodedHourPartition

* **显示名:** slashEncodedHour 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.partition.SlashEncodedHourPartition](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/partition/SlashEncodedHourPartition.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

### com.qlangtech.tis.plugin.datax.hudi.partition.SlashEncodedDayPartition

* **显示名:** slashEncodedDay 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.partition.SlashEncodedDayPartition](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/partition/SlashEncodedDayPartition.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

### com.qlangtech.tis.plugin.datax.hudi.partition.FieldValBasedPartition

* **显示名:** fieldValBased 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.partition.FieldValBasedPartition](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-plugin/src/main/java/com/qlangtech/tis/plugin/datax/hudi/partition/FieldValBasedPartition.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-plugin/tis-datax-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

## 扩展点:com.qlangtech.tis.plugins.incr.flink.connector.hudi.compaction.CompactionConfig

### com.qlangtech.tis.plugins.incr.flink.connector.hudi.compaction.CompactionConfig

* **显示名:** default 

* **全路径名:** [com.qlangtech.tis.plugins.incr.flink.connector.hudi.compaction.CompactionConfig](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-sink-hudi-plugin/src/main/java/com/qlangtech/tis/plugins/incr/flink/connector/hudi/compaction/CompactionConfig.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-sink-hudi-plugin/tis-sink-hudi-plugin_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-sink-hudi-plugin/tis-sink-hudi-plugin_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. payloadClass

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		Payload class used. Override this, if you like to roll your own merge logic, when upserting/inserting.
		This will render any value set for the option in-effective
	* **默认值:** org.apache.hudi.common.model.OverwriteWithLatestAvroPayload

2. retainCommits

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Number of commits to retain. So data will be retained for num_of_commits * time_between_commits (scheduled).
		This also directly translates into how much you can incrementally pull on this table, default 10
	* **默认值:** 10

3. asyncClean

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Whether to cleanup the old commits immediately on new commits, enabled by default
	* **默认值:** true

4. triggerStrategy

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Strategy to trigger compaction, options are 'num_commits': trigger compaction when reach N delta commits;
		'time_elapsed': trigger compaction when time elapsed &gt; N seconds since last compaction;
		'num_and_time': trigger compaction when both NUM_COMMITS and TIME_ELAPSED are satisfied;
		'num_or_time': trigger compaction when NUM_COMMITS or TIME_ELAPSED is satisfied.
		Default is 'num_commits'
	* **默认值:** num_commits

5. archiveMinCommits

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Min number of commits to keep before archiving older commits into a sequential log, default 20
	* **默认值:** 20

6. Commit次数触发

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Max delta commits needed to trigger compaction, default 5 commits
	* **默认值:** 5

7. archiveMaxCommits

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Max number of commits to keep before archiving older commits into a sequential log, default 30
	* **默认值:** 30

8. 时间触发

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Max delta seconds time needed to trigger compaction, default 1 hour
	* **默认值:** 3600

9. targetIOPerInMB

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Target IO per compaction (both read and write), default 500 GB
	* **默认值:** 512000

## 扩展点:com.qlangtech.tis.plugin.datax.IncrSelectedTabExtend

### com.qlangtech.plugins.incr.flink.chunjun.source.SelectedTabPropsExtends

* **显示名:** SelectedTabPropsExtends 

* **全路径名:** [com.qlangtech.plugins.incr.flink.chunjun.source.SelectedTabPropsExtends](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-chunjun-base-plugin/src/main/java/com/qlangtech/plugins/incr/flink/chunjun/source/SelectedTabPropsExtends.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-chunjun-base-plugin.tpi]({{< relref "./tpis/#tis-chunjun-base-plugintpi">}})

* **参数说明:** 

1. tabName

	* **类型:** 单行文本

	* **必须:** 是

2. where

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 
		
		描述：筛选条件，reader插件根据指定的column、table、where条件拼接SQL，并根据这个SQL进行数据抽取。在实际业务场景中，往往会选择当天的数据进行同步，可以将where条件指定为gmt_create > time。
		注意：不可以将where条件指定为limit 10，limit不是SQL的合法where子句。
		必选：否
		参数类型：String
		默认值：无
	* **默认值:** 无

3. splitPk

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 
		
		描述：当speed配置中的channel大于1时指定此参数，Reader插件根据并发数和此参数指定的字段拼接sql，使每个并发读取不同的数据，提升读取速率。
		
		注意：
		    推荐splitPk使用表主键，因为表主键通常情况下比较均匀，因此切分出来的分片也不容易出现数据热点。
		    目前splitPk仅支持整形数据切分，不支持浮点、字符串、日期等其他类型。如果用户指定其他非支持类型，ChunJun将报错。
		    如果channel大于1但是没有配置此参数，任务将置为失败。
		
		必选：否
		参数类型：String
		默认值：无
		
	* **默认值:** 无

4. 轮询策略

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		间隔轮询，开启后会根据pollingInterval轮询间隔时间周期性的从数据库拉取数据。开启间隔轮询还需配置参数pollingInterval，increColumn，可以选择配置参数startLocation。若不配置参数startLocation，任务启动时将会从数据库中查询增量字段最大值作为轮询的起始位置。
		
	* **默认值:** RunInterval

### com.qlangtech.plugins.incr.flink.chunjun.sink.SinkTabPropsExtends

* **显示名:** SinkTabPropsExtends 

* **全路径名:** [com.qlangtech.plugins.incr.flink.chunjun.sink.SinkTabPropsExtends](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-chunjun-base-plugin/src/main/java/com/qlangtech/plugins/incr/flink/chunjun/sink/SinkTabPropsExtends.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-chunjun-base-plugin.tpi]({{< relref "./tpis/#tis-chunjun-base-plugintpi">}})

* **参数说明:** 

1. tabName

	* **类型:** 单行文本

	* **必须:** 是

2. incrMode

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		控制写入数据到目标表采用 insert into 或者 replace into 或者 ON DUPLICATE KEY UPDATE 语句
	* **默认值:** Replace

## 扩展点:com.qlangtech.tis.offline.FileSystemFactory

### com.qlangtech.tis.hdfs.impl.HdfsFileSystemFactory

* **显示名:** HDFS 

* **全路径名:** [com.qlangtech.tis.hdfs.impl.HdfsFileSystemFactory](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hdfs-plugin/src/main/java/com/qlangtech/tis/hdfs/impl/HdfsFileSystemFactory.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hdfs-plugin/tis-datax-hdfs-plugin_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hdfs-plugin/tis-datax-hdfs-plugin_hadoop_273tpi">}})

* **参数说明:** 

1. 使用域名

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		当客户端导入数据到HDFS过程中，客户端会使用hostname（域名）而不是ip地址的方式去连接HDFS DataNode地址。当用户利用Docker Compose的方式启动hadoop环境(例如：[Hudi测试环境](https://hudi.apache.org/docs/next/docker_demo))
		，客户端取得的DataNode地址一般会是Docker容器的内部Ip地址，从容器外部是访问不到的，此时将该选项设置为`是`，可以解决数据无法导入到HDFS的问题。
		
		详细请查看[https://segmentfault.com/q/1010000008473574](https://segmentfault.com/q/1010000008473574)
		
		当选择`是`，在创HDFS FileSystem实例时加上如下参数：
		```java
		  conf.set("dfs.client.use.datanode.hostname", "true");
		```
	* **默认值:** false

2. name

	* **类型:** 单行文本

	* **必须:** 是

3. rootDir

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 系统会将源数据导入到该子目录下，用户需要保证该子目录有读/写权限
	* **默认值:** 无

4. kerberos

	* **类型:** 单选

	* **必须:** 否

	* **说明:** 开启kerberos客户端认证
	* **默认值:** 无

5. hdfsSiteContent

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

## 扩展点:com.qlangtech.tis.config.hive.HiveUserToken

### com.qlangtech.tis.config.hive.impl.DefaultHiveUserToken

* **显示名:** userPass 

* **全路径名:** [com.qlangtech.tis.config.hive.impl.DefaultHiveUserToken](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/hive/impl/DefaultHiveUserToken.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. password

	* **类型:** 密码

	* **必须:** 否

2. userName

	* **类型:** 单行文本

	* **必须:** 否

### com.qlangtech.tis.config.hive.impl.KerberosUserToken

* **显示名:** kerberos 

* **全路径名:** [com.qlangtech.tis.config.hive.impl.KerberosUserToken](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/hive/impl/KerberosUserToken.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. kerberos

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 开启kerberos客户端认证
	* **默认值:** 无

### com.qlangtech.tis.config.hive.impl.OffHiveUserToken

* **显示名:** off 

* **全路径名:** [com.qlangtech.tis.config.hive.impl.OffHiveUserToken](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-hive-flat-table-builder-plugin/src/main/java/com/qlangtech/tis/config/hive/impl/OffHiveUserToken.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-hive-flat-table-builder-plugin/tis-hive-flat-table-builder-plugin_hive_231_hadoop_273tpi">}})

## 扩展点:com.qlangtech.plugins.incr.flink.launch.StateBackendFactory

### com.qlangtech.plugins.incr.flink.launch.statbackend.OFF

* **显示名:** off 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.statbackend.OFF](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/statbackend/OFF.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

### com.qlangtech.plugins.incr.flink.launch.statbackend.FileSystemState

* **显示名:** FSState 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.statbackend.FileSystemState](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/statbackend/FileSystemState.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. smallFileThreshold

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The minimum size of state data files. All state chunks smaller than that are stored inline in the root checkpoint metadata file. The max memory threshold for this configuration is 1MB.
		
		 单位：`kb`
	* **默认值:** 20

2. writeBufferSize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The default size of the write buffer for the checkpoint streams that write to file systems. The actual write buffer size is determined to be the maximum of the value of this option and option 'state.storage.fs.memory-threshold'.
	* **默认值:** 4096

3. enableSavePoint

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		支持任务执行**savepoint**，Flink任务管理器执行停机操作时会主动触发创建**savepoint**操作，存放位置为属性`checkpointDir`平行目录下的一个以时间戳命名的子目录中
	* **默认值:** true

4. checkpointDir

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		The default directory used for storing the data files and meta data of checkpoints in a Flink supported filesystem. The storage path must be accessible from all participating processes/nodes(i.e. all TaskManagers and JobManagers).
		
		The scheme (hdfs://, file://, etc) is null. Please specify the file system scheme explicitly in the URI.
	* **默认值:** file:///opt/data/savepoint

### com.qlangtech.plugins.incr.flink.launch.statbackend.MemoryState

* **显示名:** HashMapState 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.statbackend.MemoryState](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/statbackend/MemoryState.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. trackSampleInterval

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The sample interval of latency track once 'state.backend.latency-track.keyed-state-enabled' is enabled. The default value is 100, which means we would track the latency every 100 access requests.
	* **默认值:** 100

2. latencyTrackEnable

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		Whether to track latency of keyed state operations, e.g value state put/get/clear.
	* **默认值:** false

3. trackHistorySize

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Defines the number of measured latencies to maintain at each state access operation.
	* **默认值:** 128

## 扩展点:com.qlangtech.tis.plugin.datax.SelectedTab

### com.qlangtech.tis.plugin.datax.hudi.HudiSelectedTab

* **显示名:** HudiSelectedTab 

* **全路径名:** [com.qlangtech.tis.plugin.datax.hudi.HudiSelectedTab](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hudi-common/src/main/java/com/qlangtech/tis/plugin/datax/hudi/HudiSelectedTab.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hudi-common/tis-datax-hudi-common_hudi_0.10.1_spark_2.4.4_hive_2.3.1_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hudi-common/tis-datax-hudi-common_hudi_0101_spark_244_hive_231_hadoop_273tpi">}})

* **参数说明:** 

1. 去重字段

	* **类型:** 单选

	* **必须:** 是

	* **说明:** 
		
		Field within source record to decide how to break ties between records with same key in input data.
		 
		Default: 'ts' holding unix timestamp of record Default: ts
		
	* **默认值:** 无

2. name

	* **类型:** 单行文本

	* **必须:** 是

3. keyGenerator

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		
		Every record in Hudi is uniquely identified by a primary key, which is a pair of record key and partition path where the record belongs to. Using primary keys, Hudi can impose a) partition level uniqueness integrity constraint b) enable fast updates and deletes on records. One should choose the partitioning scheme wisely as it could be a determining factor for your ingestion and query latency.
		
		详细说明：[https://hudi.apache.org/docs/key_generation/#complexkeygenerator](https://hudi.apache.org/docs/key_generation/#complexkeygenerator)
		
		
		
	* **默认值:** 无

4. where

	* **类型:** 单行文本

	* **必须:** 否

	* **说明:** 筛选条件，MysqlReader根据指定的column、table、where条件拼接SQL，并根据这个SQL进行数据抽取。在实际业务场景中，往往会选择当天的数据进行同步，可以将where条件指定为gmt_create > $bizdate 。注意：不可以将where条件指定为limit 10，limit不是SQL的合法where子句。
 where条件可以有效地进行业务增量同步。如果不填写where语句，包括不提供where的key或者value，DataX均视作同步全量数据。
	* **默认值:** 无

5. 同步列

	* **类型:** 多选

	* **必须:** 是

	* **说明:** 需要同步的数据列
	* **默认值:** 无

## 扩展点:com.qlangtech.tis.datax.impl.DataxReader

### com.qlangtech.tis.plugin.datax.DataXCassandraReader

* **显示名:** Cassandra 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXCassandraReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-cassandra-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXCassandraReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-cassandra-plugin.tpi]({{< relref "./tpis/#tis-datax-cassandra-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXFtpReader

* **显示名:** FTP 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXFtpReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-ftp-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXFtpReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-ftp-plugin.tpi]({{< relref "./tpis/#tis-datax-ftp-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXHdfsReader

* **显示名:** Hdfs 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXHdfsReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-hdfs-reader-writer-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXHdfsReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-hdfs-reader-writer-plugin/tis-datax-hdfs-reader-writer-plugin_hadoop_2.7.3.tpi]({{< relref "./tpis/#tis-datax-hdfs-reader-writer-plugin/tis-datax-hdfs-reader-writer-plugin_hadoop_273tpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXMongodbReader

* **显示名:** MongoDB 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXMongodbReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-mongodb-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXMongodbReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-mongodb-plugin.tpi]({{< relref "./tpis/#tis-datax-mongodb-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXOracleReader

* **显示名:** Oracle 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOracleReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-oracle-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOracleReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oracle-plugin.tpi]({{< relref "./tpis/#tis-datax-oracle-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXOssReader

* **显示名:** OSS 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXOssReader](https://github.com/qlangtech/plugins/tree/master/tis-datax-oss-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXOssReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-oss-plugin.tpi]({{< relref "./tpis/#tis-datax-oss-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXPostgresqlReader

* **显示名:** PostgreSQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXPostgresqlReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-postgresql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXPostgresqlReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-postgresql-plugin.tpi]({{< relref "./tpis/#tis-datax-postgresql-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXSqlserverReader

* **显示名:** SqlServer 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXSqlserverReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-datax-sqlserver-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXSqlserverReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-datax-sqlserver-plugin.tpi]({{< relref "./tpis/#tis-datax-sqlserver-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataxMySQLReader

* **显示名:** MySQL 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataxMySQLReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-mysql-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataxMySQLReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-mysql-plugin.tpi]({{< relref "./tpis/#tis-ds-mysql-plugintpi">}})

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

### com.qlangtech.tis.plugin.datax.DataXTiDBReader

* **显示名:** TiDB 

* **全路径名:** [com.qlangtech.tis.plugin.datax.DataXTiDBReader](https://github.com/qlangtech/plugins/tree/master/tis-datax/tis-ds-tidb-plugin/src/main/java/com/qlangtech/tis/plugin/datax/DataXTiDBReader.java) 

* **提供者:** [DataX](https://github.com/alibaba/DataX) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-ds-tidb-plugin.tpi]({{< relref "./tpis/#tis-ds-tidb-plugintpi">}})

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

## 扩展点:com.qlangtech.tis.async.message.client.consumer.impl.AbstractAsyncMsgDeserialize

### com.qlangtech.async.message.client.to.impl.DefaultJSONFormatDeserialize

* **显示名:** defaultJson 

* **全路径名:** [com.qlangtech.async.message.client.to.impl.DefaultJSONFormatDeserialize](https://github.com/qlangtech/plugins/tree/master/tis-asyncmsg-rocketmq-plugin/src/main/java/com/qlangtech/async/message/client/to/impl/DefaultJSONFormatDeserialize.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-asyncmsg-rocketmq-plugin.tpi]({{< relref "./tpis/#tis-asyncmsg-rocketmq-plugintpi">}})

## 扩展点:com.qlangtech.plugins.incr.flink.launch.RestartStrategyFactory

### com.qlangtech.plugins.incr.flink.launch.restart.FixedDelay

* **显示名:** fixed-delay 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.restart.FixedDelay](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/restart/FixedDelay.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. delay

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Delay between two consecutive restart attempts if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">fixed-delay</code>. Delaying the retries can be helpful when the program interacts with external systems where for example connections or pending transactions should reach a timeout before re-execution is attempted. It can be specified using notation: "1 min", "20 s"
		
		 单位：`秒`
	* **默认值:** 1

2. attempts

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The number of times that Flink retries the execution before the job is declared as failed if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">fixed-delay</code>.
	* **默认值:** 1

### com.qlangtech.plugins.incr.flink.launch.restart.ExponentialDelay

* **显示名:** exponential-delay 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.restart.ExponentialDelay](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/restart/ExponentialDelay.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. backoffMultiplier

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		Backoff value is multiplied by this value after every failure,until max backoff is reached if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">exponential-delay</code>.
	* **默认值:** 2.0

2. initialBackoff

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Starting duration between restarts if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">exponential-delay</code>. It can be specified using notation: "1 min", "20 s"
		
		 单位：`秒`
	* **默认值:** 1

3. jitter

	* **类型:** 单行文本

	* **必须:** 是

	* **说明:** 
		Jitter specified as a portion of the backoff if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">exponential-delay</code>. It represents how large random value will be added or subtracted to the backoff. Useful when you want to avoid restarting multiple jobs at the same time.
	* **默认值:** 0.1

4. maxBackoff

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		The highest possible duration between restarts if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">exponential-delay</code>. It can be specified using notation: "1 min", "20 s"
		
		 单位：`秒`
	* **默认值:** 300

5. resetBackoffThreshold

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Threshold when the backoff is reset to its initial value if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">exponential-delay</code>. It specifies how long the job must be running without failure to reset the exponentially increasing backoff to its initial value. It can be specified using notation: "1 min", "20 s"
		
		 单位：`秒`
	* **默认值:** 3600

### com.qlangtech.plugins.incr.flink.launch.restart.FailureRate

* **显示名:** failure-rate 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.restart.FailureRate](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/restart/FailureRate.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})

* **参数说明:** 

1. failureRateDelay

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Delay between two consecutive restart attempts if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">failure-rate</code>. It can be specified using notation: "1 min", "20 s"
		
		 单位：`秒`
	* **默认值:** 1

2. maxFailures

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Maximum number of restarts in given time interval before failing a job if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">failure-rate</code>.
	* **默认值:** 1

3. failureRateInterval

	* **类型:** 整型数字

	* **必须:** 是

	* **说明:** 
		Time interval for measuring failure rate if <code class="highlighter-rouge">restart-strategy</code> has been set to <code class="highlighter-rouge">failure-rate</code>. It can be specified using notation: "1 min", "20 s"
		
		 单位：`秒`
	* **默认值:** 60

### com.qlangtech.plugins.incr.flink.launch.restart.OFF

* **显示名:** off 

* **全路径名:** [com.qlangtech.plugins.incr.flink.launch.restart.OFF](https://github.com/qlangtech/plugins/tree/master/tis-incr/tis-realtime-flink/src/main/java/com/qlangtech/plugins/incr/flink/launch/restart/OFF.java) 

* **费用:** `社区版(免费)`

* **插件包:** [tis-realtime-flink.tpi]({{< relref "./tpis/#tis-realtime-flinktpi">}})









































