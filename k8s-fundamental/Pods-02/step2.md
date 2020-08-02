# Use ConfigMap in Pod

`ConfigMap` can be used to insert environment variables into Pods. 

You can test it with the ConfigMap you created in the previous step. 
```yaml
~~omitted~~
spec:
  containers:
  - name: nginx
    image: nginx:latest
    env:
    - name: WHERE
      valueFrom:
        configMapKeyRef:
          name: sample-cm
          key: LOCATION
```

This example shows how to get a value from `sample-cm` ConfigMap with key `LOCATION` and insert the value into environment variable called `WHERE`. 

Create a pod with the sample ConfigMap. 

`kubectl apply -f assets/env-cm.po.yaml`{{execute}}

And when the pod is running, find out whether the environment variables are applied.

`kubectl exec firstcm-pod -- env`{{execute}}

Can you see WHERE and WEATHER?
