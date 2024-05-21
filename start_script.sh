#!/bin/bash

docker build -t app ./app -f ./app/Dockerfile.app
docker build -t time_request app/ -f ./app/Dockerfile.client

docker tag app valerizab/app
docker tag time_request valerizab/time_request

docker push valerizab/app
docker push valerizab/time_request

kubectl create -f app/deploy/app-service.yaml
kubectl create -f app/deploy/app-deployment.yaml
kubectl create -f app/deploy/script-deployment.yaml

minikube tunnel
