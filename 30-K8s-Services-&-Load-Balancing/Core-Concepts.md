# Kubernetes Services & Load Balancing - Complete Notes

---

## 1. Introduction

Kubernetes Services are used to expose applications running inside pods and provide stable communication.

Pods are temporary and their IP addresses keep changing. Because of this, we cannot rely on pod IPs directly. Services solve this problem by acting as a stable layer in front of pods.

Real-world analogy:
Think of pods as workers in a company. Workers may come and go, but the receptionist (Service) always stays the same and directs requests to available workers.

---

## 2. Core Concepts

### Pods
- Smallest unit in Kubernetes
- Runs containers
- Gets dynamic IP
- Not reliable for direct access

---

### Deployment
- Manages pods
- Ensures desired replicas
- Automatically recreates failed pods

Example:
replicas: 2

---

### Service
Service provides:
- Stable IP
- Load balancing
- Service discovery

---

### Labels and Selectors

Pods:
labels:
  app: sample-python-app

Service:
selector:
  app: sample-python-app

Important:
- Service finds pods using labels
- If labels don’t match → service will not work

---

### Service Types

ClusterIP:
- Default type
- Internal communication only

NodePort:
- Exposes service externally
- Access using:
  <NodeIP>:<NodePort>

LoadBalancer:
- Used in production
- Provides external IP
- In Minikube → requires tunnel

---

### kube-proxy

- Handles routing
- Performs load balancing

Flow:
User → Service → kube-proxy → Pod

---

### Pod Networking

- Pod IP works only inside cluster
- Cannot be accessed externally

---

## 3. Docker & Image Concept

Why pushing image is required:

In real world:
- Kubernetes cluster runs on different machines
- It cannot access your local Docker images

So images must be pushed to:
- Docker Hub
- AWS ECR
- GCR
- Azure ACR

---

### Minikube Special Case

- Docker runs inside cluster
- Local image works without push

---

### If you don't push (real cluster)

Error:
ImagePullBackOff

Cause:
Cluster cannot find your image

---

## 4. Important Commands

Docker:
docker build -t <image-name>:<tag> .

---

Minikube:
minikube start
minikube service <service-name>
minikube tunnel

---

Kubernetes:
kubectl apply -f <file>
kubectl get pods -o wide
kubectl get svc
kubectl logs -f <pod-name>

---

Load Testing:
for i in {1..20}; do curl http://127.0.0.1:<port>/demo/; done

Slow version:
for i in {1..20}; do curl http://127.0.0.1:<port>/demo/; sleep 1; done

---

KubeShark:
kubeshark tap

---
