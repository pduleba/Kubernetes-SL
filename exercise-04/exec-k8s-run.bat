kubectl apply -f ./k8s/web-v1-deployment.yaml
kubectl apply -f ./k8s/web-v2-deployment.yaml
kubectl apply -f ./k8s/web-v1-service.yaml
kubectl apply -f ./k8s/web-v2-service.yaml
kubectl apply -f ./k8s/web-ingress.yaml
