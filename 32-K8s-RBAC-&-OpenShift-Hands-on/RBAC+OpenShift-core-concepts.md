# Kubernetes RBAC & OpenShift - Detailed Notes

## 1. Introduction

Kubernetes RBAC is used to control access in a cluster.

Simple meaning:
It decides who can do what.

Example:
Like a company:
- Employee → limited access
- Admin → full access

---

## 2. Core Concepts

RBAC controls:
- Who (user/service account)
- What action (get, create, delete)
- On which resource

Role → namespace level  
ClusterRole → whole cluster  

RoleBinding → attach role to user  
ClusterRoleBinding → cluster-wide  

Service Account → used by applications (pods)

Authentication → external (IAM, LDAP)  
Authorization → handled by RBAC

---

## 3. Important Commands

oc login
oc get pods
oc get all
oc create deployment nginx --image=nginx
oc expose deployment nginx
oc get route

## 7. Quick Revision

- RBAC controls access
- Service connects using labels
- Endpoints show connection
- Route exposes app
- Debug step-by-step
