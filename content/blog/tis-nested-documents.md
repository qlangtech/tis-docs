+++
title = "TIS NestDoc实时同步方案"
date = 2018-11-20T22:42:24+08:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["技术方案"]
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

##  背景

为了支持业务方一对多的实体关联查询，例如上平系统中的SPU对多个SKU模型，会员画像中用户基本属性对多个消费行为属，类似这样的数据模型上查询，需要兼顾数据规模可控，终端查询低延时。在Solr中引入了嵌套子文档的概念（ [netstDocument](http://yonik.com/solr-nested-objects/ "Nested Objects in Solr")）。

Solr框架虽然支持了NestDocument的查询方案。但，在全量构建和增量方案中有几个点需要针对Nest Document进行配置才能在生产环境中使用。日常公共环境中可以参照 search4supplyCommodity索引的配置

## 配置点

### 全量构建配置

在hive中准备全量宽表数据，在hive中数据使用不同的组织方式来支持NestDocument构建，根据子文档的复杂程度可以选择以下两种方式：

+ 拆分单条记录某个字段生成child记录，schema中需要添加如下注释：

```
  <!--{ParentExtractColumnProcessor
     childColmnNames=key1,key2,key3
     column=breakUpColName
     type=c}-->
```

属性说明
    
   1. column: 需要拆分成child记录的列名，column列值格式需符合格式：v1_v2_v3[;v1_v2_v3]
   2. childColmnNames：子文档的列名称（必须要在schema中申明）
   3. type：生成的子文档的type列名称

+ 多条顺序记录“child-child-parent”构建

```
<schema name="search4product"
  indexBuilder="com.taobao.terminator.indexbuilder.index.nestdoc.NestDocIndexBuilder"
  docMaker="com.taobao.terminator.indexbuilder.doc.impl.SequenceFileNestInputDocCreator"
version="1.6">
```

需要配置docMaker属性，重新定制构建LuceneDocument的执行逻辑，将顺序排列的文档，构建成嵌套的Document对象，原始的文档结构需要在构建hive表的时使用[窗口函数实现](https://blog.csdn.net/qq_26937525/article/details/54925827)。
在hive原始dump文件中的记录在hdfs的文件中通过hive的窗口函数将类型为child和parent的记录照严格按照“child-child-parent”的顺序排列的，TIS的build中心在构建全量索引需要将一个“child-child-parent”序列构建成一个SolrInputDocument对象。

### 实时增量增量

扩展修改反查TIS原始记录执行逻辑，当binlog的类型为更新类型，需要将原始的被更新记录反查出来，而这个反回来的文档是带有子文档的，所以需要对默认的反查逻辑进行修改，
[参考链接](http://git.2dfire-inc.com/tis-incr/tis-incr-s4supplyCommodity/blob/master/src/main/java/com/dfire/tis/realtime/transfer/search4supplyCommodity/SupplyCommodityConsumer.java)

```java
@Override
   protected SolrDocument fetchDocument(String collection, IPk pk, IPojo pojo) throws Exception {
       String sharedId = this.getShareId(pojo);
       final String commodityId = pk.getValue();
       // Binlog中存在的id
       final Set<String> binlogIdsSet = getBinlogIdsSet(pojo);
       // 从TIS中将 SPU反查回来
       SolrDocument spu = fetchExistSpu(collection, commodityId, binlogIdsSet);
       if (spu == null) {
           // llog(ccount, pk, "spu_is_null");
           return null;
       }
       // 取得反查tis得到的SKU ID列表
       Set<String> fetchedIds = getFetchedIds(spu);
       // 数据库中已经存在的（最全的记录）
       List<CommodityGoods> ids = daoFacade.getCommodityGoodsDAO().getIdsByCommodityId(commodityId, sharedId);
       // 统计丢失的sku记录，并且从数据库中将其恢复
       List<String> lackSkuIds = ids.stream().map(CommodityGoods::getId).filter((rr) -> {
           return !(binlogIdsSet.contains(rr) || fetchedIds.contains(rr));
       }).collect(Collectors.toList());
       // 將丢失的sku信息补全
       this.complementedLackedSku(sharedId, spu, lackSkuIds);
       return spu;
   }
```
nestget 支持服务端对NestDocument 的get（如果softcommit没有生效，会到tlog中记录反查回来）需要在solrconfig配置文件中添加“searchComponent”:

```xml
 <searchComponent name="nestget" class="com.dfire.tis.solrextend.handler.component.NestRealtimeGetComponet" />
 
  <requestHandler name="/select" class="solr.SearchHandler">
    <lst name="defaults">
      <str name="echoParams">explicit</str>
      <int name="rows">10</int>
      <str name="df">text</str>
    </lst>
    <arr name="last-components">
      <str>nestget</str>
    </arr>
  </requestHandler
```

服务端updateHandler需要用TisDirectBlockUpdateHandler这个类

```xml
<updateHandler class="org.apache.solr.update.TisDirectBlockUpdateHandler">
    <updateLog>
     。。。
    </updateLog>
    <autoCommit>
      。。。
    </autoCommit>
    <autoSoftCommit>
     。。。
    </autoSoftCommit>
  </updateHandler>
```

