## 1. Introduction

System administration is about managing and maintaining servers so that applications run smoothly.

In simple words:
- You control processes (running programs)
- Monitor system health (CPU, memory, disk)
- Manage networking (IP, connectivity)
- Handle storage (disk, volumes)

Real-world analogy:
Think of a server like a factory:
- Processes = workers
- CPU = machines
- Memory = workspace
- Disk = storage room
- Admin = you (manager)

---

## 2. Core Concepts

### Process Management

A process is simply a running program.

Example:
- When you open Chrome → a process starts
- When you run a script → a process is created

#### Viewing Processes

ps aux  
- Shows all running processes (user-friendly format)

ps -ef  
- Shows detailed process list (used in scripting/production)

#### Killing Processes

kill <PID>  
- Gracefully stops a process

kill -9 <PID>  
- Forcefully kills process (use carefully)

#### Process Priority

renice <priority> -p <PID>  
- Changes priority of running process  
- Lower value = higher priority

---

### Services vs Processes

- Process → temporary (runs manually)
- Service → starts automatically on boot

Example:
- nginx
- docker

#### Managing Services

systemctl start <service>  
systemctl stop <service>  
systemctl restart <service>  
systemctl status <service>  

---

### System Monitoring

Monitoring helps you understand system performance in real-time.

#### Real-Time Monitoring

top  
- Shows CPU, memory, running processes

htop  
- Better UI version of top (if installed)

#### Memory Usage

free -h  
- Shows RAM usage in human-readable format

#### CPU Info

nproc  
- Shows number of CPU cores

#### Disk Usage

df -h  
- Shows disk space usage

du -sh <folder>  
- Shows size of a directory

---

### Networking

Networking is a core skill for DevOps.

Important concepts (high-level):
- IP Address → identity of machine
- Subnet → group of IPs
- OSI Model → how data travels

Used for:
- Server communication
- Debugging
- Cloud infrastructure

---

### Disk Management

Used when you want to increase storage (especially in cloud like AWS).

Steps:
1. Add volume
2. Detect disk
3. Format disk
4. Mount disk

---

## 3. Important Commands / Syntax

List Block Devices  
lsblk  
- Shows available disks and partitions

Format Disk  
mkfs -t ext4 /dev/xvdf  
- Formats disk

Mount Disk  
mount /dev/xvdf /mnt  
- Attaches disk to directory

Verify  
df -h  
- Confirms mount
