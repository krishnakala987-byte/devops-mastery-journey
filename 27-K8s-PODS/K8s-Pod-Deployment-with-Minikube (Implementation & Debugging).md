# Kubernetes First Application Deployment - Complete Notes

---

## 1. Introduction

Kubernetes is a container orchestration platform used to manage, deploy, and scale applications.

Instead of running containers directly (like Docker), Kubernetes runs them inside Pods and manages everything.

Real-world analogy:
- Container = person
- Pod = room
- Kubernetes = hotel manager

You don’t manage people individually, you manage rooms.

---

## 2. Core Concepts

### Container vs Pod

Container:
- Runs application (like nginx)
- Independent unit

Pod:
- Smallest unit in Kubernetes
- Wrapper around one or more containers
- Shared network (same IP)
- Communication via localhost

Important:
Containers are never deployed directly in Kubernetes. Pods are used.

---

### Tools Used

Minikube:
- Runs Kubernetes cluster locally

kubectl:
- Command-line tool to interact with Kubernetes

---

### Pod YAML Structure

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
```

Explanation:
- apiVersion → Kubernetes API version
- kind → Resource type
- metadata → Name of resource
- spec → Configuration
- containers → List of containers

---

### How Kubernetes Works

Flow:
kubectl → API Server → Pod → Container

---

## 3. Important Commands

### Cluster Commands

```bash
minikube start --driver=docker --memory=2200mb
```
Starts Kubernetes cluster.

```bash
minikube status
```
Checks cluster status.

---

### Pod Commands

```bash
kubectl apply -f pod.yml
```
Creates/updates resource.

```bash
kubectl create -f pod.yml
```
Creates resource initially.

```bash
kubectl get pods
```
Lists pods.

```bash
kubectl describe pod nginx
```
Detailed info.

```bash
kubectl logs nginx
```
Shows logs.

---

### Service Commands

```bash
kubectl expose pod nginx --type=NodePort --port=80
```
Expose pod.

```bash
minikube service nginx
```
Access app in browser.

---

### Debug Commands

```bash
kubectl cluster-info
kubectl get nodes
kubectl config current-context
```

---

## 4. Step-by-Step Project

### Step 1: Start Minikube

```bash
minikube start --driver=docker --memory=2200mb
```

---

### Step 2: Create pod.yml

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
```

---

### Step 3: Apply YAML

```bash
kubectl apply -f pod.yml
```

---

### Step 4: Verify Pod

```bash
kubectl get pods
```

---

### Step 5: Debug (if needed)

```bash
kubectl describe pod nginx
kubectl logs nginx
```

---

### Step 6: Expose Application

```bash
kubectl expose pod nginx --type=NodePort --port=80
```

---

### Step 7: Access Application

```bash
minikube service nginx
```

Output:
Welcome to nginx page

---

## 5. Problems Faced & Troubleshooting

### Problem 1: Minikube Start Failed

Error:
- Unable to connect to registry.k8s.io

Cause:
- DNS issue in WSL

Solution:
- Edit /etc/resolv.conf
- Add:
  nameserver 8.8.8.8
  nameserver 1.1.1.1
- Disable auto overwrite using wsl.conf
- Restart WSL

---

### Problem 2: DNS Server Misbehaving

Error:
lookup dl.k8s.io on 127.0.0.53

Cause:
- Broken DNS in WSL

Solution:
- Remove resolv.conf
- Recreate with public DNS
- Lock file using:
sudo chattr +i /etc/resolv.conf

---

### Problem 3: kubectl Connection Refused

Error:
connection refused 127.0.0.1

Cause:
- Minikube stopped

Solution:
minikube start

---

### Problem 4: Warning during apply

Warning:
missing last-applied-configuration

Cause:
- Used kubectl create earlier

Solution:
- Safe to ignore

---

## 6. Mistakes & Things to Remember

- Always check minikube status before kubectl
- Minikube does not auto-start
- Avoid high memory allocation
- YAML indentation must be correct
- Pods are not used in production directly
- Always check logs and describe for debugging
- DNS issues are common in WSL

---

## 7. Quick Revision

- Kubernetes uses Pods, not containers directly
- Minikube runs local cluster
- kubectl interacts with cluster
- YAML defines resources
- Use apply to create/update
- Use logs and describe for debugging
- Use Service to expose app
- Ensure cluster is running before commands

---

End of Notes
