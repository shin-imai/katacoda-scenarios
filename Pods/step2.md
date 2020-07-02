## Multiple Containers

Pods can contain multiple containers. 

Open the sample in the editor `assets/multi-container.po.yaml`{{open}}

You should be able to see more containers defined like below.

```yaml
  containers:
  - name: nginx-one
    image: nginx:latest
  - name: nginx-two
    image: nginx:latest
```

Create the pod with the below command.
`kubectl create -f assets/multi-container.po.yaml`{{execute}}

And see if the pod is running. 

`kubectl get pods`{{execute}}

Actually this example fails to start because 2 containers in a single pod cann't listen on the same port. Containers in a pod have the same network namespace. 

This example pod contains 2 nginx containers and both of the nginx container listen on port 80 therefore either `nginx-one` or `nginx-two` fails to start with "Address already in use" error.

Let's see which contaier failed to start. 

`kubectl describe pods secondpod`{{execute}}

You should be able to see 2 containers and `State` of each container. If you find out which container failed to start, let's see the logs. 

`kubectl logs <pod name>` to see logs and if there are more than 1 container in a pod, you need to specify which container logs you want to see with `-c <container name>` like this.

`kubectl logs secondpod -c nginx-two`{{execute}}

You should be able to see errors.

## Fix the issue

Containers in a pod cannot be listen on the same port. Change the image to busybox and start it again. 

Edit `/root/assets/multi-container.po.yaml`{{open}} in the top right pane. 

```yaml
  containers:
  - name: nginx-one
    image: nginx:latest
  - name: busybox       # <- change
    image: busybox      # <- change
    tty: true           # <- Add: busybox image requires tty
```

