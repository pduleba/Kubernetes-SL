# Kubernetes - Exercise 02 - Rolling Update and Rollback

## Introduction
Demonstrates how to do 

* rolling update
  * update `app-db` docker image 
  * increase from `1` to `5` containers 
* rolling rollback
  * downgrade `app-db` docker image 
  * decrease from `5` to `1` container 

in Kubernetes world. 

## How to run

#### prerequisites (one of)
* see [exercise-01](/exercise-01) for details

#### Update
* `exec-k8s-run-create.bat` - deploy V1
* `exec-k8s-run-update.bat` - deploy V2

#### Rollback
* once __update__ complete
* `exec-k8s-run-rollback.bat` - perform rollback

#### Cleanup
* `exec-k8s-run-destroy.bat` - clean up

#### Update/Rollback review
* `exec-k8s-check-deployment.bat` - check `app-db` deployment
* `exec-k8s-check-deployment-status.bat` - check `app-db` deployment status
* `exec-k8s-check-deployment-history.bat` - check `app-db` deployment history
* `exec-k8s-check-pod.bat` - check `app-db` pod
