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
```
Connect applications (`deployment.yaml`) with services (`service.yaml`):
```
kubectl apply -f app/deployment.yaml 
kubectl apply -f app/service.yaml 
kubectl apply -f reverse-proxy/deployment.yaml
kubectl apply -f reverse-proxy/service.yaml
```
Get information about the pods and services in a cluster:
```
kubectl get pods
kubectl describe services
```
Connect to the given pod:
```
kubectl exec -it <POD_NAME> bash
```

Inside a pod, call the `/health` endpoint of the app running inside the container: `curl http://my-app-2-svc:8080/health`

Inside a pod, call the `/health` endpoint as exposed by the gateway (reverse proxy), which in turn routes the call to the app running inside the other container/pod : `curl http://reverseproxy-svc:8080/api/health`. This routing is possible because the pods share the same network, while not being accessible from outside.

Create a **h**orizontal **p**od **a**utoscaler:
```
kubectl autoscale deployment my-app-2 --cpu-percent=50 --min=1 --max=50
```

List the HPAs:
```
kubectl get hpa
```

```
kubectl delete pod <POD_NAME>
kubectl delete hpa my-app-2
```

# License

This code is released under the terms and agreements of [LICENSE](LICENSE).
