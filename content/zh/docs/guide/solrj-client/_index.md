---
title: TIS客户端API使用指南
date: 2020-10-27
type: book
weight : 40
---

## 前言
TIS是一套集索引结构定义，数据加工与索引查询分析为一体的全流程管理的搜索平台化产品。

本文针对客户端API，向大家作详细介绍。客户端中包括了两部分功能：
1. [数据查询]({{<relref "#索引查询说明">}})
2. 数据更新 **//TODO**

下面分别对这两部分功能进行说明。


## 客户端API调用准备

### Maven依赖

```xml
<dependency>
  <groupId>com.qlangtech.tis</groupId>
  <artifactId>tis-solrj-client</artifactId>
  <version>最新版本</version>
</dependency>
```

<a class="js-github-release" href="#" data-repo="qlangtech/tis-solr">最新版本:<!-- V --></a>

### 客户端初始化
```java
import com.qlangtech.tis.solrj.extend.TisCloudSolrClient;
TisCloudSolrClient  client 
 = new TisCloudSolrClient("zk1.xxx-daily.com:2181,zk2.xxx-daily.com:2181,zk3.xxx-daily.com:2181/tis/cloud");
```
Zk地址：

## 索引查询说明

这里使用到的查询和solr的查询语法完全一致，详细查询语法请参照[solrwiki](https://lucene.apache.org/solr/guide/8_0/query-syntax-and-parsing.html)

这里对常用的查询作说明，例如，会对某个实例ID进行过滤：

```java
import org.apache.solr.client.solrj.SolrQuery;
import com.qlangtech.tis.solrj.extend.TisCloudSolrClient.SimpleQueryResult;
import com.qlangtech.tis.solrj.extend.pojo.Totalpay;

SolrQuery query = new SolrQuery();
query.setQuery("totalpay_id:0002280950fabbb30150fb82eaf80157");
SimpleQueryResult<Totalpay> result = this.client.query(
	"search4totalpay", "1234", query, Totalpay.class);
for (Totalpay pay : result.getResult()) {
  System.out.println(pay.getTotalpayId());
}
```

以上totalpay对象不需要自己编写，可以直接从PSearcher平台（http://10.1.5.214:8080/runtime/ext.htm）取得，参照下图：
第一步，切换到当前索引并且点击索引查询


第二步，打开POJO页面，可以选择下载文件，拷贝到自己的workspace中


以上SolrQuery的setQuery方法可以设置较复杂的查询条件，如果有多个条件组合查询，可以使用“AND”或者“OR”条件联合查询（注意：AND和OR字符必须大写，如果小写就会出错），如下：
```java
query.setQuery("totalpay_id:0002280950fabbb30150fb82eaf80157 AND curr_date:[20140627 TO *]");
```


两个条件为与关系，curr_date的条件是时间大于20140627的记录。

注：另外，还有一个查询方法：mergeQuery(),在query()查询方法中，必须提供一个shareid，提供这个参数之后查询效率会更高，因为，数据是按照shardid哈希取余分组的，通过shareid会直接命中数据集群的某一组，对数据的一个子集进行查询。但是在真实的场景下，往往不能提供shareid，所以调用mergeQuery()，这个查询的响应速度稍低，查询请求会发送到所有数据分片上，然后merge之后反馈给客户端。

### 翻页查询
#### 传统的翻页方式
传统翻页方式类似Mysql 中的翻页“limit offset,rows”这种方式存一个显著的问题，那就是当遇见深度翻页的情况会导致在内存中进行堆排序过程中启用一个巨大的堆，导致JVM OOM，所以在生产环境中不建议使用。以下是一段翻页查询的例子：
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

SimpleQueryResult<SupplyGoods> response 
  = this.client.mergeQuery("search4supplyGoods", query, SupplyGoods.class);

// 取总记录数
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
}}
```

当一次查询命中结果集量大，且查询设置了排序字段，则在客户端进行深度翻页的时候会对服务端有较大的性能开销。

#### cursorMarker翻页方式

利用CursorMark的翻页方式原理是每次从服务端得到的一页记录，同时会得到一个最后条记录以“排序键值+主键”生成的游标。然后需要请求下一页，直接将之前得到的cursorMark（游标）传给服务端就行。以下是示例代码：

{{% alert note %}}
优势：这种方式有效控制翻页排序过程中内存堆的开销，可以有效避免深度翻页造成内存溢出，生产环境中强烈推荐使用这种翻页方式
{{% /alert %}}

``` java 

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.common.params.CursorMarkParams;

