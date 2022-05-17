---
title: 基于Solr的多表join查询加速方法
date: 2016-04-20
type: blog
abstract: 利用TIS，低延时、高并发地实现数据库中遇到的多表JOIN OLAP查询需求
---

## 前言
大数据时代最有价值的就是数据了，在大数据时代数据呈现出数据量大，数据的维度多的特点，用户会使用多维度随意组合条件快速召回数据。数据处理业务场景需要实时性，需要能够快速精准的获得到需要的数据。之前的通过数据库的方式来处理数据的方式，由于数据库的某些固有特性已经很难满足大数据时代对数据处理的需求。

所以，在大数据时代使用hadoop，hive，spark，作为处理离线大数据的补充手段已经大行其道。 以上提到的这些数据处理手段，只能离线数据处理方式，无法实现实时性。Solr作为补充，能够很好地解决大数据的多维度查询和数据召回实时性要求。

本文通过分析阿里淘宝聚石塔环境中遇到的一个具体需求是如何实现的，通过这个例子，抛砖引玉来体现SORL在数据处理上的优势。

## 需求说明

阿里聚石塔是衔接淘宝大卖家，软件开发者和平台提供者这三者的生态圈，阿里通过聚石塔平台，将阿里云底层的PAAS，IAAS环境提供给第三方开发者，而第三方开发者可以通过自己开发的软件产品。

卖家的交易数据是最有价值的数据，通过交易数据可以衍生出很多产品，例如管理交易的ERP软件，会员营销工具CRM，在聚石塔环境中通过大卖家授权，这部分数据可以授权给独立软件开发者ISV。

在CRM系统中需要能够通过设置买家的行为属性快速过滤出有价值的买家记录，进行精准会员营销。 

以下是两个具体需求，首先看两个线框图：
![](time-range-fee-query.png)
以上是卖家需要实时筛选一段时间内购买数量在一个区间之内的买家。

 
再看一个线框图：

![](time-range-fee2-query.png)

卖家需要实时搜索一个时间段内，消费金额在某个区间之内的买家会员。这里的区间是以天为单位的，时间跨度可长可短。

 

了解了线框图之后，我们还要再看看对应的数据库ER图：
![](multi-tab-er.png)
 

表结构相当简单，只有两张表，稍微有点经验的开发工程师就会写出以下SQL：

``` sql

SELECT  buyer.buyer_id , count(trade.trade_id) as pay_count
FROM buyer 
 INNER JOIN trade on(
   buyer.buyer_id = trade.buyer_id and buyer.seller_id = trade.seller_id)
WHERE trade.trade_time> ? and trade.trade_time < ? and buyer.seller_id=?
GROUP BY buyer.buyer_id
having pay_count > =1 AND pay_count <=5

```
第二个线框图会用以下SQL语句来实现：

``` sql
SELECT  buyer.buyer_id , sum(trade.fee) as pay_sum
  FROM buyer 
   INNER JOIN trade on(
       buyer.buyer_id = trade.buyer_id and buyer.seller_id = trade.seller_id)
WHERE trade.trade_time> ? AND trade.trade_time < ? and buyer.seller_id=?
GROUP BY buyer.buyer_id
HAVING pay_sum > =20 and pay_sum <=100
```
以上，两个SQL语句大同小异，having部分稍有不同， SQL语句并不算复杂，但是在大数据情况下，无法在毫秒级反馈给用户。另外，假如where部分有其他查询条件，比如，买家的性别，买家所属的地区等，就需要数据库上设置更多的联合索引，所以这个需求使用SQL语句根本无法实现的。

 

## 查询加速
问题已经明确，那么解决的办法是什么呢？是使用数据的存储过程？存储过程底层还是依赖数据库表的固有特性，无非是提供一些以时间换空间的策略来实现罢了，换汤不换药，而且各个数据库产品的存储过程实现很很大差别，一旦选择了某一个数据的存储过程之后以后再要迁移数据到其他数据平台上就非常困难了。

这里要向大家隆重介绍搜索引擎Solr。因为，搜索引擎在底层使用倒排索引，这和数据库有本质区别，倒排索引在数据查询的性能上天生就比数据的Btree树好上百倍，具体原因不在这里展开了。虽然某些数据库也支持了倒排索引例如PG，但毕竟不是通用的解决办法。一旦添加了这类型的索引会影响数据的写入吞吐量，因为重建索引非常耗时间。

开源JAVA社区中使用最广泛的应该属Solr了，笔者所在的团队就是长期研究将Solr应用到企业级应用场景中，在原生Solr之上做了很多优化和适配，方便企业级用户使用。

言归正传，先讲讲大致思路，实现的架构图如下：

{{<figure src="impl-architech.png" >}}

## 全量数据准备
这里要说明的一点，发送到搜索引擎中的数据是一条宽表数据，所谓宽表数据是将ER关系为1对N的实体，聚合成一条记录。聚合方式有两种，一种是向1的维度聚合，比如用户实体和消费记录实体，宽表记录如果是以用户维度来聚合和话，就会将所有的消费记录以某个特殊字符作为分割符，聚合成一个字段，作为用户记录的一个冗余字段。也可以以消费记录为维度聚合，将关联的用户信息作为一个冗余字段，可想而知这样的聚合方式用户数据在索引数据中会有很多重复。

