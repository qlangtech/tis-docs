+++
title = "TIS安装"
date = 2019-02-28T14:36:27+08:00
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
## 前言

 由于TIS在分布式环境中有多个组件(Console、Assemble、Taskcenter、SolrCore)需要安装。为了简化安装过程，使用了Ansible进行组件安装，执行Ansible脚本前，先初始化配置文件，最后一键触发Ansible Playbook就能快速完成安装过程。

## 环境准备

### Ansible安装

Ansible提供了强大的集配置,部署,自动化于一身的playbook [http://www.ansible.com.cn](http://www.ansible.com.cn)
linux服务器可以使用以下命令来进行安装:

```shell
 yum install ansible
```
当前测试用的服务器上使用的版本为 **2.6.8**
### TIS Ansible安装脚本获取

Ansible脚本存放在github仓库中 [https://github.com/qlangtech/tis-ansible](https://github.com/qlangtech/tis-ansible)

### 服务器准备

## 安装步骤

### 安装Mysql数据库

### 配置文件配置

### 
