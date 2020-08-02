# Volumes

A pod can contain volumes. Volumes have the same lifecycle as pods so when pods are deleted, volumes in pods will be deleted, too.

Here is an example.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: with-vol
spec:
  containers:
  - name: busybox
    image: busybox
    tty: true
  - name: nginx
    image: nginx
  volumes:
  - name: contents
    emptyDir: {}      <- You can omit this line.
```

You can add more than 1 volumes in a pod.

```yaml
  volumes:
  - name: contents
  - name: data
```