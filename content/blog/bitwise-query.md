+++
title = "尝试BitwiseQuery"
date = 2018-12-04T15:05:15+08:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["fieldtype"]
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

##  什么是BitwiseQuery?

生产环境中会使用很多开关变量，比如O2O业务场景中会有，是否开启外卖服务，是否优惠券，是否有到店优惠等。开关项是可以根据业务需要无限扩展的，为了在持久层做到以不变应万变，会在数据库表字段添加一个整型字段（十进制）它对应的二进制二进制字段的每一位都代表一个开关变量。

如果是mysql中使用UNSIGNED BIGINT类型理论上可以支持64个开关值，但是实际使用场景下不会用到这么多的开关位。

以下表单展示的是业务中的四个标记位，分表代表了数据库中的四个字段

|  字段名称 |      pickup_flag      |  delivery_flag | logistics_flag |
|----------|:-------------:|:------:|----------:|
|  状态值    |  1            | 1      |2|1|
| 对应的bitval |    8       |   4   |2|1|

现在需要在TIS中把他们合并到一个service_flag字段中。

## 实现方法

### Schema配置中配置

添加bitwiseBuild标注，为了在全量构建过程中将pickup_flag，delivery_flag，delivery_flag，logistics_flag几个字段合并，需要添加 **bitwiseBuild** 标注项，如下：

``` xml
 <!--{bitwiseBuild sourceCols=pickup_flag,delivery_flag,delivery_flag:2,logistics_flag  targetCol=service_flag}-->
  <field name="service_flag" type="bitwise" stored="true" indexed="true" required="false"/>
```

并且，需要将service_flag设置为 **bitwise** 类型

``` xml
<fieldType name="bitwise" class="com.dfire.tis.solrextend.fieldtype.BitwiseField" 
     omitNorms="true"  omitTermFreqAndPositions="true" />
```

### 客户端查询

等服务端全量数据准备好之后就使用solrj进行数据查询啦，示例如下：

``` java
SolrQuery query = new SolrQuery();
query.setQuery("{!lucene q.op=AND}service_flag:15");

QueryResponse r = server.query("shop", query);

for (SolrDocument doc : r.getResults()) {
     System.out.println("id:" + doc.getFieldValue("id") + ",service_flag:" + doc.getFieldValue("service_flag"));
}

```

service_flag查询的过滤值是15 对应的二进制是 1111，在加上前面的QP的local param设置为‘AND‘就，整个查询表达式

> {!lucene q.op=AND}service_flag:15"

的含义就是四个开关项目必须同时满足才能匹配结果。也可以这样设置：

> {!lucene q.op=OR}service_flag:15"

**q.op=OR** 时查询表达式的含义为，至少有一个开关项打开就能匹配结果





