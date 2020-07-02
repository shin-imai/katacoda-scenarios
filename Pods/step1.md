This senario shows the simplest pod. Other senarios will explain in more advanced and practical pods. 

## Pod

A Pod (as in a pod of whales or pea pod) is a group of one or more containers (such as Docker containers), with shared storage/network, and a specification for how to run the containers.

A Pod is the basic execution unit of a Kubernetes application–the smallest and simplest unit in the Kubernetes object model that you create or deploy. A Pod represents processes running on your Cluster.

## Manifest

Let's walk through with pod's manifest. 

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: firstpod
spec:
  containers:
  - name: nginx
    image: nginx:latest
```


There are 4 top objects. The first 3 are almost identical among all resources, which are apiVersion、kind、metadata. The forth object, which is spec, has unique parameters for each resource.

- apiVersion
  
  All resource has apiVersion and version indicates the maturity. 

- kind

  Resource type

- metadata

  You can set resource name, labels and other metadata here like below example.

```yaml
metadata:
  annotations:
    description: "This is a test pod"
  labels:
    app: nginx
    version: v1
    environment: prod
```

- spec

  The `spec` is configuration of the resource. 

Apply the manifest with below command

`kubectl create -f assets/simple.po.yaml`{{execute}}

Check if the pod is running with `kubectl get pods`{{execute}}

If you can confirm the pod is running, go to next step.