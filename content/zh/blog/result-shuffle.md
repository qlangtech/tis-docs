---
title: 利用Solr RankQuery对查询结果进行打散处理
date: 2020-10-18
type: blog
abstract: 在广告活动页面中需要服务端返回的结果进行打散处理，利用Solr RankQuery可以很优雅地实现这一需求


tags: ['qparser']

---
## 背景

 公司新上了一个展示优惠打折商品列表的页面，由于参与活动的打折商品非常多，而打折频道页面商品展位有限。产品经理提出了这样一个需求，需要根据用户偏好（品牌，价格）作为前提的条件下，将首页内容显示具有一定的随机性。
 
 这是一个非常好的需求，因为首页列表随机打散的需求具有普遍性，在很多列表展示场景下会使用到。
 
## 实现方法

### 问题确定
 实现方案中有几个问题需要确定：
 1. 需要确定一个随机因子
    
    可以让首页显示的列表随机展示，随机因子可以是时间、Math.random()、或者其他会时间不断变化的参数都可以。
 
 2. 需要确定如何让随机因子起作用？
    
    让随机因子起作用最直接的途径是，让随机因子来影响文档排序的打分Score。另外，随机因子影响Score得分的权重可以设置，因为影响文档前后的排序主要因素应该是Lucene默认的文档相关性算法，随机因子在只能起到微调的作用。

### 具体实现

#### 代码扩展
需要让随机因子来影响文档排序Socre得分，这里会使用到Solr的[RankQuery](https://lucene.apache.org/solr/8_1_0//solr-core/org/apache/solr/search/RankQuery.html)，简单介绍一下RankQuery：

RankQuery提供了提供了三个扩展方法：
```java
public  class RankQuery extends ExtendedQueryBase {
   
    public  TopDocsCollector getTopDocsCollector(
         int var1, QueryCommand var2, IndexSearcher var3) throws IOException;

    public  MergeStrategy getMergeStrategy();

    public  RankQuery wrap(Query query);
}
```

其中最重要的是`getTopDocsCollector`方法，它可以让用户扩展查询过程中覆写Lucene的Collector收集器（查询过程中所有命中的记录都会执行Collector的回调，记录是否命中和在结果集中的排序先后会由Collector来决定，下面我们来看看如何扩展getTopDocsCollector()方法：

getTopDocsCollector()方法返回的是TopDocsCollector<ScoreDoc>类型，它实现了Lucene的Collector接口，在内部耦合了PriorityQueue优先队列，该优先队列定长队列，Lucene的堆排序使用的最核心的数据结构就是[PriorityQueue](https://lucene.apache.org/core/8_5_1/core/org/apache/lucene/util/PriorityQueue.html)
，有新来的记录先和堆的最小值（Socre）比较一下，如果比最小值小的话就直接丢掉，如果比最小值大的话就压入`PriorityQueue`在对内重新调整元素次序

```java
private class ShufferCollector extends TopDocsCollector<ScoreDoc> {
	ScoreDoc pqTop;
    public LeafCollector getLeafCollector(LeafReaderContext context) throws IOException {
	 final int docBase = context.docBase;
	 return new ScorerLeafCollector() {

		@Override
		public void collect(int doc) throws IOException {
		// 这样可以让score产生随机性，理论上来说 可以打乱结果
			float score = scorer.score() + (doc % mod) * multi;
		// This collector cannot handle these scores:
    		assert score != Float.NEGATIVE_INFINITY;
			assert !Float.isNaN(score);
			totalHits++;
			if (score <= pqTop.score) {
				return;
			}
			pqTop.doc = doc + docBase;
			pqTop.score = score;
			pqTop = pq.updateTop();
		}
	};
  }
}
```
以上在collect()方法中，覆写了score的得分，此处随机因子是mod，每次更具docid取模，模的大小可以由客户端发送到服务端来，然后再乘上一个权重因子`multi`,覆写完成，测试运行首页记录的次序就会呈现随机性。
详细代码请查看[ShuffleQParserPlugin.java](https://github.com/qlangtech/tis-solr/blob/master/tis-solrcore-extend/src/main/java/com/qlangtech/tis/solrextend/queryparse/ShuffleQParserPlugin.java)

#### SolrConfig配置

#### 客户端查询示例

## 总结

RankQuery在Solr中是属于比较底层的，Solr以它作为桥梁扩展底层Lucene的Collector接口，在很多业务场景下会用到，此文说到的使用场景只是众多场景之一，起到了抛砖引玉的作用，更多的使用场景期待大家去发现。







 
