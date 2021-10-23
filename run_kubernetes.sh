#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="sirvanci/housing-prediction-app:$1"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run housing-prediction-app\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=housing-prediction-app



# Step 3:
# List kubernetes pods
kubectl get po -A

# Step 4:
# Forward the container port to a host
sleep 60
kubectl port-forward housing-prediction-app 8000:80

