# Linux & Shell Scripting – Detailed Notes (Day 6)

## Introduction

This session connects AWS infrastructure with real DevOps automation. Until now, I was creating EC2 instances and connecting through AWS CLI. To automate inside servers, I must understand Linux.

Linux is not optional in DevOps. It is foundational.

---

## Why Linux is Essential for DevOps

1. Most EC2 instances run on Linux.
2. Docker is built around Linux.
3. Kubernetes nodes use Linux.
4. Automation is CLI-based.
5. Shell scripting enables automation.

Without Linux knowledge, DevOps automation is incomplete.

---

## Linux Terminal Basics Practiced

### pwd
Used to check current working directory.

### ls
Lists files and directories.

### ls -ltr
- Long listing format
- Sorted by time
- Reverse order
Used to identify recently created or modified files.

### cd
Changes directory.

### mkdir
Creates a new folder.

### touch
Creates an empty file.

### vim / vi
Terminal-based text editor.
- Press `i` for insert mode.
- Press `Esc`
- Type `:wq` to save and quit.

Common mistake:
Forgetting to press Esc before typing `:wq`.

---

## File Permissions and Ownership

Every file has:
- r (read)
- w (write)
- x (execute)

Example format:
-rw-r--r--

### chmod

Used to change permissions.

Example:
chmod 400 key.pem  
Used to secure private key before SSH login.

chmod 777 folder  
Gives full permissions (not recommended in production).

Common error:
Permission denied while running script.

Solution:
chmod +x script.sh

---

## chown

Used to change file ownership.

Example:
chown ec2-user file.txt

Important when switching between root and normal user.

---

## sudo

Super User Do.

Used when command requires administrative privileges.

Example:
sudo systemctl start docker

Without sudo:
Permission denied error.

---

## Process Management & Monitoring

### top
Real-time CPU and memory usage monitoring.

### df -h
Shows disk usage in human-readable format.

### free -m
Shows RAM usage in MB.

Difference:
- df -h → Disk space
- free -m → Memory usage

### ps -ef
Displays all running processes.

### grep
Search for specific processes or text.

Example:
ps -ef | grep nginx

Very useful for checking running services.

---

## Introduction to Shell Scripting

Shell script = file containing multiple Linux commands executed sequentially.

Must start with:

#!/bin/bash

This line is called the shebang.
It defines the interpreter.

---

## Simple Automation Script Created

Example:

#!/bin/bash
mkdir project
touch file.txt
mv file.txt project/
echo "Task completed"

Steps performed:
1. Created directory.
2. Created file.
3. Moved file.
4. Printed success message.

Made executable using:
chmod +x script.sh

Executed using:
./script.sh

---

## Important AWS DevOps Commands

### ssh
Used to connect to EC2 instance.

Example:
ssh -i key.pem ec2-user@public-ip

Common error:
Permission denied (publickey)

Solution:
chmod 400 key.pem

---

### sudo systemctl

Used to manage services.

Examples:
sudo systemctl start docker
sudo systemctl stop nginx
sudo systemctl status jenkins

---

### grep and awk

Used for searching and filtering logs.

Example:
cat app.log | grep error

Important for production debugging.

---

## Errors Faced and Troubleshooting

1. Permission denied while running script  
   → Solution: chmod +x script.sh

2. Permission denied (publickey) during SSH  
   → Solution: chmod 400 key.pem

3. Command not found  
   → Check installation or PATH variable

4. Service not starting  
   → Check using:
   sudo systemctl status service-name

---

## Key Learning Outcomes

- Linux is backbone of DevOps.
- File permissions are critical in AWS environments.
- System monitoring is essential for troubleshooting.
- Shell scripting enables automation.
- CLI is more efficient than GUI for DevOps tasks.

---

## Areas to Improve

- Loops in shell scripting
- Conditional statements
- Writing real-world automation scripts
- Log analysis using grep and awk
- Cron job scheduling

---

## Conclusion

This topic builds the foundation for Docker, Jenkins, Kubernetes, and CI/CD pipelines. Mastering Linux and Shell Scripting improves automation skills and troubleshooting confidence.

Consistency and practice are essential to gain real proficiency.
