# Docker Fundamentals for DevOps

This repository contains my structured learning notes and practical understanding of Docker concepts focused on real-world DevOps usage and interview preparation.

## Topics Covered
- Docker vs Virtual Machines
- Docker Architecture (Client, Daemon, Registry)
- Dockerfile Instructions (COPY vs ADD, CMD vs ENTRYPOINT)
- Docker Networking (Bridge, Host, Custom Bridge, Overlay)
- Image Optimization (Multi-stage builds, Distroless images)
- Docker Security & Image Scanning
- Real-world Docker Challenges

## Projects
- Docker Image Optimization using Multi-stage Build
- Container Communication using Custom Network

------------------------------------------------------------

# Docker Detailed Notes

## 1. Introduction

Docker is a containerization tool that allows us to package an application along with its dependencies so it can run anywhere consistently.

Simple analogy:
A container is like a lunchbox. It contains everything needed (food + spoon + napkin), so you don’t depend on anything outside.

------------------------------------------------------------

## 2. Core Concepts

### Docker vs Virtual Machines

Containers:
- Lightweight
- Share host OS kernel
- Fast startup

Virtual Machines:
- Heavy (full OS inside)
- Slower
- More resource usage

Key understanding:
Containers run only the application, while VMs run an entire OS.

------------------------------------------------------------

### Docker Architecture

Components:

1. Docker Client  
   - CLI where we run commands like docker run

2. Docker Daemon  
   - Core engine that builds and runs containers

3. Docker Registry  
   - Stores images (Docker Hub)

Flow:
Client → Daemon → Registry → Container

------------------------------------------------------------

### Dockerfile Instructions

#### COPY vs ADD

COPY:
- Copies files from local system to container
- Simple and safe

Example:
COPY app.py /app/

ADD:
- Can copy files
- Can download from URL
- Can auto-extract compressed files

Example:
ADD file.tar.gz /app/

Best Practice:
Always use COPY unless you need ADD features.

------------------------------------------------------------

#### CMD vs ENTRYPOINT

CMD:
- Default command
- Can be overridden

ENTRYPOINT:
- Fixed command
- Cannot be easily overridden

Key difference:
CMD is flexible, ENTRYPOINT is strict.

------------------------------------------------------------

### Docker Networking

Types:

1. Bridge (default)
- Containers communicate using IP
- No automatic name resolution

2. Custom Bridge (important)
- Supports DNS (container name communication)

Command:
docker network create mynet

3. Host Network
- Shares host network
- No isolation

4. Overlay Network
- Used in multi-host setups (Kubernetes, Swarm)

------------------------------------------------------------

### Image Optimization

#### Multi-stage Build

Used to reduce image size.

Concept:
- Build app in one stage
- Copy only required files to final image

Benefit:
Huge size reduction

------------------------------------------------------------

#### Distroless Images

- No OS, only application
- More secure
- Smaller size

------------------------------------------------------------

### Docker Image Scanning

Purpose:
Check images for vulnerabilities before deployment

Tools:
- Trivy
- Docker Scan
- Clair

Example:
trivy image myimage

------------------------------------------------------------

### Real-world Challenges

1. Docker Daemon is Single Point of Failure
   - If it stops, containers stop

2. Runs as Root
   - Security risk

Solution:
- Rootless Docker
- Proper security practices

------------------------------------------------------------

## 3. Important Commands / Syntax

docker build -t myimage .
# Build image

docker run myimage
# Run container

docker network create mynet
# Create custom network

docker scan myimage
# Scan image (basic)

trivy image myimage
# Advanced vulnerability scanning

------------------------------------------------------------

## 4. Step-by-Step Project Implementation

### Project: Container Communication using Custom Network

Step 1: Create network
docker network create mynet

Step 2: Run first container
docker run -d --name container1 --network mynet nginx

Step 3: Run second container
docker run -d --name container2 --network mynet busybox

Step 4: Test communication
docker exec -it container2 ping container1

Expected:
Containers communicate using name (DNS works)

------------------------------------------------------------

### Project: Multi-stage Build Optimization

Step 1: Create Dockerfile with multiple stages  
Step 2: Build application in first stage  
Step 3: Copy only required files to final stage  
Step 4: Build image  

Result:
Reduced image size significantly

------------------------------------------------------------

## 5. Problems Faced & Troubleshooting

Problem:
Containers not communicating using name

Cause:
Using default bridge network

Solution:
Create and use custom bridge network

---

Problem:
Confusion between COPY and ADD

Cause:
Both seem similar

Solution:
Use COPY by default, ADD only for:
- URL download
- Auto extraction

---

Problem:
Incorrect understanding of image scanning tools

Cause:
Misunderstood tool name (sync)

Solution:
Use proper tools like:
- Trivy
- Docker Scan

------------------------------------------------------------

## 6. Mistakes & Things to Remember

- Always prefer COPY over ADD
- Use custom networks for container communication
- Never deploy unscanned images to production
- Avoid running containers as root
- Keep images small using multi-stage builds
- Understand CMD vs ENTRYPOINT clearly (frequently asked)

------------------------------------------------------------

## 7. Quick Revision Summary

- Containers are lightweight because they share OS kernel
- Docker has 3 main components: Client, Daemon, Registry
- COPY is safe, ADD has extra features
- CMD is overrideable, ENTRYPOINT is fixed
- Custom networks enable DNS-based communication
- Multi-stage builds reduce image size
- Use Trivy or Docker Scan for security
- Always follow best practices for production readiness
