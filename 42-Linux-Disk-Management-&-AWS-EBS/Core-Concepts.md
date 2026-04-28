
# 1. Introduction

Disk management is one of the most important parts of Linux and DevOps. Every application, logs, and databases depend on storage.

In simple words:
Disk = where your system stores everything permanently.

Real-world analogy:
CPU = brain  
Memory = working table  
Disk = storage room  

If disk is not managed properly, systems can crash or lose data.

---

# 2. Core Concepts

## What is Mounting?

Mounting means attaching a disk to a directory so that we can use it.

Disk → Mount → Folder → Access

Without mounting:
- Disk exists
- But cannot be used

---

## What is /dev?

In Linux, everything is treated as a file.

All hardware devices are inside:
 /dev

Examples:
- /dev/xvda → root disk
- /dev/xvdf → attached EBS disk

---

## What is Filesystem?

Before using a disk, we must format it.

Examples:
Windows → NTFS  
Linux → ext4  

Formatting prepares the disk to store files.

---

## Why create a mount directory?

Linux does not use C, D drives like Windows.

Instead:
Disk → attached to folder

Example:
 /dev/xvdf → /data

/data becomes the access point.

---

## User vs Group (Ownership)

Format:
 user:group

Example:
 ubuntu:ubuntu

Owner = main controller  
Group = shared access  

---

## Buffer vs Cache

Buffer:
Temporary storage during data transfer

Cache:
Stores frequently used data for speed

---

## Process vs Service

Process:
Running program

Service:
Managed background process

---

# 3. Important Commands

## Disk Commands

lsblk  
Shows disks and partitions  

df -h  
Shows disk usage  

du -sh *  
Shows folder size  

---

## Format Disk

sudo mkfs.ext4 /dev/xvdf  

mkfs = make filesystem  
ext4 = filesystem type  
/dev/xvdf = disk  

---

## Mount Disk

sudo mount /dev/xvdf /data  

Attaches disk to folder  

---

## Create Directory

sudo mkdir /data  

Required because root directory needs admin permission  

---

## Change Ownership

sudo chown -R ubuntu:ubuntu /data  

chown = change owner  
-R = recursive  
ubuntu:ubuntu = user and group  

---

## fstab Configuration

sudo vim /etc/fstab  

Add this line:
 /dev/xvdf /data ext4 defaults 0 0  
