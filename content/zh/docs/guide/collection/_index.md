---
title: 索引管理
date: 2020-07-26
type: book
weight : 30
---

## 创建索引实例

|||
|--|--|
| <div style="width:150px"> 打开链接`/base/appadd`,填写新建索引的基本信息,点击`下一步` </div> |{{< figure src="add-collection-step-1.png" >}}|
|系统通过解析第一步中选择数据流中元数据信息，获得schema中的列集合，可以设置各列的属性，如字段类型、是否可查询、可排序等，如在`小白模式`下无法实现的配置配置，可切换到`专家模式`下进行配置 | {{< figure src="add-collection-step-2.png" >}}{{< figure src="add-collection-step-2-expert.png" >}}|
| 设置 `Shard`,`Replica` 拓扑结构，选择使用服务器节点，完成之后，点击**提交确认**按钮，进入信息确认页面 | {{< figure src="add-collection-step-3.png" >}} |
| 对前几步提交的信息进行确认，以免有误，如需修改可以回退到上几步就行修改<br> 点击**创建索引**按钮，执行索引创建流程，创建成功之后会自动跳转到索引实例维护页面 |{{< figure src="add-collection-step-4.png" >}}|

## 索引实例维护

|||
|--|--|
| <div style="width:200px"> 创建成功进入索引维护页面，通过左上角下拉框可以切换索引实例</div>  | {{< figure src="manage-collection.png" >}} |
| 点击`全量构建`Tab，点击**触发构建**按钮，开始执行数据流处理流程，并且最终将数据导入到Solr中 |{{< figure src="manage-collection-start-build.png" >}}  |
| 点击`查询`tab 切换到查询页面，点击**查询**按钮对已经导入到引擎中的数据进行查询| {{< figure src="manage-collection-query.png" >}}  |
