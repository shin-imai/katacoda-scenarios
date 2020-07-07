## Multiple Containers

Pods can contain multiple containers. 

Open the sample in the editor `assets/multi-containers.po.yaml`{{open}}

You should be able to see more containers defined like below.

```yaml
  containers:
  - name: nginx-one
    image: nginx:latest
  - name: nginx-two
    image: nginx:latest
```

Create the pod with the below command.
`kubectl create -f assets/multi-containers.po.yaml`{{execute}}

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

Edit `assets/multi-containers.po.yaml`{{open}} in the top right pane. 

```yaml
  containers:
  - name: nginx-one
    image: nginx:latest
  - name: busybox       # <- change
    image: busybox      # <- change
    tty: true           # <- Add: busybox image requires tty
```

Now, you should be able to deploy the pod without an error. However, you can't overwrite the existing pod so you need to delete the pod and create it again. `replace` with `--force` option will delete and create a pot with one command. 

`kubectl replace -f assets/multi-containers.po.yaml --force`{{execute}}

Check if the pod is running.

`kubectl get pods`{{execute}}

Install `ip` command on `nginx-one` container to see the containers have the same network interfaces since they use the same network namespace.

`kubectl exec secondpod -c nginx-one -- bash -c "apt-get update; apt-get install -y iproute2"`{{execute}}

Run `ip a` on nginx-one container.

`kubectl exec secondpod -c nginx-one -- ip a`{{execute}}

run `ip a` on busybox container.

`kubectl exec secondpod -c busybox -- ip a`{{execute}}

You can see the network interfaces are the same between containers in a pod. 