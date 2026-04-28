# 1. Introduction

In this setup, we are monitoring a Python application running inside Kubernetes using Prometheus and Grafana.

Simple idea:
- Your app runs inside Kubernetes
- Prometheus collects metrics from the app and cluster
- Grafana shows those metrics in graphs

Real-world analogy:
Think of a hospital:
- Patient = Your application
- Monitor machine = Prometheus (collects data)
- Display screen = Grafana (shows graphs)

---

# 2. Core Concepts

## Kubernetes Service

A service exposes your application.

Types:
- ClusterIP → Internal only
- NodePort → Accessible from outside using a port
- LoadBalancer → External access (cloud)

Example:
sample-python-service   NodePort   80:31572/TCP

Meaning:
- 80 → Service port
- 31572 → External port (used in browser)

Access:
http://localhost:31572

---

## Pod

A pod runs your container (your app).

Check:
kubectl get pods

---

## Service → Pod Connection

Service connects to pods using labels.

If not connected:
- App won't open
- Grafana shows no data

---

## Prometheus

- Collects metrics
- Stores time-series data

Access:
http://localhost:9090

Query:
up

If value = 1 → working

---

## Grafana

- Visualizes metrics from Prometheus

Access:
http://localhost:3000

---

## Important Concept

No traffic → No data

---

# 3. Important Commands

## Check Pods
kubectl get pods

## Check Services
kubectl get svc

## Check Endpoints
kubectl get endpoints sample-python-service

## Delete Service
kubectl delete svc sample-python-service

## Expose Deployment
kubectl expose deployment sample-python-app \
  --type=NodePort \
  --port=80 \
  --target-port=8000 \
  --name=sample-python-service

## Test App
curl http://localhost:<port>
