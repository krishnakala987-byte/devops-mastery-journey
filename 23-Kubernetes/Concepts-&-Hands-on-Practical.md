# Kubernetes Hands-On Learning Notes (Pods → Deployment → ReplicaSet → Scaling → Auto-Healing)

---

## 1. Introduction

Kubernetes is a container orchestration tool used to manage applications running inside containers.

Instead of manually managing containers, Kubernetes:
- Keeps applications running
- Automatically fixes failures
- Scales applications when needed

Real-world analogy:

- Pod = Employee (does the actual work)
- ReplicaSet = Manager (ensures required employees exist)
- Deployment = Company system (handles hiring, scaling, updates)

---

## 2. Complete Learning Journey (Step-by-Step What I Did)

---

### Step 1: Tried to Apply Pod YAML

Command:
kubectl apply -f pod.yml

Error Faced:
connection refused 127.0.0.1

Cause:
Kubernetes cluster was not running.

Solution:
minikube start --driver=docker

---

### Step 2: Verified Cluster is Running

Command:
kubectl get nodes

Expected:
Node status should be "Ready"

---

### Step 3: Created Pod (nginx)

Command:
kubectl get pods -o wide

Observed:
- Pod is running
- Pod got IP like 10.244.x.x

---

### Step 4: Tested Pod Internally

Command:
minikube ssh

Then:
curl 10.244.0.10

Output:
Nginx HTML page

Learning:
- Pod IP works only inside Kubernetes cluster
- Cannot access from browser directly

---

### Step 5: Understood Problem with Pods

Limitations:
- No auto-healing
- No scaling
- Not used in production

Conclusion:
Always use Deployment instead of Pod

---

### Step 6: Created Deployment

Command:
kubectl apply -f deployment.yml

Command:
kubectl get pods

Observed:
- Pod names like nginx-deployment-xxxxx
- Managed by Deployment

---

### Step 7: Tested Auto-Healing

Command:
kubectl delete pod <pod-name>

Command:
kubectl get pods -w

Observed:
- Old Pod → Terminating
- New Pod → Pending → ContainerCreating → Running

Learning:
Kubernetes automatically recreated Pod

This is called:
AUTO-HEALING

---

### Step 8: Understood Internal Working

Flow:
Deployment → ReplicaSet → Pod → Container

ReplicaSet ensures:
Desired Pods = Running Pods

---

### Step 9: Scaled Application

Updated deployment.yml:
replicas: 3

Command:
kubectl apply -f deployment.yml

Command:
kubectl get pods

Observed:
- 3 Pods running

---

### Step 10: Tested Auto-Healing After Scaling

Command:
kubectl delete pod <pod-name>

Observed:
- New Pod created automatically
- Total Pods still = 3

---

## 3. Core Concepts

---

### Pod

- Smallest unit in Kubernetes
- Runs container (example: nginx)

Problems:
- No auto-healing
- No scaling

---

### ReplicaSet

- Maintains number of Pods
- If Pod dies → creates new Pod

Concept:
Desired State vs Current State

---

### Deployment

- Recommended way to run applications
- Manages ReplicaSet and Pods

Features:
- Auto-healing
- Scaling
- Updates

---

### Auto-Healing

If Pod is deleted:
- ReplicaSet creates new Pod automatically

---

### Scaling

- Increase replicas → more Pods
- Decrease replicas → fewer Pods

---

### Pod Networking

- Each Pod has IP (10.x.x.x)
- Only accessible inside cluster

---

## 4. Important Commands

---

Start Cluster:
minikube start

Check Nodes:
kubectl get nodes

Apply YAML:
kubectl apply -f deployment.yml

Get Pods:
kubectl get pods
kubectl get pods -o wide

Watch Pods Live:
kubectl get pods -w

Delete Pod:
kubectl delete pod <pod-name>

Scale Deployment:
kubectl scale deployment nginx-deployment --replicas=3

Enter Minikube:
minikube ssh

Test Pod Internally:
curl <pod-ip>

---

## 5. Problems & Troubleshooting

---

Problem: Connection Refused

Error:
connection refused 127.0.0.1

Cause:
Cluster not running

Solution:
minikube start

---

Problem: Pod IP Not Accessible from Browser

Cause:
Pod IP is internal to Kubernetes

Solution:
- Use:
minikube ssh
curl <pod-ip>

- Or use Service (NodePort)

---

## 6. Mistakes & Important Points

- Never create Pods directly in production
- Always use Deployment
- Always start Minikube before using kubectl
- Pod IP is not publicly accessible
- Service is required for external access
- ReplicaSet maintains desired state
- Deployment controls everything
- Use -w flag to observe real-time changes
- Kubernetes always ensures desired state

---

## 7. Final Understanding

Kubernetes always ensures:

Desired State = Actual State

---

Final Mental Model:

- Pod = runs application
- ReplicaSet = maintains Pods
- Deployment = manages everything

---

## 8. What I Learned Practically

- Created Pod and tested it
- Understood Pod limitations
- Created Deployment
- Observed auto-healing
- Scaled application to 3 Pods
- Verified auto-healing after scaling
- Tested internal networking using curl

---

## 9. Next Learning Steps

- Services (ClusterIP, NodePort)
- Load Balancing
- Ingress
- Real-world deployments
