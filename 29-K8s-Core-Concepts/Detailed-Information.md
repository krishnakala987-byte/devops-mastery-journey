# Kubernetes Detailed Notes

## 1. Introduction

Kubernetes is a container orchestration platform used to manage, scale, and maintain containerized applications.

In simple words:
- Docker helps you run containers
- Kubernetes helps you manage them at scale

Real-world analogy:
Docker is like cooking food.
Kubernetes is like managing a restaurant chain where multiple dishes must be prepared, served, scaled, and maintained properly.

---

## 2. Core Concepts

### Docker vs Kubernetes

Docker:
- Used to create and run containers
- Works on a single system

Kubernetes:
- Manages containers across multiple machines
- Provides auto-scaling and auto-healing

Key Idea:
Docker = container
Kubernetes = container manager

Interview Line:
Docker helps in containerization, while Kubernetes helps in orchestration of containers.

---

### Kubernetes Architecture

Kubernetes has two main parts:

## Control Plane (Master Node)

Responsible for managing the cluster.

Components:

- API Server  
  Entry point of Kubernetes. All commands (kubectl) go through it.

- Scheduler  
  Decides which node will run the pod.

- etcd  
  Database of Kubernetes. Stores cluster state and configuration.

- Controller Manager  
  Ensures desired state is maintained (auto-healing).

- Cloud Controller Manager  
  Integrates Kubernetes with cloud providers.

---

## Worker Nodes (Data Plane)

Responsible for running applications.

Components:

- Kubelet  
  Agent that runs on each node and ensures pods are running.

- Kube-proxy  
  Handles networking and routes traffic to correct pods.

- Container Runtime  
  Runs containers (Docker / containerd).

---

Interview Line:
Control plane manages the cluster, and worker nodes run the applications.

---

### Pod vs Container

Container:
- Runs a single application

Pod:
- Smallest deployable unit in Kubernetes
- Can contain one or more containers

Important Points:
- Containers in a pod share:
  - Network (same IP)
  - Storage
- Usually one container per pod in real-world usage

Interview Line:
A Pod is the smallest deployable unit in Kubernetes that can contain one or more containers.

---

### Namespaces

Used to logically divide a Kubernetes cluster.

Examples:
- dev
- test
- prod

Why needed:
- Isolation of resources
- Access control (RBAC)
- Better organization

Interview Line:
Namespaces provide logical isolation within a Kubernetes cluster.

---

### Services

Problem:
Pods do not have stable IPs (they change frequently).

Solution:
Services provide stable access to pods.

Types of Services:

#### ClusterIP
- Default service type
- Used for internal communication only

#### NodePort
- Exposes application on node IP + port
- Accessible externally

Example:
192.168.x.x:30007

#### LoadBalancer
- Used in cloud environments
- Provides external IP
- Automatically distributes traffic

Interview Line:
Services provide stable networking and load balancing for pods.

---

### Kubelet

- Runs on every worker node
- Communicates with API server
- Ensures containers are running

Example:
If a pod crashes, kubelet restarts it.

Interview Line:
Kubelet ensures that containers described in PodSpecs are running on nodes.

---

### DevOps Day-to-Day Activities

- Deploy applications using YAML files
- Monitor pods and services
- Debug issues using logs
- Scale applications
- Perform cluster upgrades
- Manage CI/CD pipelines

---

## 3. Important Commands / Syntax

```bash
kubectl get pods
# Lists all pods

kubectl get services
# Lists all services

kubectl describe pod <pod-name>
# Shows detailed information about a pod

kubectl logs <pod-name>
# Displays logs of a pod

kubectl apply -f <file.yaml>
# Creates resources from YAML file

kubectl delete -f <file.yaml>
# Deletes resources

kubectl get nodes
# Lists all cluster nodes
```

---

## 4. Step-by-Step Project Implementation

### Basic Kubernetes Deployment Flow

1. Build Docker image

2. Push image to Docker Hub or any container registry  
   (Important: Kubernetes pulls images from registry, not local system)

3. Create Deployment YAML file

4. Apply deployment:
   kubectl apply -f deployment.yaml

5. Verify pods:
   kubectl get pods

6. Expose application using Service:
   kubectl apply -f service.yaml

7. Test application:
   - NodePort → access via node IP + port
   - LoadBalancer → external IP (cloud)

---

## 5. Problems Faced & Troubleshooting

### Problem: Application not accessible

Cause:
- Service misconfiguration
- Wrong port mapping

Solution:
- Check services:
  kubectl get services
- Verify ports and selectors

---

### Problem: Pods restarting

Cause:
- Application crash
- Configuration issue

Solution:
- Check logs:
  kubectl logs <pod-name>

---

### Problem: Multiple pods created unexpectedly

Cause:
- Replica count defined in deployment

Solution:
- Check deployment YAML
- Adjust replicas field

---

### Problem: Image not found / not pulling

Cause:
- Image not pushed to Docker Hub

Solution:
- Push image before deployment

---

## 6. Mistakes & Things to Remember

- Always push Docker image before deploying to Kubernetes
- Never rely on Pod IP (it changes)
- Always use Services for stable access
- Use kubectl logs first when debugging
- Understand difference between Pod and Deployment
- etcd is the backbone of Kubernetes (stores cluster state)
- Scheduler only assigns pods, it does not run them
- Kubelet is responsible for actually running containers

---

## 7. Quick Revision Summary

- Docker → creates containers
- Kubernetes → manages containers
- Pod → smallest unit
- Deployment → manages pods and scaling
- Service → provides stable access
- Kubelet → ensures pods run
- etcd → stores cluster data
- Scheduler → assigns pods to nodes

---

## 8. Must-Know Interview Questions

Q1: What happens if a pod dies?  
A: Controller recreates it automatically (auto-healing)

Q2: Why not use pods directly?  
A: Pod IP changes, so it is unstable

Q3: How do users access applications?  
A: Through Services

Q4: What is etcd?  
A: Key-value database storing cluster state

Q5: Difference between Pod and Deployment?  
A: Pod runs container, Deployment manages pods (scaling, updates)
