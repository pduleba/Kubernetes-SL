# Kubernetes - Architecture

## Overview
<kbd><img src="/architecture/img/overview-1.png"></kbd>

<kbd><img src="/architecture/img/overview-2.png"></kbd>

<kbd><img src="/architecture/img/overview-3.png"></kbd>

## Master
<kbd>
  <img src="/architecture/img/master.png">
</kbd>

* **apiserver**
  * entry point
  * provides REST API + JSON
* **Cluster store**
  * persistent store
  * config and state
  * uses **etcd** - open source key-value store (NoSQL DB)
* **controller**
  * watches for changes
  *  maintain _current_ state of cluster and _desired_ state 
  * i.e. node/endpoint/namespace controllers
* **kube-scheduler**
  * watches apiserver for new pods
  * assigns work to nodes 

#### Desired & Declarative model/state 
YAML or JSON file is going to read manifest file which is describing desired state and 
k8s tries to reflect as actual state is his reality.

<kbd><img src="/architecture/img/desired-and-declarative-model.png"></kbd>

## Nodes
<kbd><img src="/architecture/img/nodes.png"></kbd>

* **kublet**
  * main kubernetes agent on node
  * registers nodes with cluster
  * watches _apiserver_
  * instances _pods_
  * reports state to _master_ (on port **10255**)
* **Container Engine**
  * does container management
    * i.e. starting/stopping containers 
  * Pluggable :: usually **Docker**
* **kube-proxy**
  * kubernetes networking
    * pod IP addresses
  * load-balancing via **service**
    * containers in pod share a **single IP**

## Pods
<kbd><img src="/architecture/img/pods.png"></kbd>

* **network stack** - single network inside (**single IP**)
* **network stack** - single kernel inside 
* can run **multiple** containers
* pod lives inside **single node**
* created/duplicated/replicated via
  * **master**
    * <kbd><img src="/architecture/img/replication-via-master.png"></kbd>
  * **deployment** (_replication controller_)
    * <kbd><img src="/architecture/img/replication-via-deployment.png"></kbd>
* atomic & moral (start, live, die)
    <kbd><img src="/architecture/img/pod-lifecycle.png"></kbd>

## Services
* pod wrapper with single **IP** (for load balancing - like AWS ELB)
    <kbd><img src="/architecture/img/service-networking.png"></kbd>
* pods belongs to service via **labels**
    <kbd><img src="/architecture/img/load-balancing-via-labels.png"></kbd>
* **load balancing**
  * sends traffic to healthy pods **only**
  * uses TCP
  * **random** load balancing (round robbin supported)
  * can points to something __outside__ cluster

## Deployments
<kbd><img src="/architecture/img/deployments.png"></kbd>
* is for **rolling updates** and **rollbacks**
* describes deployment (i.e. image, scaling procedure) via file in YAML or JSON format
    <kbd><img src="/architecture/img/deployments-file-overview.png"></kbd>
* deployed via __apiserver__ on **master**
* provides **visioning** 

## ReplicaSet
* Describes replication
* It is replication controller
* Part of **deployment**

---

###### _Images comes from [Getting Started with Kubernetes](https://app.pluralsight.com/player?course=getting-started-kubernetes) course._
