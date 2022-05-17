---
title: 基于Lucene的标签tag权重过滤和排序算法
date: 2020-11-10
type: blog
author: ['百岁']
tags: ['qparser','技术方案']
abstract: 业务系统对某条记录进行打标签，并且标签会附带权重系数，在查询过滤时候基于权重系数来进行过滤或者排序这是业务系统非常普遍的需求。现就这一需求，介绍一下如何利用Lucene/Solr的扩展性来实现这一需求
---

## 前言

有兄弟在社区中提出这样一个需求,如下：

>我想存储用户的标签 购物偏好:化妆品:0.2,零食:0.8  这种 怎么存储才能既能筛选出 零食偏好>0.5的用户

在业务系统对某条记录进行打标签，且标签会附带权重系数，在查询过滤时先基于**标签**过滤然后再针对**权重系数**来进行**过滤**。也可以基于权重系数进行排序这是业务系统非常普遍的需求。就这一需求，介绍一下如何通过扩展Lucene/Solr底层API的方式来实现这一需求

## 实现

主要思想是将**权重值**作为Lucene倒排索引的语汇单元(term)附带的paload值，查询过程中利用org.apache.lucene.search.spans.SpanQuery的子类取用payload信息来对文档进行过滤和排序操作。

笔者是使用Solr来作示例，如果用户是使用ES，理论上在ES中也有等效的扩展机制来扩展Lucene的

### 数据准备
首先要在Schema上定义一个字段类型，后续可以让Lucene在字段解析（parser）过程进去处理，默认字段格式为 **"tag1_priority2,tag2_priority2[,tag_priority]"** 这里的权重系数 priority取值需要在[0-1]之间

### 扩展org.apache.lucene.analysis.Tokenizer

扩展Tokenizer的目的是在构建索引过程中对tags列解析，分别将tag和priority存储到Lucene的[>CharTermAttribute](https://lucene.apache.org/core/8_7_0/core/org/apache/lucene/analysis/tokenattributes/CharTermAttribute.html) [>PayloadAttribute](https://lucene.apache.org/core/8_7_0/core/org/apache/lucene/analysis/tokenattributes/PayloadAttribute.html)
中，代码如下：
``` java
public class TagPayloadTokenizerFactory extends Tokenizer {

    private final CharTermAttribute termAtt = addAttribute(CharTermAttribute.class);
    private final PayloadAttribute payloadAtt = addAttribute(PayloadAttribute.class);
    public static final Pattern KV_PAIR_LIST_PATTERN = Pattern.compile("([^,]+?)_(.+?)");

    public final boolean incrementToken() throws IOException {
            this.clearAttributes();
            PayLoadTerm t = null;
    
            if (payloadTerms == null) {
                payloadTerms = new ArrayList<>();
                Matcher kvPairMatcher = KV_PAIR_LIST_PATTERN.matcher(IOUtils.toString(this.input));
                int start = 0;
                float payload;
                while (kvPairMatcher.find()) {
                    payload = getPayload(kvPairMatcher);
                    byte[] bytes = new byte[4];
                    // 将float序列化成bytes
                    NumericUtils.intToSortableBytes(NumericUtils.floatToSortableInt(payload), bytes, 0);
                    // builder.copyBytes(,0,4);   //   NumericUtils.floatToSortableInt(payload > 0 ? payload : 0f, 0, builder);
                    t = new PayLoadTerm(kvPairMatcher.group(1), new BytesRef(bytes));
                    payloadTerms.add(t);
    
                    start = start + kvPairMatcher.group(0).length() + 1;
                }
                termsIndex = 0;
                termsLength = payloadTerms.size();
            }
    
            if (termsIndex >= termsLength) {
                termsIndex = -1;
                payloadTerms = null;
                return false;
            }
            t = payloadTerms.get(termsIndex++);
            termAtt.setEmpty().append(t.key);
    
            payloadAtt.setPayload(t.payload);
            return true;
        }
}

```

需要将TagPayloadTokenizerFactory在Solr的配置文件中配置，需要一个工厂类进行包装：
```java
public class TagPayloadTokenizerFactory extends TokenizerFactory {
  
    @Override
    public Tokenizer create(AttributeFactory factory) {
        TagPayloadTokenizer tokenizer = new TagPayloadTokenizer(factory);
        return tokenizer;
    }
}
```
在schema.xml中配置：
```xml
<fieldType name="kv_boost_payload" class="solr.TextField">
  <analyzer type="index">
     <tokenizer class="com.qlangtech.tis.solrextend.fieldtype.TagPayloadTokenizerFactory"/>
  </analyzer>
  <analyzer type="query">
      <tokenizer class="solr.PatternTokenizerFactory" pattern=",\s*"/>
  </analyzer>
</fieldType>
   
<field name="tags" type="kv_boost_payload" stored="true" indexed="true" required="false"/>
```

### 扩展QP(org.apache.solr.parser.QueryParser)

扩展QP是为了在进行查询过程中自定义Query对象，实现对语汇单元对应的payload信息的取用，最终实现过滤和排序操作。 
该流程需要扩展Lucene的[SpanQuery类](https://lucene.apache.org/core/8_7_0/core/org/apache/lucene/search/spans/SpanQuery.html)(跨度查询)

