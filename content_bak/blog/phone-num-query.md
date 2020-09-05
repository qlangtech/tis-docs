+++
title = "利用Lucene Span Query的电话号码查询优化"
date = 2018-08-05T13:45:52+08:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = []
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
[header]
image = ""
caption = ""

+++

##  起因

 某天的生产环境服务器突然报告有cpu load超负荷的报警，然后赶紧查看查询日志，发现日志中有大量类似这样的查询:
```html
{q=(customer_mobile:/[0-9]{7}7785/+OR+code:7785)&distrib=false
&_stateVer_=search4card:1494&start=0
&fentityid:123456&rows=20
&wt=javabin&version=2
&_route_=123456&single.slice.query=true} hits=1 status=0 QTime=694   
``` 
 很明显有一个很特殊的查询条件
 
> customer_mobile:/[0-9]{7}7785/

意思是需要查询手机号码后四位为__7785__的记录，从日志上观察到响应时间还挺长的，平均都需要600毫秒起。
 
  经验告诉我，CPU load飙高是因为这个查询条件造成的，然后联系了业务团队，先把这个查询CASE关掉，随后服务器cpu load也随之恢复了正常。
  那么，现在需要对查询进行优化，使用正则式匹配依赖了lucene4之后引入的FST来存储term，一定程度上优化了Lucene上的模糊匹配性能，但本质上比依赖倒排链的查询效率低了几个数量级。

## 着手优化
改成使用倒排链也比较简单：
 
``` xml
<fieldType name="mobile" class="solr.TextField"  >   
   <analyzer type="index">   
      <tokenizer class="solr.WhitespaceTokenizerFactory"/>  
      <filter class="solr.NGramFilterFactory" minGramSize="2" maxGramSize="11" /> </analyzer>    
    <analyzer type="query">   
      <tokenizer class="solr.WhitespaceTokenizerFactory"/>   
    </analyzer>   
</fieldType>  
```
使用ngram分词可以很好地解决模糊匹配的问题，但是这没法解决，需要匹配的关键词在电话号码中出现的位置进行过滤，比如__“7785”__在电话号码中间位置出现，这样的记录是需要过滤掉的，但是光用NGram没法实现此功能。
 
 解决办法是在构建索引时，倒排链上附加上Term所在词条位置出现的偏移位置（OffsetAttribute），构建TokenStream流时，添加OffsetAttribute属性值，正好它能设置startOffset和endoffset，

``` java
private final OffsetAttribute offsetAttribute;  
    public AllWithPositionNGramTokenFilter(
      TokenStream input, int minGram, int maxGram) {  
        super(input, minGram, maxGram);  
        this.offsetAttribute = this.addAttribute(OffsetAttribute.class);  
    }  
  
    protected void appendAttribute(
      char[] curTermBuffer, int curTermLength, int start, int end) {  
        this.offsetAttribute.setOffset(start, end);  
    }
```
 接下来需要将索引的offset写入开关打开（IndexOptions.DOCS_AND_FREQS_AND_POSITIONS_AND_OFFSETS），需要在Schema的fieldType上去设置属性值。经过试验这个开关始终没有成功，最后打算在代码里面写死，虽然粗暴但是很有效：
 
```java
public class TextFieldWithOffset extends TextField {  
    protected IndexOptions getIndexOptions(SchemaField field, String internalVal) {  
        return IndexOptions.DOCS_AND_FREQS_AND_POSITIONS_AND_OFFSETS;  
    }  
   }
```
 只要在方法getIndexOptions返回DOCS_AND_FREQS_AND_POSITIONS_AND_OFFSETS,构建索引时就会拿到TokenStream中的Offset属性存到倒排索引中，schema中的fieldtype改成如下：
 
```xml
<fieldType name="mobile" class="com.dfire.tis.solrextend.fieldtype.common.TextFieldWithOffset"   
           sortMissingLast="true" omitNorms="true"   
           autoGeneratePhraseQueries="false" >   
   <analyzer type="index">   
      <tokenizer class="solr.WhitespaceTokenizerFactory"/>  
      <filter class="com.dfire.tis.solrextend.fieldtype.s4card.AllWithPositionNGramTokenFactory" minGramSize="2" maxGramSize="5" />  
    </analyzer>    
    <analyzer type="query">   
      <tokenizer class="solr.WhitespaceTokenizerFactory"/>   
    </analyzer>   
</fieldType>  
```

 你会发现之前ngram的实现改成了AllWithPositionNGramTokenFactory，是的因为Solr默认实现的Offset的值和term的实际位置偏移量是不一致的，所以需要略微修改。
 
 完成以上工作之后，就能写一个测试，试着写一条手机到索引中，看看offset是否正常生成。
 
