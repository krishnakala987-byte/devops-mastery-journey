# Docker + Django + EC2 (Detailed Notes)

--------------------------------------------------

## 1. Introduction

Containerization means packaging an application along with all its dependencies so that it runs the same everywhere.

Earlier:
- Physical servers → expensive and hard to manage
- Virtual Machines → heavy and slow

Now:
- Containers → lightweight, fast, efficient

Real-world analogy:
A container is like a lunchbox. Everything needed is packed inside, so you can use it anywhere without depending on outside setup.

--------------------------------------------------

## 2. Core Concepts

### What is a Container?

A container is a package that includes:
- Application code
- Dependencies
- Runtime environment

It runs on the host OS kernel.

---

### Docker Lifecycle

1. Write Dockerfile
2. Build Image
3. Run Container

---

### Docker Architecture

- Docker Client → where commands are executed
- Docker Daemon → executes container operations
- Docker Registry → stores images (Docker Hub)

---

### VM vs Container

| Feature | VM | Container |
|--------|----|----------|
| OS | Separate OS | Shared OS |
| Size | Large | Small |
| Speed | Slow | Fast |

---

### EC2 vs Container

- EC2 → Virtual machine (server)
- Container → Runs inside EC2

---

### Kernel

Kernel is the core of OS that manages:
- CPU
- Memory
- Processes

Containers share the host kernel.

---

### Daemon

Docker daemon is a background service that:
- Builds images
- Runs containers

---

### App + Dependencies

Example:
A Django app needs:
- Python
- Django
- Libraries

Docker packages everything together.

--------------------------------------------------

## 3. Important Commands

### Build Image

docker build -t django-app .

- -t → image name
- . → current directory (build context)

---

### Run Container

docker run -d -p 8000:8000 django-app

- -d → background mode
- -p → port mapping

---

### Check Containers

docker ps
docker ps -a

---

### Logs

docker logs <container-id>

---

### Enter Container

docker exec -it <container-id> bash

---

### Django Commands

python devops/manage.py migrate
python devops/manage.py createsuperuser

# Docker Commands Cheat Sheet

--------------------------------------------------

## 1. Docker Basics

### Check Docker Version
docker --version

### Check Docker Info
docker info

--------------------------------------------------

## 2. Images

### Build Image
docker build -t <image-name> .

### List Images
docker images

### Remove Image
docker rmi <image-id>

### Remove All Images
docker rmi $(docker images -q)

--------------------------------------------------

## 3. Containers

### Run Container
docker run <image-name>

### Run in Background
docker run -d <image-name>

### Run with Port Mapping
docker run -d -p 8000:8000 <image-name>

### Run with Interactive Mode
docker run -it <image-name>

--------------------------------------------------

## 4. Container Management

### List Running Containers
docker ps

### List All Containers
docker ps -a

### Stop Container
docker stop <container-id>

### Start Container
docker start <container-id>

### Restart Container
docker restart <container-id>

### Remove Container
docker rm <container-id>

### Remove All Containers
docker rm $(docker ps -aq)

--------------------------------------------------

## 5. Logs & Debugging

### View Logs
docker logs <container-id>

### Follow Logs (Live)
docker logs -f <container-id>

### Run Container in Foreground (Debug Mode)
docker run -p 8000:8000 <image-name>

--------------------------------------------------

## 6. Execute Commands Inside Container

### Enter Container
docker exec -it <container-id> bash

### Run Command Inside Container
docker exec <container-id> <command>

--------------------------------------------------

## 7. Networking

### Port Mapping
docker run -p <host-port>:<container-port> <image-name>

Example:
docker run -p 8000:8000 django-app

--------------------------------------------------

## 8. Docker System Cleanup

### Remove Unused Data
docker system prune

### Remove All (Images, Containers, Networks)
docker system prune -a

### Remove Volumes
docker volume prune

--------------------------------------------------

## 9. Docker Hub

### Login
docker login

### Tag Image
docker tag <image> <username>/<image>:<tag>

### Push Image
docker push <username>/<image>:<tag>

### Pull Image
docker pull <username>/<image>:<tag>

--------------------------------------------------

## 10. Useful Commands

### Check Running Processes
docker top <container-id>

### Inspect Container
docker inspect <container-id>

### Show Resource Usage
docker stats

--------------------------------------------------

## 11. Common Debug Flow

docker ps -a
docker logs <container-id>
docker run -p 8000:8000 <image-name>

--------------------------------------------------

## 12. Important Concepts

- Image = Blueprint
- Container = Running instance
- Dockerfile = Instructions to build image
- Port Mapping = Expose container to outside world
- Docker Daemon = Background service

--------------------------------------------------