打宽表这个环节看似和搜索不怎么相关，但是合理的宽表数据结构能大幅度地提高用户数据查询效率。

全量流程用Hive来实现的，如果是在阿里云公有云环境中可以用ODPS，因ODPS是PAAS服务。

增量通道，需要写一个打宽表操作。因为搜索引擎特有的结构，增量同步更新持续一段时间之后会生成很多索引碎片，所以必须要隔一段时间从数据源重新导出并构建一次全量索引数据。

这里介绍一下上面提交到用户-消费记录的宽表结构（简单起见，去掉了表中和问题域不相关的字段）：

- Buyer表：

  |买家id|卖家id|
  |---|---|
  | Buyer_id | Seller_id|	
	
 
- Trade表：

  |买家id|卖家id|交易id|交易时间|单笔费用|
  |---|---|---|---|---|
  |Buyer_id|Seller_id|trade_id|trade_time|Fee|				
				
 
- 聚合宽表结构：

  |买家id|卖家id|dynamic_info（聚合字段）|
  |---|---|---|
  |Buyer_id|Seller_id|sellerId_date_buyerId_payment_payCount[;sellerId_date_buyerId_payment_payCount]|
 		
   需要对`dynamic_info` 聚合字段详细说明一下：
   
   sellerId_date_buyerId_payment_payCount 这是一个聚合单元，从左向右依次的含义是：卖家ID，购买的日期（精确到天），买家ID，购买天之内的费用总和，购买天之内的购买次数总和。

   Dynamic_info字段可以有多个聚合单元组成，每个单元中的date是按天去重的，假如一个用户在某一天在一家店中有多条购买记录最终也会聚合成一个单元。
   
   给一个聚合字段的实际示例：

   Dynamic_info:9999_20151111_222_345.6_3;9999_20151212_222_627.5_1
 
   字段的意义就是，一个id为222的用户在2015年双11当天购买了3笔价值345元的商品，在双12当天在这个商家处又购买了一笔价值627.5元的商品。

 
在Solr上进行快速数据查询的原因是，Solr的数据源是一个已经聚合好了一份数据，而数据库上执行的join操作会耗费大量IO，在Solr查询省去了这部分时间。

 
宽表数据从多个分表聚合，数据的语义没有变化，只是组织形式发生了变化，如果一个SAAS的服务提供上同时为十几万个大卖家提供筛选服务，而每个大卖家又积累的交易数据是非常大的，全部加在一起，要将数据进行聚合化操作，有非常大的CPU和IO开销，好在云服务时代有强大的离线计算工具如Hadoop，ODPS可以将大数据如同肉面粉一般揉（处理）成任何你想要的结构，分分钟不在话下。

 

## Solr引擎端数据处理

准备好全量源数据，之后就是将其转化为Lucene的索引文件，这个过程请查阅Solr Wiki便可，这里不进行阐述。这里要重点描述的是Solr服务端如何响应用户的查询请求，返回给用户需要的查询结果。

处理用户在时间段内购买量或购买额度进行过滤，需要构建一个QParser的插件，这个插件的作用是遍历和查参数中匹配的条件项生成命中的DocSet命中结果集。

 
### QParser代码实现
 
下面是QParserPlugin.java节选：

```java
  
  for (LeafReaderContext leaf : readerContext.leaves()) {
	docBase = leaf.docBase;
	reader = leaf.reader();
	liveDocs = reader.getLiveDocs();
	terms = reader.terms("dynamic_info");
	termEnum = terms.iterator();
	String prefixStart = sellerId + "_" + startTime;
	String prefixEnd = sellerId + "_" + endTime;
	String termStr = null;
	int docid = -1;
	if ((termEnum.seekCeil(new BytesRef(prefixStart))) != SeekStatus.END) {
		do {
    		Matcher matcher = DYNAMIC_INFO
				.matcher(termStr = termEnum.term().utf8ToString());
			if (!matcher.matches()) {
				continue;
			}
			posting = termEnum.postings(posting);
			docid = posting.nextDoc();

            if (!(docid != PostingsEnum.NO_MORE_DOCS
              && (liveDocs == null || (liveDocs != null && liveDocs.get(docid))))) {
		     continue;
            }
			if ((matcher.group(1) + "_" + matcher.group(2))
				.compareTo(prefixEnd) > 0) {
				break;
			}
			addStatis(buyerStatis, docBase, docid, matcher);
					} while (termEnum.next() != null);
				}
	}
```

以上代码的执行逻辑是，截取prefixStart和prefixEnd之间的term序列，进行分析如果符合过滤条件就将对应docid插入buyerStatis收集器中。

等第一轮数据处理过程中就在对聚合结果进行增量累加，代码如下：

