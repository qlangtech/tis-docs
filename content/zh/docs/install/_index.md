---
title: "TIS安装"
linktitle: TIS安装
icon_pack: fas
icon: wrench
date: 2020-06-18
type: book
weight: 10
---

## 前言

 由于TIS在分布式环境中有多个组件(Console、Assemble、Taskcenter、SolrCore)需要安装。为了简化安装过程，使用了Ansible进行组件安装，执行Ansible脚本前，先初始化配置文件，最后一键触发Ansible Playbook就能快速完成安装过程。

## 环境准备

1. [Ansible安装]({{< relref "./requirement.md#ansible安装" >}})
2. [TIS Ansible安装脚本获取]({{< relref "./requirement.md#tis-ansible安装脚本获取" >}})
3. [服务器节点准备]({{< relref "./requirement.md#服务器节点准备" >}})
4. [Ansible堡垒节点与服务节点免密码登录]({{< relref "./requirement.md#Ansible堡垒节点与服务节点免密码登录" >}} )


## 安装步骤

1. [Mysql数据库安装]({{< relref "./install-steps.md#mysql数据库服务安装" >}})
2. [初始化配置文件]({{< relref "./install-steps.md#初始化配置文件" >}})
3. [开始安装]({{< relref "./install-steps.md#开始安装" >}})

 
