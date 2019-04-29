# Kubernetes - Exercise 04 - NotePort and Ingress

## Introduction
Demonstrates how to use
* `Ingress` - allows to define load balancing using path marching
* `NodePort` - opens k8s nodes/pods for external access

## How to run

#### Usage
* `exec-k8s-run.bat` - create `web-v1` & `web-v2`
* `exec-k8s-destroy.bat` - deploy created resources

###### verify 
* once running 
  * `kubectl get pods` - check if pods are Running 
* `exec-k8s-get-ip.bat` - retrieve Ingress External IP 
  * hit `http://IP_ADDRESS/v1/` to be load balanced to `web-v1`
  * hit `http://IP_ADDRESS/v2/` to be load balanced to `web-v2`