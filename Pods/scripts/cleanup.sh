#!/bin/bash

(kubectl get po --no-headers | awk '{print $1}' | xargs kubectl delete po --force --grace-period=0) &>/dev/null