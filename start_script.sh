#!/bin/bash

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.22.0 TARGET_ARCH=x86_64 sh -
cd istio-1.22.0
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
kubectl label namespace default istio-injection=enabled
cd ..

docker build -t app ./app -f ./app/Dockerfile.app
docker build -t time_request app/ -f ./app/Dockerfile.client

docker tag app valerizab/app
docker tag time_request valerizab/time_request

docker push valerizab/app
docker push valerizab/time_request

kubectl create -f app/deploy/app-service.yaml
kubectl create -f app/deploy/app-deployment.yaml
kubectl create -f app/deploy/script-deployment.yaml

kubectl create -f app/deploy/gateway.yaml
kubectl create -f app/deploy/virtual-service.yaml
kubectl create -f app/deploy/external-service.yaml

minikube tunnel
