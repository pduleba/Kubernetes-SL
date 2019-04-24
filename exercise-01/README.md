# Kubernetes

## Introduction
Kubernetes self learning (continuation of Docker-SL :: Exercise 05)

### K8s architecture overview
                
Kubernetes  ->  Master
                Nodes   ->  Pods    ->  Docker containers

More about architecture can be found [here](/architecture)

## Commands

#### Basic
* `kubectl get all`- see status of all elements on k8s
* `kubectl get nodes` - see status of `nodes` elements on k8s
* `kubectl get pods` - see status of `pods` elements on k8s
* `kubectl get deployments` - see status of `deployments` elements on k8s
* `kubectl get services` - see status of `services` elements on k8s
* `kubectl get rs` - see status of `replicaSets` elements on k8s

#### Debug
* `kubectl describe TYPES|TYPE TYPE_NAME` - Check details 
* * for `TYPES` it is possible to use i.e. `pods`, `nodes`
* * for `TYPE TYPE_NAME` it is possible to use i.e. `pod POD_NAME`, `node NODE_NAME`
* `kubectl logs POD_NAME -o wide` - Check logs of given `POD_NAME`
* `kubectl exec -it -c CONTAINER_NAME POD_NAME -- /bin/bash` - Connect to `CONTAINER_NAME` in `POD_NAME`

## How to run

#### prerequisites (one of)
* build images images `app-rest-api` and `app-db` locally 
* perform `docker login` and deploy images `app-rest-api` and `app-db`

#### Run via `Kompose` toolkit
* `exec-k8s-run.bat` - apply `k8s` folder configuration into Kubernetes 
* * `kubectl get pods` - check if both pods are in `Running` state
* `exec-k8s-port-forward.bat POD_NAME` - enable port forwarding for `app-rest-api` pod
* `exec-k8s-destroy.bat` - delete deployments and services (`app-rest-api` and `app-db`)

#### Run manually
* `kubectl run app-db --image=app-mysql:latest --image-pull-policy=Never --env="MYSQL_ROOT_PASSWORD=password"` - Run MySQL
* `kubectl run app-rest-api --image=app-rest-api:latest --image-pull-policy=Never` - Run Spring Boot app
* * `kubectl get pods` - check if both pods are in `Running` state
* `kubectl port-forward POD_NAME 8888:8888` - Enable port forward for pod `POD_NAME`
* `kubectl delete deployment app-db app-rest-api` - Delete deployments
* `kubectl delete service app-db app-rest-api` - Delete deployments


## Extra
* `exec-convert.bat` - convert `docker-compose.yml` into Kubernetes deployment (YAML files in `k8s`)
* * **WARNING !!!** `kompose convert` generates no `imagePullPolicy` which is #BUG imho (manual fix required)
* * See [Kompose documentation](http://kompose.io/) for details
