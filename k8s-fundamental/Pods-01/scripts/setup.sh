#!/bin/bash

for i in $(ls /root/assets);do cat /root/assets/$i > /root/samples/$i;done