``` java
public static final EmbeddedSolrServer server;  
    public static final File solrHome;  
  
    static {  
        solrHome = new File("D:/solr/solrhome");  
        server = new EmbeddedSolrServer(solrHome.toPath(), "s4card");  
    }  
  
    public void testAddSpan() throws Exception {  
        long ver = 20171201001007l;  
        SolrInputDocument doc = new SolrInputDocument();  
  
        doc.setField("customer_mobile", "15868113480");  
          
        server.add(doc);  
        server.commit();  
  
        SolrCore core = server.getCoreContainer().getCore("s4card");  
  
        RefCounted<SolrIndexSearcher> s = core.getNewestSearcher(true);  
  
        this.mobileOffsetView(s);   }  
    public void kindCardId(RefCounted<SolrIndexSearcher> s) throws Exception {  
          
        SolrIndexSearcher searcher = s.incref().get();  
        PostingsEnum postings = MultiFields.getTermPositionsEnum(searcher.getIndexReader(),  
                "customer_mobile", new BytesRef("480"));  
        int docid = -1;  
        while ((docid = postings.nextDoc()) != DocIdSetIterator.NO_MORE_DOCS) {  
            int start = 0;  
            System.out.println(postings.freq());  
  
            if((start = postings.nextPosition()) != Spans.NO_MORE_POSITIONS) {  
  
                System.out.println("post start:" + start + ",startOffset:" + postings.startOffset()  
                        + ",endOffset:" + postings.endOffset());  
            }  
        }  
        s.decref();  
          
    }  
 
```
 
OK，现在我们就可以写一个自定义QueryParser了，以下代码为了突出重点作了删减，详细的可以下载:
 
```java
public class MoblieQParserPlugin extends QParserPlugin {  
    public QParser createParser(String qstr, SolrParams localParams, SolrParams params,  
            SolrQueryRequest req) {  
        String fieldName = localParams.get("f");  
        int startPos = localParams.getInt("start_pos", 2);  
          
        SpanTermQuery tq = new SpanTermQuery(new Term(fieldName, qstr));  
        final MobileSpanPositionCheckQuery fquery = new MobileSpanPositionCheckQuery(tq, startPos,  
                StringUtils.length(qstr));  
        return new QParser(qstr, localParams, params, req) {  
            @Override  
            public Query parse() throws SyntaxError {  
                return fquery;  
            }  
        };  
    }  
  
    private class MobileSpanPositionCheckQuery extends SpanPositionCheckQuery {  
  
        private final int startPos;  
        private final int end;  
  
        public MobileSpanPositionCheckQuery(SpanQuery match, int startPos, int length) {  
            super(match);  
            this.startPos = startPos;  
            this.end = startPos + length;  
        }  
  
        。。。。。  
  
        @Override  
        protected AcceptStatus acceptPosition(Spans spans) throws IOException {  
            TermSpans termsSpan = (TermSpans) spans;  
            PostingsEnum posting = termsSpan.getPostings();  
  
            if (posting.startOffset() >= end) {  
                return AcceptStatus.NO_MORE_IN_CURRENT_DOC;  
            } else if (posting.startOffset() == startPos) {  
                return AcceptStatus.YES;  
            } else {  
                return AcceptStatus.NO;  
            }  
        }  
        。。。。。。    
    }  
  
}
```

 在QP中告诉Query需要设置起始的Offset通过acceptPosition函数可以实现doc的二次过滤（第一次是按照Term命中，第二次在第一次的结果集上通过offset进一步过滤）
 
将这个QPPlugin配置到solrconfig中
 
```xml
<queryParser name="termPos"    class="com.s4card.MoblieQParserPlugin" />   
```

最后，就是客户端调用啦，通过这样的query语句就能找到手机末四位为3480的记录了，如果刚开始学Lucene的同学可能会说，

>“这个查询写法为啥这么复杂，数据库SQL的like查询写法多简单”

那么我要告诉你的是，使用基于倒排结构的索引数据哪怕有上亿记录筛选也能达到毫秒级响应速度哦（这个是大数据时代尤为重要的），而且还能根据关键字出现位置进行过滤，这又是数据库查询无法实现的。
 
## 客户端调用

* 查询语法 
```xml
{!termPos f=customer_mobile start_pos=7}3480  
```
 
* Java查询代码示例：
```java
 SolrQuery q = new SolrQuery();  
q.setQuery("{!termPos f=customer_mobile start_pos=7}3480");  
QueryResponse result = server.query(q);  
System.out.println("numFound:" + result.getResults().getNumFound());  
```

## 总结

至此，代码发布上线，电话后缀查询的RT恢复到毫秒级别，CPUload也恢复正常了，依赖倒排索引优化电话号码查询的案例就介绍到这里，还等什么赶紧去尝试吧。

在实际的开发中，我们完全可以通过这个优化案例举一反三，org.apache.lucene.util.Attribute的扩展除了OffsetAttribue还有PostingAttribute，CharTermAttribute等，依赖他们能实现更多杀手级的使用方式。