# Overview

This is a small Node.js app to exemplify CI, CD and reverse proxy functionality using GitHub Actions, Docker and Kubernetes (as part of Udacity Cloud Developer Nanodegree Program).

# Tech/Tool Stack

* Node.js
* JavaScript / TypeScript
* Docker
* GitHub
* GitHub Actions
* Kubernetes on AWS (EKS)

# Use Cases

* writing Dockerfiles for building a NodeJS image and a nginx reverse proxy image
* building a Docker image inside the GitHub Actions pipeline
* pushing a Docker image to Docker Hub from inside the GitHub Actions pipeline
* writing deployment and service yml files for k8s
* creating a cluster using AWS EKS and a node group
* deploying the containers (NodeJS app and reverse proxy) inside pods in a EKS cluster
* testing the reverse proxy

# Nerdy stuff

Get the identity of the caller making the request (CLI):
```
aws sts get-caller-identity
```
Update kube config `/home/vlad/.kube/config` basically _connecting_ the local CLI to the cluster _my-cluster_: 
```
aws eks update-kubeconfig --region eu-central-1 --name my-cluster
```

```
kubectl config view

kubectl apply -f app/deployment.yaml 
kubectl apply -f app/service.yaml 
kubectl apply -f reverse-proxy/deployment.yaml
kubectl apply -f reverse-proxy/service.yaml

kubectl get pods
kubectl describe services
```
Connects to the given pod:
```
kubectl exec -it <POD_NAME> bash

# inside a pod, calling the /health endpoint of the app
curl http://my-app-2-svc:8080/health

# this request gets routed to the app itself as per nginx.conf from the reverse proxy
curl http://reverseproxy-svc:8080/api/health
```