# Docker Volumes and Bind Mounts - Complete Notes

## 1. Introduction

Docker containers are temporary (ephemeral). When a container stops or is deleted, all the data inside it is lost.

This is a major problem for real applications where data is important, such as logs, user uploads, or database records.

Real-world analogy:
A container is like a temporary room. If the room is destroyed, everything inside it is gone.  
A volume is like a locker outside the room where you keep important items safely.

---

## 2. Core Concepts

### 2.1 Problem with Containers

- Containers do not have permanent storage
- Data is lost when container stops or is deleted
- Example:
  - Logs disappear
  - Files disappear
  - Database resets

---

### 2.2 Bind Mounts

Bind mounts connect a folder from your local system to a folder inside the container.

Structure:
host folder ↔ container folder

Example:
docker run -v /home/user/data:/app/data nginx

Key Points:
- Changes reflect both ways
- Useful for development
- Depends on host system paths
- Not portable
- Less secure

---

### 2.3 Docker Volumes

Volumes are managed by Docker and are the recommended way to store persistent data.

Key Points:
- Stored inside Docker system
- Independent of containers
- Survive container deletion
- Safer and more portable

Important Understanding:
Containers can be deleted, but volumes keep the data safe.

---

### 2.4 How Volume Works

When a volume is mounted:

Volume (krishna) ↔ /app/data (inside container)

- Any file written in `/app/data` is stored in the volume
- Any container using the same volume can access the data

---

### 2.5 Important Behavior

- Volume is empty initially
- Data is only stored if explicitly written
- Volume persists even after container stops

---

## 3. Important Commands

### Create Volume
docker volume create krishna

Creates a Docker-managed storage.

---

### List Volumes
docker volume ls

Shows all available volumes.

---

### Inspect Volume
docker volume inspect krishna

Shows internal details of the volume.

---

### Remove Volume
docker volume rm krishna

Deletes the volume and all its data permanently.

---

### Run Container with Volume
docker run -it --mount source=krishna,target=/app/data <image> bash

Explanation:
- source → volume name
- target → path inside container

---

### Flags Used

-d → run container in background  
-it → interactive terminal  