```java
private static StaticReduce addStatis(
			Map<Integer, StaticReduce> buyerStatis, int docBase, int docid,
			Matcher matcher) {
	StaticReduce statis = buyerStatis.get(docBase + docid);
	if (statis == null) {
		statis = new StaticReduce(docBase + docid, Long.parseLong(matcher
				.group(3))/* buyerid */);
		buyerStatis.put(docBase + docid, statis);
	}
	if (statis.buyerId != Long.parseLong(matcher.group(3))) {
		return statis;
	}

	try {
		statis.addPayCount(Integer.parseInt(matcher.group(5)));
	} catch (Exception e) {
	}
	try {
		statis.addPayment(Float.parseFloat(matcher.group(4)));
	} catch (Exception e) {
	}
	return statis;
}
```
同时对购买数量，和购买金额进行累加。

最后对累加结果进行过滤，符合过滤条件的，将docid插入到bitset中：

```java
for (StaticReduce statis : buyerStatis.values()) {
	// TODO 这里自己判断是否要收集这条记录
	if (statis.payCount > Integer.MAX_VALUE
			|| statis.paymentSum > 1) {
		System.out.println("count:" + statis.payCount + ",sum:"
					+ statis.paymentSum);
			bitSet.set(statis.luceneDocId);
	}

}
BitDocIdSet docIdSet = new BitDocIdSet(bitSet);
return new QParser(qstr, localParams, params, req) {
	public Query parse() throws SyntaxError {
			return bitquery;
 }};
```
最后将bitSet包装成BitQuery作为Qparser的parse函数的返回值，返回有solr进一步和其他结果集进行过滤。

### Solrconfig配置实现
 
需要将以上的QparserPlugin插件注入到solr中，需要在solrconfig中写以下配置：

```xml
  <queryParser name="timesegstats" class="com.xxx.qp.TimeSegStatsQParserPlugin" >                                  
      <str name="buyerField">buyer_id</str>                                                                                                              
      <str name="compoundField">dynamic_info </str>                                                                          
      <str name="countField">emailSendCount</str>                                                                                              
      <str name="statsFields"></str>                                                                                                                  
  </queryParser> 
``` 


### Solr查询语句Q参数设置
 
```shell script
q={!multiqp q.op=AND}seller_id:1441097932588 
AND {!timesegstats sellerId=1441097932588 statsField=buyActivity startTime=20150901 endTime=20150924 startValue=1 endValue=200}
AND {!timesegstats sellerId=1441097932588 statsField=paycount startTime=20140901 endTime=20150924 startValue=2 endValue=100}  
```
 
## 总结

以上是一个用Solr搜索引擎解决数据库查询瓶颈的实例，其实搜索引擎的使用场景非常广泛，不仅可以用在像百度这样的大规模非结构化的数据查询，可以定制比较复杂的排序规则。Solr更可以解决像本文讲到的数据库加速的场景，使得原本在数据库上没有无法实现的SQL查询，可以通过Solr搜索引擎上轻松实现。

本文讲到的需求，也可以使用像Hive这样的离线处理工具来实现，每次处理完成后将结果再导入到Mysql中，业务端通过读取数据库表中的数据来向用户展示处理结果。这样做虽然可行，但是，没有办法将处理结果的实时性没有办法保证，而且，离线处理结果的数据结构是固化的，没有办法做到将处理结果灵活调整。而用Solr做到数据的查询出口，可以很好地解决以上两个问题。


## QA:有兄弟在留言中提了几个问题

  比较专业，我在这里详细地回答一下：
1. 你们用的solr是cloud模式吗？
   
   回答：`是的`

2. 数据量可以有多大？
  
   理论上能找到一个数据分组键的话，那可以在一个collection上分出多个share，为了以后扩容方便，分组数目最好是按照2的mie次来分。我之前的公司里有一个100亿+数据量的，
   现在做的一个索引，分了四组， 每组两千万数据，用的是两核四G的机器，100Gssd磁盘

3. 全量的时候，索引会被清空吗？
 
   是的`全部清空`，因为索引的更新或更新操作会对索引文件做标记删除，这样历史文件会越来越大，而且更新过程中会产生子segment，虽然，solr会启动一个后台线程不断地去mege子索引，但子索引合并过程中需要大量io和cpu开销，会影响在线查询的RT时间，所以必须定期做一次全量构建。
 为了不影响在线索引查询的性能，构建全量不是在core节点上完成的，是有专门有一个索引build机器，待索引构建完成之后，再将索引文件拷贝会solr core节点上，做一次reload操作，瞬间替换。

4. 如果清空，某一时刻用户搜索啥也搜不到，怎么解决的？
 
   因为全量构建是需要一定时间，正如你说的，如果这个构建周期比较长的话，当新的全量生效之后，在这个索引构建周期之内的增量数据会丢失掉。为了做到全量构建过程中的增量索引数据不丢失，做到无缝切换，需要对solr的tlog机制作一下改造，适当增长tlog在磁盘中的保存时间，等到reload之后，就以数据库开始dump的时间作为启始时间，重新replay一下tlog日志，就能做到不丢数据了

