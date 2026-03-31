# Kubernetes Cluster Setup using KOPS (Detailed Notes)

---

## 1. Introduction

Kubernetes is used to manage containers, but in real-world production, we also need a way to create and manage Kubernetes clusters themselves.

KOPS is a tool that helps us create, update, and delete Kubernetes clusters on AWS automatically.

Real-world analogy:

- Docker → Packs the application
- Kubernetes → Manages applications
- KOPS → Builds the Kubernetes platform itself

---

## 2. Core Concepts

### What is KOPS?

KOPS is a tool used to create and manage Kubernetes clusters on AWS.

It automates:
- EC2 instances
- Networking (VPC)
- Load balancers
- Security groups
- Control plane and worker nodes

---

### Kubernetes Environments

#### Local (Learning)

- Minikube
- Kind

Used for practice, not production.

#### Production (Real World)

- EKS
- KOPS
- OpenShift
- Rancher

---

### KOPS Workflow

There are two important steps:

1. Create Cluster (Configuration only)
2. Update Cluster (Actual creation)

Important difference:

- kops create cluster → only prepares config
- kops update cluster --yes → creates real AWS resources

---

### S3 Bucket (State Store)

KOPS requires an S3 bucket to store cluster configuration.

It stores:
- Cluster details
- Metadata
- Updates

Without S3, KOPS cannot manage the cluster.

---

### Gossip vs DNS (Very Important)

#### Gossip Mode (.local)

- No DNS required
- Used for learning
- Not production-ready

Example:
demok8scluster.k8s.local

---

#### DNS Mode (Production)

- Uses real domain
- Requires DNS setup
- Stable and production-ready

Example:
dev.k8s.mycompany.com

---

### Route53 Role

Route53 is used to manage DNS in AWS.

It helps:
- Resolve Kubernetes API endpoint
- Provide stable access to cluster

---

### Environment Variables

Environment variables store values temporarily for reuse.

Example:
export NAME=dev.k8s.mycompany.com

Instead of typing full name every time, use:
$NAME

---

## 3. Important Commands / Syntax

### Install KOPS

curl -LO https://github.com/kubernetes/kops/releases/download/.../kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

---

### AWS CLI Setup

aws configure

Connects your system to AWS.

---

### Create S3 Bucket

aws s3api create-bucket --bucket kops-abhi-storage --region us-east-1

---

### Create Cluster (Config Only)

kops create cluster \
--name=demok8scluster.k8s.local \
--state=s3://kops-abhi-storage \
--zones=us-east-1a \
--node-count=1 \
--node-size=t2.micro \
--master-size=t2.micro \
--master-volume-size=8 \
--node-volume-size=8

---

### Edit Cluster

kops edit cluster demok8scluster.k8s.local

---

### Build Cluster

kops update cluster demok8scluster.k8s.local --yes --state=s3://kops-abhi-storage

---

### Validate Cluster

kops validate cluster demok8scluster.k8s.local

---

### Delete Cluster

kops delete cluster demok8scluster.k8s.local --yes --state=s3://kops-abhi-storage

---

### Delete S3 Bucket

aws s3 rb s3://kops-abhi-storage --force
