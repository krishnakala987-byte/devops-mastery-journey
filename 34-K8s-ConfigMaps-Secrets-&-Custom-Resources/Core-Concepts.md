## 1. Introduction

Kubernetes applications should not have hardcoded configuration. Instead, configuration should be managed externally.

Think of it like:
Application = Machine  
ConfigMap/Secret = Settings  

You can change settings without rebuilding the application.

Kubernetes also allows extending itself using Custom Resources.

---

## 2. Core Concepts

### ConfigMap

Used to store non-sensitive data.

Example:
db-port: 3306

Two ways to use:

1. Environment Variable
- Injected at container start
- Does NOT auto-update

2. Volume Mount
- Stored as file inside container
- Auto-updates automatically

Example file created:
 /opt/db-port

---

### Secret

Used to store sensitive data.

Example (base64):
db-port: MzMwNg==

Decoded:
3306

Important:
- Not encrypted (only base64)
- Needs RBAC for security

---

### ConfigMap vs Secret

ConfigMap = normal data  
Secret = sensitive data  

---

### Python Config Reading

import os
port = os.getenv("DB_PORT")

Meaning:
- Reads environment variable from system

If not present:
None is returned

Better:
port = os.getenv("DB_PORT", "5432")

---

### File-based Config Reading

File:
 /opt/db-port

Command:
cat /opt/db-port

---

### Pipe Command

cat /opt/db-port | more

Breakdown:
cat = read file  
| = pass output  
more = show output page by page  

---

### Rollout Restart

kubectl rollout restart deployment sample-python-app

Meaning:
- Restart all pods
- New pods get updated config

---

## 3. Important Commands

ConfigMap:
kubectl apply -f cm.yml
kubectl get cm
kubectl describe cm test-cm
kubectl edit cm test-cm

Deployment:
kubectl apply -f deployment.yml
kubectl get pods
kubectl exec -it <pod-name> -- /bin/bash

Debug:
env | grep DB
ls /opt
cat /opt/db-port

Secret:
kubectl create secret generic test-secret --from-literal=db-port="3306"
kubectl describe secret test-secret
kubectl edit secret test-secret

Decode:
echo MzMwNg== | base64 --decode
