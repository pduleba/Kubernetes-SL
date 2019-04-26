kubectl delete deployment app-rest-api app-db
kubectl delete service app-rest-api app-db
kubectl delete secret app-db
kubectl delete persistentvolumeclaim app-db-volumeclaim