#!/bin/bash

docker build -t app:v0.1 app/ -f ./app/Dockerfile.app
docker build -t time_request:v0.1 app/ -f ./app/Dockerfile.client

kubectl create -f app/deploy/app-service.yaml
kubectl create -f app/deploy/app-deployment.yaml
kubectl create -f app/deploy/cronjob.yaml

minikube tunnel
