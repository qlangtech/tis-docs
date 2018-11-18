+++
title = "TIS客户端使用说明"
date = 2018-07-30T11:12:15+08:00
draft = false
math = true
highlight = true
list_format = 1
# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["aaa","bbbb"]
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

# 前言

TIS是一套集索引结构定义，数据加工与索引查询分析为一体的全流程管理的搜索平台化产品。
本文就搜索平台提供的客户端API，向大家作详细介绍。客户端中包括了两部分功能，一个搜索引数据查询，还有索引数据更新。下面分别对这两部分功能进行说明。


# 客户端API调用方法
## Maven依赖
```xml
<dependency>
  <groupId>com.dfire.tis</groupId>
  <artifactId>tis-solrj-client</artifactId>
  <version>3.7.17</version>
</dependency>
```
最新版本请查看：http://nexus.2dfire-dev.com/#nexus-search;quick~tis-solrj
## 初始化
``` java
import com.dfire.tis.solrj.extend.TisCloudSolrClient
//这个地址是日常的
TisCloudSolrClient  client 
  = new TisCloudSolrClient(
  "zk1.2dfire-daily.com:2181,zk2.2dfire-daily.com:2181,zk3.2dfire-daily.com:2181/tis/cloud"/*日常环境*/);
```
### Zk地址

* 日常 
zk1.2dfire-daily.com:2181,zk2.2dfire-daily.com:2181,zk3.2dfire-daily.com:2181/tis/cloud
* 线上
tiszk1.2dfire-inc.com:2181,tiszk2.2dfire-inc.com:2181,tiszk3.2dfire-inc.com:2181/tis/cloud


## 索引查询说明

### 简单查询
这里使用到的查询和solr的查询语法完全一致，详细查询语法请参照solrwiki：https://wiki.apache.org/solr/SolrQuerySyntax
这里对最常用的查询作一个说明，例如，会对某个实例ID进行过滤：
``` java
import org.apache.solr.client.solrj.SolrQuery;
import com.dfire.tis.solrj.extend.TisCloudSolrClient.SimpleQueryResult;
import com.dfire.tis.solrj.extend.pojo.Totalpay;

    SolrQuery query = new SolrQuery();
	query.setQuery("totalpay_id:0002280950fabbb30150fb82eaf80157");
	SimpleQueryResult<Totalpay> result = this.client.query(
				"search4totalpay", "1234", query, Totalpay.class);
	for (Totalpay pay : result.getResult()) {
		System.out.println(pay.getTotalpayId());
	}
```

以上POJO Totalpay不需要自己编写，可以直接从TIS平台（http://tis-route-tis.2dfire.net/runtime/ext.htm）取得
参照下图：

![tis console1](media/tis-console1.png)

![tis console2](media/tis-console2.png)


### 复杂查询

SolrQuery的setQuery方法可以设置较复杂的查询条件，如果有多个条件组合查询，可以使用“AND”或者“OR”条件联合查询（注意：AND和OR字符必须大写，如果小写就会出错），如下：
``` java
query.setQuery("totalpay_id:0002280950fabbb30150fb82eaf80157 AND curr_date:[20140627 TO *]");
```
两个条件为与关系，curr_date的条件是时间大于20140627的记录。

注：另外，还有一个查询方法：mergeQuery(),在query()查询方法中，必须提供一个shareid，提供这个参数之后查询效率会更高，因为，数据是按照shardid哈希取余分组的，通过shareid会直接命中数据集群的某一组，对数据的一个子集进行查询。但是在真实的场景下，往往不能提供shareid，所以调用mergeQuery()，这个查询的响应速度稍低，查询请求会发送到所有数据分片上，然后merge之后反馈给客户端。

### 翻页查询

以下是一段翻页查询的例子
```java
public void testPages() throws Exception {
		// String collection, SolrQuery query, Class<T> clazz
		int pageSize = 11;
		SolrQuery query = new SolrQuery();
		query.setQuery("*:*");
		query.setRows(pageSize);
         // 设置结果中需要包含的列名称，功能类似SQL语句Select 部分执行的列，执行之后可以有效控制网络传输的数据量
         String[] fields = new String[]{“col1”,”col2”}
        query.setFields(fields);
		query.setStart(0);

		SimpleQueryResult<SupplyGoods> response = this.client.mergeQuery("search4supplyGoods",
				query, SupplyGoods.class);
         //取总记录数
		final Long allrow = response.getNumberFound();
		query.setRows(pageSize);
		int page = 0;
		int start = 0;
		while (true) {
			start = (page++) * pageSize;
			if (start > (allrow - 1)) {
				break;
			}

			System.out.println("page:" + page + "======================");

			query.setStart(start);
			response = this.client.mergeQuery("search4supplyGoods", query, SupplyGoods.class);

			for (SupplyGoods goods : response.getResult()) {
				System.out.println("id:" + goods.getId());
			}
		}
	}
```
当一次查询命中结果集量大，且查询设置了排序字段，则客户端进行深度翻页的时候会对服务端有较大的性能开销。

### Solr大翻页查询优

