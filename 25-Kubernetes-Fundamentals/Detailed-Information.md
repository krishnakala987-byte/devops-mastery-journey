# Kubernetes Detailed Notes

---

## 1. Introduction

Kubernetes is a container orchestration platform used to manage applications running inside containers across multiple machines.

In simple words:
- Docker runs containers on a single machine
- Kubernetes manages containers across multiple machines automatically

Real-world analogy:
Think of Kubernetes like a company:
- Control Plane = Managers (decision makers)
- Worker Nodes = Employees (do actual work)

---

## 2. Core Concepts

---

### Docker vs Kubernetes

Docker:
- Runs containers on a single system
- Manual scaling
- No auto-healing

Kubernetes:
- Runs containers across multiple machines (cluster)
- Auto-scaling and auto-healing
- Production-ready features

---

## Kubernetes Architecture

Kubernetes has 2 main parts:

### 1. Control Plane (Brain)

Responsible for decision-making.

#### Components:

API Server
- Entry point of Kubernetes
- All commands go through it

Example command:
kubectl apply -f app.yaml

---

Scheduler
- Decides which node will run the pod
- Checks CPU, memory, availability

---

etcd
- Database of Kubernetes
- Stores cluster state and configuration

Important:
If etcd is lost, cluster state is lost

---

Controller Manager
- Ensures desired state = actual state

Example:
- You want 3 pods
- Only 2 running → creates 1 more

---

Cloud Controller Manager
- Used in cloud environments
- Manages load balancers, storage, etc.

---

### 2. Data Plane (Worker Nodes)

This is where applications actually run.

#### Components:

Kubelet
- Runs on every node
- Ensures pods are running properly

---

Kube-proxy
- Handles networking
- Manages traffic and load balancing

---

Container Runtime
- Runs containers

Examples:
- Docker
- containerd
- CRI-O

---

## Container vs Pod vs Node

This is one of the most important concepts.

### Container

- Smallest unit
- Actual application
- Contains code and dependencies

Example:
- Node.js app
- Python app

---

### Pod

- Kubernetes wrapper around container
- Kubernetes never runs container directly
- Usually contains one container

Purpose:
- Adds networking and management

---

### Node

- A machine (physical or virtual)
- Runs multiple pods

Examples:
- AWS EC2
- Virtual Machine
- Local system

---

### Relationship

Always remember:

Node → Pod → Container

Or:

Container runs inside Pod  
Pod runs inside Node

---

## Key Features of Kubernetes

---

Auto Healing
- If container crashes, Kubernetes restarts it automatically

---

Auto Scaling
- Increases or decreases pods based on traffic

---

Load Balancing
- Distributes traffic across multiple pods

---

## 3. Important Commands / Syntax

kubectl apply -f app.yaml

- Used to deploy application in Kubernetes
- Sends request to API Server

---

## 4. Step-by-Step Flow (How Kubernetes Works)

1. User runs:
   kubectl apply -f app.yaml

2. Request goes to API Server

3. Data stored in etcd

4. Scheduler decides node

5. Kubelet runs pod on selected node

6. Container runtime starts container

7. Kube-proxy handles traffic

8. Controller ensures desired state

---

## 5. Problems Faced & Troubleshooting

Problem:
Confusion between Pod, Container, and Node

Cause:
Conceptual misunderstanding of hierarchy

Solution:
Use this rule:

- Container = Application
- Pod = Wrapper
- Node = Machine

And always remember:

Container → Pod → Node

---

## 6. Mistakes & Things to Remember ⚠️

- Kubernetes does NOT run containers directly, it runs Pods
- Pod is NOT equal to container
- Node is NOT a pod
- etcd is very critical, losing it means losing cluster data
- Always think in terms of "desired state vs actual state"
- Kubelet is responsible for maintaining pods on nodes

---

## 7. Quick Revision Summary

- Docker runs containers, Kubernetes manages them
- Kubernetes has:
  - Control Plane (brain)
  - Worker Nodes (execution)

- Important components:
  - API Server → entry point
  - Scheduler → assigns node
  - etcd → stores data
  - Controller → maintains state
  - Kubelet → runs pods
  - Kube-proxy → networking

- Core hierarchy:
  Container → Pod → Node

- Key features:
  - Auto-healing
  - Auto-scaling
  - Load balancing
