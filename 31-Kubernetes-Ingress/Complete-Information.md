# Kubernetes Ingress - Detailed Notes

---

## 1. Introduction

Ingress is a Kubernetes resource used to expose applications to the outside world.

In simple words:
Ingress acts as a smart entry point that decides how external traffic reaches different services inside the cluster.

### Real-world analogy

Think of a mall:

- Mall = Kubernetes cluster
- Shops = Services
- Main gate/security = Ingress

A person enters and says:
"I want food court"

Security sends them to the correct place.

---

## 2. Core Concepts

### What is Ingress?

Ingress manages external HTTP/HTTPS traffic and routes it to the correct service.

---

### Why do we need Ingress?

Using only Services (LoadBalancer):

- Each service gets a separate IP
- Expensive in cloud
- No smart routing
- No domain-based routing

Ingress solves this:

- Single entry point
- Path-based routing
- Host-based routing
- SSL support

---

### Service vs Ingress

Service:
- Internal communication
- Basic load balancing

Ingress:
- External access
- Smart routing (host + path)

---

### Ingress Controller

Ingress resource alone does nothing.

It needs a controller like:
- NGINX
- HAProxy
- Traefik

---

### Path-based Routing

- /api → backend
- /app → frontend

---

### Host-based Routing

- api.example.com → backend
- app.example.com → frontend

---

### What is Rewrite?

Rewrite means changing the URL before sending it to the application.

Example:

User requests:
/testpath

Application understands:
/demo/

Ingress converts:
/testpath → /demo/

---

## 3. Important Commands

Enable ingress:
minikube addons enable ingress

Get IP:
minikube ip

Apply YAML:
kubectl apply -f ingress.yml

Check ingress:
kubectl get ingress

Test:
curl http://<ip>/path

Follow redirect:
curl -L http://<domain>/path

Edit hosts:
sudo vim /etc/hosts

---