public void testCursorMarkQuery() throws Exception {

 String cursorMark = CursorMarkParams.CURSOR_MARK_START;
 while (true) {
	SolrQuery query = new SolrQuery();
	// 设置查询条件例子
	query.setQuery(
		"{!distinctOrder}order_id:[* TO *] AND customer_ids:c69a5f96088648a9bedf1042619044b3 AND {!terms f=entity_id}99925788,99001331");

	 query.addSort("create_time", ORDER.desc);
    // waitingorder_id 是本索引的PK建，在addSort中至少要有PK键在sort中
    query.addSort("waitingorder_id", ORDER.desc);
	query.setRows(20);
	query.setFields("order_id", "waitingorder_id", "create_time");

	query.set(CursorMarkParams.CURSOR_MARK_PARAM, cursorMark);
			
	SimpleQueryResult<WaitingUser> result = client.mergeQuery("search4waitingUser", query, WaitingUser.class);			
	for (WaitingUser doc : result.getResult()) {
		System.out.println(
		doc.getWaitingorderId() + ",order_id:" + doc.getOrderId() + ",create:" + doc.getCreateTime());
	}

	if (cursorMark.equals(result.getResponse().getNextCursorMark())) {
		// 提交的cursorMark 和接收到的cursorMark值相等,则已经翻到了最后一页
		break;
	} else {
		// 取下一页的cursorMark
		cursorMark = result.getResponse().getNextCursorMark();
	}
}
}
```

### 流式导出
客户端需要大量数据导出，为了避免客户端翻页且大量内存开销，Solr支持服务端流式导出功能（支持的服务端handler为“/export”）。以下是示例代码：
```java

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.io.Tuple;

import com.qlangtech.tis.solrj.extend.BasicTestCase;
import com.qlangtech.tis.solrj.extend.AbstractTisCloudSolrClient.ResponseCallback;

SolrQuery query = new SolrQuery();
query.setQuery("_query_:\\\"{!topNField sort=spell,asc,string}entity_id:1234 AND (bar_code_like:\\\\^ OR name:\\\\^)\\\"");
// 至少需要设置一个主键的排序键，因为主键不会重复，这样可以保证排序的唯一性
query.setSort("id", ORDER.asc);
// 需要导出的字段
query.setFields("id,spell,docid:[docid f=docid]");
client.queryAndStreamResponse("search4supplyGoods", query, "99933218", new ResponseCallback<Tuple>() {

@Override
public void process(Tuple pojo) {
  System.out.println(pojo.getString("id"));
}

@Override
public void lististInfo(long numFound, long start) {
    // 在查询第一时间得到总记录数
	System.err.println("all find:" + numFound);
}

}, Tuple.class);
```

### 分组(group)查询

当结果集合需要按照某列分组，每组按照某列进行排序取若干条数据，线框图如下，结果集合需要按照接收者id分组，每组显示3条

示例代码：

```java

public void testGroupSearch() throws Exception {
	SolrQuery query = new SolrQuery();
	query.setQuery("entity_id:99926498 OR entity_id:99926456");

	query.set("group", true);
	query.set("group.field", "entity_id");
	query.set("group.limit", 20);
	query.setParam("group.sort", "id asc,create_time asc");

	QueryResponse response = this.client.mergeQuery("search4product", query);

	GroupResponse group = response.getGroupResponse();

	for (GroupCommand c : group.getValues()) {
		for (Group g : c.getValues()) {
	    	// 每组显示
    		System.out.println("GroupValue:" + g.getGroupValue());
		 for (SolrDocument d : g.getResult()) {
			System.out.println("==" + d.get("id"));
		 }
		}
	}
}
```
参考：[https://blog.csdn.net/lyf_ldh/article/details/82707401](https://blog.csdn.net/lyf_ldh/article/details/82707401)

### 统计查询
统计// TODO

### 基于后台系统的多值IN查询

- Solrconfig配置

    ```xml
     <queryParser name="cachedTerms" 
         class="com.qlangtech.tis.solrextend.queryparse.s4message.CachedTermsQParserPlugin" />
    ```
- 查询实例

    ```java
    SolrQuery query = new SolrQuery();
    
    query.setQuery("*:*");
    query.addFilterQuery("{!cachedTerms f=entity_id v=1}123456");
    
    QueryResponse response = server.query("shop", query);
    System.out.println("getNumFound:" + response.getResults().getNumFound());
    for (SolrDocument d : response.getResults()) {
        System.out.println(d);
    }
    ```

- 参数说明：
    1. f：需要作多值匹配的字段
    2. v：为版本号，当对应的key对应的值列表如果有变化，则该版本号需要更新（版本号需要不断变大）
    3. 查询文本内容块，对应的key

### 查询参数说明

查询富文本过程中，假设有以下几条记录，有一个text_content字段（该字段是以用IK分词的smart=false）

1. “唐山是中国二线城市，它经历了1976年的大地震灾难”
2. “唐山是中国的一个北方城市”
3. “唐山大地震发生于1976年”

现用户以**text_content:唐山大地震** 为条件进行搜索，查询结果命中三条记录。
用户反馈搜索结果不理想，第2条不能命中到，究其原因是**QP{!lucene}** 中处理多term的关联关系是用OR(具体参考：**org.apache.solr.search.LuceneQParser**类)

