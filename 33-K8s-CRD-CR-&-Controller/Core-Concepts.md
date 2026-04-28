# Kubernetes CRD, CR & Controller - Detailed Notes

## 1. Introduction

Kubernetes supports basic resources like Pod and Service.

To add new features, it uses CRD, CR and Controllers.

---

## 2. Core Concepts

CRD → defines new resource type  
CR → actual object created  
Controller → makes it work  

---

## 3. Simple Understanding

CRD = feature  
CR = using feature  
Controller = executes it  

---

## 4. Real Example

Command:
oc expose svc mynginx

What happened:

CRD → Route already exists  
CR → route created  
Controller → generated URL  

---

## 5. Workflow

1. Install CRD  
2. Install Controller  
3. Create CR  
4. Controller processes  

---

## 6. Commands

oc api-resources
oc get route
oc get route -o yaml

---

## 7. Debugging

oc get route
oc describe route
oc logs <controller>

---

## 8. Problems

Problem: forbidden error  
Cause: cluster-level access  

Problem: confusion  
Fix:
CRD = definition  
CR = instance  

---

## 9. Things to Remember

- CRD defines resource
- CR is actual usage
- Controller works in background
- No manual setup needed

---

## 10. Quick Revision

- CRD = new API
- CR = object
- Controller = automation
- Used in tools like ArgoCD, Istio
