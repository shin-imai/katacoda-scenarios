# Environment variables & ConfigMap

You can set environment variables for containers in a pod. 

Apply the yaml by `kubectl apply -f assets/env.po.yaml`{{execute}}. 

And when it's ready, find out whether the environment variables are applied.

`kubectl exec firstpod -- env`{{execute}}

Can you see LOCATION and VERSION? 

Another way to add environment varialbes is to use `ConfigMap`.

ConfigMap is one of the kubernetes resources and you can use it to store text data like key/value or configurations for applications. 

Here is a sample. `cat assets/firstcm.cm.yaml`{{execute}}.

Apply the ConfigMap `kubectl apply -f assets/firstcm.cm.yaml`{{execute}}, and then check if it is created `kubectl get configmap firstcm`{{execute}}.

Now, use this ConfigMap to define environment values in a pod. 

`kubectl apply -f env-cm.po.yaml`