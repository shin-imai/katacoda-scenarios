#!/bin/bash

(kubectl get po |grep firstpod |grep Running) 2>/dev/null && echo "done"