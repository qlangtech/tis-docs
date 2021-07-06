---
title: TIS自定义插件开发说明
date:   2021-04-09
type:   book
weight : 1
---
## 说明

## 标准插件呈现外观

## 如何创建插件
1. 需要创建一个maven工程pom.xml中 属性**<packaging>tpi</packaging>**标注是一个标准TIS插件

## Plugin表单扩展字段配置说明

假设有插件**DataxMySQLReader**(完整类路径为:com.qlangtech.tis.plugin.datax.DataxMySQLReader) 内有两个属性`dbName`和`splitPk`

```java
public class DataxMySQLReader extends DataxReader {
    @FormField(ordinal = 0, type = FormFieldType.ENUM, validate = {Validator.require})
    public String dbName;

    @FormField(ordinal = 1, type = FormFieldType.ENUM, validate = {Validator.require, Validator.identity})
    public boolean splitPk;
}
```

```json
{
"myProp": {
    "label": "数据库名",
    "placeholder": "a=123&b=456",
    "helpUrl": "http://tis.pub/docs/guide/datasource/multi-ds-rule",
    "dftVal": false,
    "rows": 5,
    "disable": true,
    "enum": [
      {
        "val": true,
        "label": "是"
      },
      {
        "val": false,
        "label": "否"
      }
    ],
    "creator": {
      "routerLink": "/base/departmentlist",
      "label": "部门管理"
    }
  }
}
```

|  Key                            |      说明             |  例子  | 必须|
|----------                       |:-------------         |:------|:------:|
|label| <div style="width: 250pt"> @FormField描述的字段对应的说明性描述</div>| "label": "数据库名"|no|
|placeholder| 表单提示内容|"placeholder": "a=123&b=456"|no|
|helpUrl|<div style="width: 250pt">字段对应的帮助说明文档链接</div>|"helpUrl": "http://tis.pub/docs/guide/datasource/multi-ds-rule"|no|
|dftVal|字段对应的默认值，字段类型根据表单控件类型而定</div>|"dftVal": false|no|
|rows|<div style="width: 250pt">@FormField对应的type类型为`TEXTAREA`可以使用rows来控制textare控件在表单中默认行数</div>|"rows": 5|no|
|enum|<div style="width: 250pt">@FormField对应的type类型为`ENUM`可以使用enum来描述输入的枚举值，类型是一个array的元祖结构，或通过groovy脚本取得类型为`com.qlangtech.tis.manage.common.Option`的列表对象</div>|||
|creator||||
|disable|使得该属性在表单中隐去|||





