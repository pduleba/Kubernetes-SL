kubectl create secret generic app-db --from-literal=password-secret=password
kubectl apply -f ./k8s/app-db-volumeclaim.yaml
kubectl apply -f ./k8s/app-db-deployment.yaml
kubectl apply -f ./k8s/app-db-service.yaml
kubectl apply -f ./k8s/app-rest-api-deployment.yaml
kubectl apply -f ./k8s/app-rest-api-service.yaml