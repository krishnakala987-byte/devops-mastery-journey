# Linux & Shell Scripting – DevOps Zero to Hero (Day 6)

## Overview
This module bridges the gap between basic AWS infrastructure and the automation required for DevOps. The focus of this session was understanding Linux fundamentals and getting introduced to Shell Scripting.

---

## 1. Introduction & Context
- Recap of AWS CLI, EC2 connections, and CloudFormation basics.
- Understanding why Linux is essential before moving into automation.
- Learning how operating system knowledge connects to DevOps workflows.

---

## 2. Why Linux for DevOps
- Most enterprise servers run on Linux.
- AWS EC2 instances are primarily Linux-based.
- Docker containers use Linux.
- Open-source, secure, and customizable.
- CLI is more powerful than GUI for automation tasks.

---

## 3. Getting Started with Linux Terminal
Practiced commands on EC2 instance:

- `pwd`
- `ls`
- `ls -ltr`
- `cd`
- `mkdir`
- `touch`
- `vim` / `vi`
  - Insert mode
  - Save and exit using `:wq`

---

## 4. File Permissions & Ownership
- Understanding `rwx` (Read, Write, Execute)
- Using `chmod` (400, 777 use cases)
- Using `chown` (changing file ownership)
- Understanding `sudo`
- Root vs ec2-user concept

---

## 5. Process Management & System Monitoring
- `top`
- `df -h`
- `free -m`
- `ps -ef`
- `grep`
- Checking running services

---

## 6. Introduction to Shell Scripting
- What is a shell script
- Shebang (`#!/bin/bash`)
- Variables
- Basic automation script
- Making script executable (`chmod +x`)

---

## 7. Important AWS-Related Commands
- `ssh`
- `chmod 400` (for .pem keys)
- `sudo systemctl`
- `grep`
- `awk`

---

