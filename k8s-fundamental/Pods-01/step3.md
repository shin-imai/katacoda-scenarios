# Environment variables

You can set environment variables for containers in a pod. 

Apply the yaml by `kubectl apply -f assets/env.po.yaml`{{execute}}. 

And when it's ready, find out whether the environment variables are applied.

`kubectl exec firstpod -- env`{{execute}}

Can you see LOCATION and VERSION? 

