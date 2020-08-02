# Use ConfigMap as volumes

Now, you know how to use ConfigMap to insert environments. There is another way to utilize ConfigMap with a Pod. 

ConfigMap can be used as volumes. Here is the example of a volume with ConfigMap in a pod. You shoud still have `sample-file-cm` created at the step1. Let's use it to create an example pod.

`kubectl apply -f assets/volume-cm.po.yaml`{{execute}}

This is an example of volume definition in the pod.

```yaml
~~ommited~~
  volumes:
  - name: contents
    configMap:
      name: sample-file-cm
```

Check if the ConfigMap is mounted as a volume. 

`curl http://$(kubectl get po -o custom-columns=IP:.status.podIP | tail -1)/sample.html`{{execute}}

There are more options about ConfigMap as a volume. Please see `kubectl explain pod.spec.volumes.configMap` for more detail.