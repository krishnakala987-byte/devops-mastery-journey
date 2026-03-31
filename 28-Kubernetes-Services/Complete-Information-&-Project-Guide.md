# Kubernetes Services - Complete Notes & Project Guide

---

## 1. Introduction

In Kubernetes, Pods are temporary. They can be created, deleted, or restarted anytime. Every time a Pod is recreated, it gets a new IP address.

This creates a major problem:
- Users cannot depend on Pod IPs
- Applications may break when Pods change

Kubernetes solves this using Services.

Real-world analogy:

Think of a restaurant:
- Customers = Users
- Kitchen staff = Pods
- Waiter = Service

Customers never go directly to the kitchen. They always interact with the waiter. Even if chefs change, the waiter remains the same.

---

## 2. Core Concepts

### Problem with Pod IPs

- Pods are ephemeral (temporary)
- Each Pod has a unique IP
- When a Pod dies, a new Pod gets a new IP

So direct communication with Pods is unreliable.

---

### What is a Service?

A Service is a stable layer in front of Pods.

- Provides a fixed IP
- Provides a DNS name
- Routes traffic to Pods

Important:
Service does NOT run your application. It only forwards traffic.

---

### Labels and Selectors

Pods:

labels:
  app: nginx

Service:

selector:
  app: nginx

Meaning:
Service will automatically connect to all Pods with label app=nginx.

---

## 3. Internal Working (MOST IMPORTANT)

### Components Involved

- API Server → Stores cluster state
- Endpoint Controller → Maintains Pod IP list
- Endpoints → List of Pod IPs
- kube-proxy → Routes traffic

---

### Step-by-Step Flow

Step 1: Pod is created
- ReplicaSet creates Pod
- Pod gets IP (example: 10.0.0.1)

Step 2: API Server updates
- Stores Pod information

Step 3: Endpoint Controller works
- Watches Pod changes
- Matches labels with Service
- Updates Endpoints

Example:

subsets:
  - addresses:
      - ip: 10.0.0.1
      - ip: 10.0.0.2

Step 4: kube-proxy works
- Reads Endpoints
- Routes traffic to Pods

---

## 4. What Happens When Pod Dies

1. Pod crashes
2. ReplicaSet creates new Pod (new IP)
3. API Server updates data
4. Endpoint Controller updates Endpoints
5. kube-proxy updates routing
6. Traffic automatically goes to new Pod

Important:
User never knows about Pod IP changes.

---

## 5. Types of Services

### ClusterIP

- Default type
- Accessible only inside cluster
- Used for internal communication

---

### NodePort

- Exposes Service on Node IP and port
- Accessible via:
  <NodeIP>:<NodePort>

Used for testing or small setups.

---

### LoadBalancer

- Used in cloud (AWS, Azure, GCP)
- Creates external load balancer
- Provides public IP

Used for production applications.

---

## 6. DNS in Kubernetes

Every Service gets a DNS:

<service-name>.<namespace>.svc.cluster.local

Pods communicate using DNS, not IP.

---

## 7. Port Mapping

ports:
  - port: 80
    targetPort: 8080

- port = Service port
- targetPort = Pod port

---

## 8. Important Commands

kubectl get svc  
→ List all services

kubectl get endpoints  
→ See Pod IPs behind a Service

kubectl describe svc <service-name>  
→ Detailed information about Service

kubectl apply -f <file>  
→ Apply configuration

---

## 9. Step-by-Step Project Implementation

Step 1: Create Deployment

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80

---

Step 2: Create Service

apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
  type: ClusterIP

---

Step 3: Apply Files

kubectl apply -f deployment.yaml  
kubectl apply -f service.yaml  

---

Step 4: Verify

kubectl get svc  
kubectl get pods  
kubectl get endpoints  

---

Step 5: Test

- Use Service IP or DNS
- Requests will be load balanced

---

## 10. Problems Faced & Troubleshooting

Problem: Service not working  
Cause: Labels mismatch  
Solution: Ensure labels and selectors match exactly  

---

Problem: Cannot access from outside  
Cause: Using ClusterIP  
Solution: Use NodePort or LoadBalancer  

---

Problem: Only one Pod receiving traffic  
Cause: Only one Pod running  
Solution: Increase replicas  

---

## 11. Mistakes & Things to Remember

- Never use Pod IP directly  
- Always use Service  
- Labels must match exactly  
- Service is not a Pod  
- Service only routes traffic  
- NodePort is not for production  
- Always check endpoints for debugging  

---

## 12. Quick Revision Summary

- Pods are temporary and get new IPs  
- Service provides stable IP and DNS  
- Endpoint Controller updates Pod list  
- kube-proxy routes traffic  
- Users always connect to Service, not Pods  
- Types: ClusterIP, NodePort, LoadBalancer
- 
