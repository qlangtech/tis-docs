---
title: 基于Nested Document的RealtimeGet实现
date: 2020-10-18
type: blog
#https://www.iteye.com/blog/mozhenghua-2393368
---
## 背景
 原生的solr中有/get 的request handler实现（org.apache.solr.handler.component.RealTimeGetComponent），实现原理是，先到tlog的内存中去找记录，找不到再到indexSearch中去找。这样当用户利用solrj客户端提交到solr服务端之后，可以不需要等待服务端softcommit，就能立即从服务端中取得最新提交的记录信息。

 这样可以避免数据脏写的问题，但是，collection的索引结构使用Nested Document，客户端提交一个Nested Document 记录之后，再使用solrj调用“getById”方法，只能返回parent document了。因为这个原因，在生产环境中，对同一条记录的两次业务操作时间间隔比soft commit的时间周期短，就会产生数据脏写的问题。
 
## 办法
 要解决这个问题，需要扩展solr的SearchComponent，实现通过Id，可以将文档的子文档（child docuemnt）全部加载。

### 扩展SearchComponent
``` java  
public class NestRealtimeGetComponet extends SearchComponent {  
  
    public static final String COMPONENT_NAME = "nestget";  
    @Override  
    public void prepare(ResponseBuilder rb) throws IOException {  
  
    SolrQueryRequest req = rb.req;  
    SolrQueryResponse rsp = rb.rsp;  
    SolrParams params = req.getParams();  
    if (!params.getBool(COMPONENT_NAME, false)) {  
        return;  
    }  
    // Set field flags  
    ReturnFields returnFields = new SolrReturnFields(rb.req);  
    rb.rsp.setReturnFields(returnFields);  
    }  
    @Override  
    public void process(ResponseBuilder rb) throws IOException {  
    SolrQueryRequest req = rb.req;  
    SolrQueryResponse rsp = rb.rsp;  
    SolrParams params = req.getParams();  
    if (!params.getBool(COMPONENT_NAME, false)) {  
        return;  
    }  
    String id = params.get("id");  
    SchemaField idField = req.getSchema().getUniqueKeyField();  
    FieldType fieldType = idField.getType();  
  
    BytesRefBuilder idBytes = new BytesRefBuilder();  
    fieldType.readableToIndexed(id, idBytes);  
    SolrCore core = req.getCore();  
  
    SolrInputDocument doc = RealTimeGetComponent.getInputDocumentFromTlog(  
        core, idBytes.get());  
    SolrDocumentList docList = new SolrDocumentList();  
    if (doc != null) {  
        docList.add(convertDocument(doc));  
        docList.setNumFound(1);  
    } else {  
        RefCounted<SolrIndexSearcher> searchHolder = req.getCore()  
            .getSearcher();  
        SolrIndexSearcher searcher = searchHolder.get();  
  
        // 取得transfer  
        DocTransformer transformer = rsp.getReturnFields().getTransformer();  
        if (transformer != null) {  
        ResultContext context = new BasicResultContext(null,  
            rsp.getReturnFields(), null, null, req);  
        transformer.setContext(context);  
        }  
  
        try {  
        int docid = -1;  
        long segAndId = searcher.lookupId(idBytes.get());  
        if (segAndId >= 0) {  
            int segid = (int) segAndId;  
            LeafReaderContext ctx = searcher.getTopReaderContext()  
                .leaves().get((int) (segAndId >> 32));  
            docid = segid + ctx.docBase;  
        }  
  
        if (docid >= 0) {  
            Document luceneDocument = searcher.doc(docid, rsp  
                .getReturnFields().getLuceneFieldNames());  
            SolrDocument d = toSolrDoc(luceneDocument,  
                core.getLatestSchema());  
            searcher.decorateDocValueFields(d, docid,  
                searcher.getNonStoredDVs(true));  
            if (transformer != null) {  
            transformer.transform(d, docid, 0);  
            }  
              
            docList.add(d);  
            docList.setNumFound(1);  
        }  
        } finally {  
        searchHolder.decref();  
        }  
    }  
  
    rb.rsp.addResponse(docList);  
    }  
  
    private static SolrDocument toSolrDoc(Document doc, IndexSchema schema) {  
    SolrDocument out = new SolrDocument();  
    for (IndexableField f : doc.getFields()) {  
        // Make sure multivalued fields are represented as lists  
        Object existing = out.get(f.name());  
        if (existing == null) {  
        SchemaField sf = schema.getFieldOrNull(f.name());  
  
        // don't return copyField targets  
        if (sf != null && schema.isCopyFieldTarget(sf))  
            continue;  
  
        if (sf != null && sf.multiValued()) {  
            List<Object> vals = new ArrayList<>();  
            vals.add(f);  
            out.setField(f.name(), vals);  
        } else {  
            out.setField(f.name(), f);  
        }  
        } else {  
        out.addField(f.name(), f);  
        }  
    }  
    return out;  
    }  
  
    protected SolrDocument convertDocument(SolrInputDocument doc) {  
    SolrDocument sdoc = new SolrDocument();  
    for (String k : doc.getFieldNames()) {  
        sdoc.setField(k, doc.getFieldValue(k));  
    }  
  
    if (doc.hasChildDocuments()) {  
        for (SolrInputDocument s : doc.getChildDocuments()) {  
        sdoc.addChildDocument(convertDocument(s));  
        }  
    }  
    return sdoc;  
    }  
}  
```

### solrconfig.xml中的配置：

``` xml
 <searchComponent name="nestget"   
     class="com.qlangtech.tis.solrextend.handler.component.NestRealtimeGetComponet" />  
requestHandler name="/select" class="solr.SearchHandler">  
    <lst name="defaults">  
      <str name="echoParams">explicit</str>  
      <int name="rows">10</int>  
      <str name="df">text</str>  
    </lst>  
    <arr name="last-components">  
      <str>nestget</str>     
    </arr>  
  </requestHandler>  
```  

### 客户端查询示例:

``` java

SolrQuery query = new SolrQuery();  
query.setParam("nestget", true);  
query.set("id", pid);  
query.setQuery("id:0");  
query.setFields("*"
, "[child parentFilter=type:p  childFilter=\"{!terms f=id}" + cid + "\" limit=100]");  
      
QueryResponse r = this.client.query(collection, pid, query);  
      
SolrDocumentList doclist = r.getResults();  
for (SolrDocument d : doclist) {  
   System.out.println(d.get("id"));  
   System.out.println();  
   if (d.getChildDocumentCount() > 0) {  
   for (SolrDocument c : d.getChildDocuments()) {  
      StringBuffer f = new StringBuffer();  
      for (String key : c.getFieldNames()) {  
      f.append(key).append(":").append(c.getFirstValue(key));  
    }  
    System.out.println(f.toString());  
    }  
    }  
 }  
```

  
