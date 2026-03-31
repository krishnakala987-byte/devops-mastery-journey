# Docker Networking - Complete Notes (Concept + Practical)

## 1. Introduction

Docker networking is the system that allows containers to communicate with each other and with the host machine.

Simple analogy:
- Containers = people
- Network = how they talk

Without networking:
- Frontend cannot talk to backend
- Backend cannot talk to database

So networking is required for any real-world application.

---

## 2. Why Docker Networking is Needed

In real applications:

Frontend → Backend → Database

All these run in different containers, so they must communicate.

Docker networking provides:
- Communication
- Isolation
- Security

---

## 3. Types of Docker Networks

### 3.1 Bridge Network (Default)

- Created automatically by Docker
- All containers connect here if no network is specified

Features:
- Containers get IP addresses
- Can communicate using IP
- No proper DNS (name-based communication does not work reliably)

Problem:
- No isolation
- All containers can access each other
- Not secure

---

### 3.2 Custom Bridge Network (Most Important)

Created using:

docker network create mynet

Features:
- Containers can communicate using names (DNS works)
- Better security and isolation
- Only containers inside this network can talk

This is used in real-world applications.

---

### 3.3 Host Network

Run container using:

docker run -d --network host nginx

Features:
- Container uses host machine network directly
- No separate IP is assigned

Important:
- "IPAddress": "" (empty)

Reason:
- Container shares host network
- No isolation

Use case:
- High performance
- Direct access to ports

Drawback:
- Not secure

---

## 4. Core Concepts

### 4.1 Container IP Address

- Every container in bridge/custom network gets an IP
- Example: 172.17.x.x or 172.18.x.x

Important:
- IP is NOT permanent
- Changes when container restarts

---

### 4.2 Container Communication Rule

Same network → communication works  
Different network → communication fails

---

### 4.3 Docker DNS (Very Important)

- Works ONLY in custom networks
- Converts container name → IP

Example:

ping finance

Works only if both containers are in same custom network.

---

### 4.4 Why Use Container Names Instead of IP

Problem with IP:
- Changes after restart

Solution:
- Use container name

Example:
- ping finance instead of ping 172.x.x.x

---

### 4.5 Host Network Special Behavior

- No separate IP
- Uses laptop/server IP

Example:
If your laptop IP = 192.168.1.10

Then container also uses:
192.168.1.10

Docker shows:
"IPAddress": ""

Because no separate IP exists.

---

## 5. Important Commands

### Check networks

docker network ls

---

### Create network

docker network create mynet

---

### Run container

docker run -dit --name c1 nginx

---

### Run container in custom network

docker run -dit --name c1 --network mynet nginx

---

### Connect existing container to network

docker network connect mynet container_name

---

### Inspect network

docker network inspect mynet

---

### Enter container

docker exec -it container_name /bin/bash

---

### Ping container

ping container_name

---

## 6. Practical Work Done (Step-by-Step)

### Step 1: Created containers

docker run -d --name login nginx
docker run -d --name logout nginx

Observation:
- Both are in default bridge network

---

### Step 2: Tried communication

Inside login container:

docker exec -it login /bin/bash
ping logout

Result:
- Failed

Reason:
- Default bridge does NOT support DNS

---

### Step 3: Ping using IP

ping 172.x.x.x

Result:
- Works

Reason:
- IP communication works even in default network

---

### Step 4: Created custom network

docker network create secure-network

---

### Step 5: Ran container in custom network

docker run -d --name finance --network secure-network nginx

---

### Step 6: Tried communication

From login:

ping finance

Result:
- Failed

Reason:
- login and finance are in different networks

---

### Step 7: Fixed communication

docker network connect secure-network login

---

### Step 8: Tested again

ping finance

Result:
- Success

---

### Step 9: Host network demo

docker run -d --name host-demo --network host nginx

Observation:
- No IP assigned
- Container uses host network

---

## 7. Problems Faced & Solutions

### Problem 1: Ping by name not working

Cause:
- Using default bridge network

Solution:
- Use custom network

---

### Problem 2: Containers not communicating

Cause:
- Different networks

Solution:
docker network connect network_name container_name

---

### Problem 3: Host network IP empty

Cause:
- Container shares host network

Solution:
- Expected behavior

---

### Problem 4: Wrong command used

Wrong:
docker network bridge secure-network

Correct:
docker network create secure-network

---

### Problem 5: Docker not found inside container

Cause:
- Container is separate environment

Solution:
- Run Docker commands on host only

---

## 8. Mistakes & Things to Remember

- Default bridge does NOT support name resolution
- Always use custom network for real applications
- Containers in different networks cannot communicate
- Host network has no isolation
- Container IP is not stable
- Always prefer container names over IP
- Docker is not available inside containers
- Use docker network inspect to debug

---

## 9. Golden Rules (Must Remember)

1. Same network → containers can talk  
2. Different network → cannot talk  
3. Custom network → DNS works  
4. Default bridge → DNS does NOT work  
5. Host network → no IP, no isolation  

---

## 10. Final Understanding

Docker networking is about:

- Communication
- Isolation
- Security

One-line summary:

Docker networking = who can talk to whom and how securely
