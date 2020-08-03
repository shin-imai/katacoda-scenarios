# ConfigMap

ConfigMap is one of the kubernetes resources and you can use it to store text data like key/value or configurations for applications. 

Let's see a few examples.

```yaml
apiVersion: v1
data:
  LOCATION: london
  WEATHER: rain
kind: ConfigMap
metadata:
  creationTimestamp: null
  name: sample-cm
```

The above example is created by the below command.

`kubectl create configmap sample-cm --from-literal=WEATHER=rain --from-literal=LOCATION=london`{{execute}}

`kubectl get cm`{{execute}} to check if the ConfigMap is created. 

ConfigMap contains apiVersion, kind and metadata same as the other resources, and data stores keys and values. 

You can also create `ConfigMap` from a file.

`kubectl create configmap sample-file-cm --from-file=assets/sample.html`{{execute}}

You can take a look at the `sample-file-cm` you just created.

`kubectl get configmap sample-file-cm -o yaml`{{execute}}

Next step will show you how to use ConfigMap.



