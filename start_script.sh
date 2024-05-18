#!/bin/bash

# установка istio
curl -L https://istio.io/downloadIstio | sh -
# добавляем клиент в istioctl в PATH
export PATH="$PATH:$PWD/istio-1.21.2/bin"
# используем демонстрационный профиль конфигурации
istioctl install -y --set profile=demo --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
# метка пространства имен
kubectl label namespace default istio-injection=enabled

docker build -t app:v0.1 app/ -f ./app/Dockerfile.app
docker build -t time_request:v0.1 app/ -f ./app/Dockerfile.client

kubectl create -f app/deploy/app-service.yaml
kubectl create -f app/deploy/app-deployment.yaml
kubectl create -f app/deploy/cronjob.yaml

kubectl create -f app/deploy/gateway.yaml
kubectl create -f app/deploy/virtualservice.yaml
kubectl create -f app/deploy/external-service.yaml

minikube tunnel
