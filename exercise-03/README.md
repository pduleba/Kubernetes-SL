# Kubernetes - Exercise 03 - Secrets and persistent disks

## Introduction
Demonstrates how to use
* secret to store admin password for `app-db` inside Kubernetes via
  * `kubectl create secret`
* persistent disk for `app-db`
  * PersistentVolumeClaim

## How to run

#### prerequisites (one of)
* see [exercise-01](/exercise-01) for details

#### Usage
* `exec-k8s-run.bat` - create app in k8s
* `exec-k8s-destroy.bat` - deploy app in k8s

###### verify 
* once running 
* check `app-db` active pods via 
  * `kubectl get pods -o wide -l app=app-db`
* kill `app-db` active pods
  * `kubectl delete pod -l app=app-db`
* check again `app-db` active pods via 
  * `kubectl get pods -o wide -l app=app-db`
