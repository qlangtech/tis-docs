---
title: 初始化K8S环境
date: 2021-07-31
type: blog
---
## 安装

### 公有云
如在公有云中，用户可以使用基于云平台的容器引擎服务，国内知名云服务厂商有：

1. 阿里云 [https://www.aliyun.com/product/eci](https://www.aliyun.com/product/eci)

2. 腾讯云 [https://cloud.tencent.com/product/tke?from=14588](https://cloud.tencent.com/product/tke?from=14588)

3. 百度云 [https://cloud.baidu.com/doc/CCE/index.html](https://cloud.baidu.com/doc/CCE/index.html)

4. 华为云 [https://www.huaweicloud.com/product/cce.html](https://www.huaweicloud.com/product/cce.html)

5. 青云 [https://www.qingcloud.com/products/kubernetes/](https://www.qingcloud.com/products/kubernetes/)

### 私有云

1. 生产环境

   在私有云环境中，用户可以构建自己的K8S容器引擎服务，安装说明请参考[生产环境中安装K8S](https://kubernetes.io/docs/setup/production-environment/)

2. 日常环境
   
   在日常测试环境中，用户只是以学习或者想最小安装K8S，可以安装单节点版本的K8S环境minikube[minikube安装说明](https://minikube.sigs.k8s.io/docs/start/)

## TIS中配置

TIS中有较多组件是运行在K8S容器中的，为了使这些组件能够正常工作，首先，需要配置连接K8S服务端的客户端配置，添加步骤如下：

1. 准备kubeconfig配置文件

    为了通过CS模式连接K8S服务端可以先通过kubectl config命令生成服务端连接的证书配置文件，config命令请查看[kubectl-commands#config](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#config)
  
    对应服务端本地配置文件为`~/.kube/config`,配置文件内容示例：
    ```yaml
    apiVersion: v1
    clusters:
    - cluster:
        certificate-authority-data: 基于base64的内容
        server: https://192.168.28.201:8443
      name: minikube
    contexts:
    - context:
        cluster: minikube
        user: minikube
      name: minikube
    current-context: minikube
    kind: Config
    preferences: {}
    users:
    - name: minikube
      user:
        client-certificate-data: 基于base64的内容
        client-key-data: 基于base64的内容
    ```

2. 在TIS中添加`k8s`配置
 
   |||
   |--|--|
   | <div style="width:260px">打开[http://127.0.0.1:8080/base/basecfg](http://127.0.0.1:8080/base/basecfg),点击左下方下拉按钮选择`k8s`</div> | {{< figure src="add-k8s.png"  >}}|
   |<div style="width:260px">填写对应的表单字段，将上步骤中准备的**准备kubeconfig配置文件**的文件内容，拷贝到`Yaml配置内容`配置项中</div>|{{< figure src="add-k8s-form.png"  >}}|
   |<div style="width:260px">填写表单，对表单内容进行校验</div>| {{< figure src="verify-form.png"  >}}|
   |确认无误**保存**|{{< figure src="save-form.png"  >}}|
   

