# Pods

A Pod (as in a pod of whales or pea pod) is a group of one or more containers (such as Docker containers), with shared storage/network, and a specification for how to run the containers.

A Pod is the basic execution unit of a Kubernetes application–the smallest and simplest unit in the Kubernetes object model that you create or deploy. A Pod represents processes running on your Cluster.

First, `git clone https://github.com/shin-imai/katacoda-resources.git`{{execute}} to clone resources we are going to use for this senario.

# Simple manifest

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


