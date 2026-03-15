
This repository documents my **hands-on DevOps learning journey**.
Day 15 focuses on **Configuration Management using Ansible**, including installation, SSH authentication, inventory management, ad-hoc commands, playbooks, and roles.

The goal of this repository is to maintain **clean learning documentation and real practice commands** so that the concepts remain clear in the future and demonstrate practical DevOps knowledge to recruiters.

---

# Topics Covered

### 1. Configuration Management

Understanding how large infrastructures manage and maintain **consistent server configurations** automatically.

### 2. Why Configuration Management is Required

Traditional manual server management becomes impossible as infrastructure grows from **few servers to hundreds or thousands**, especially with **Cloud and Microservices architectures**.

### 3. Introduction to Ansible

Ansible is a **configuration management and automation tool** widely used in the DevOps ecosystem.

Key characteristics:

* Agentless architecture
* Push-based model
* Uses simple YAML syntax
* Easy integration with cloud platforms like AWS

### 4. Installing Ansible

Installing Ansible on a Linux control node and verifying installation.

### 5. Passwordless SSH Authentication

Setting up SSH key-based authentication so the Ansible control node can communicate with target servers without password prompts.

### 6. Inventory Management

Defining and grouping servers in an **inventory file** to manage multiple systems easily.

### 7. Ad-Hoc Commands

Running quick one-line commands to perform tasks like:

* Checking connectivity
* Running system commands
* Creating files
* Checking disk usage

### 8. Ansible Playbooks

Writing YAML-based automation scripts to execute **multiple configuration tasks automatically**.

Example:

* Installing packages
* Starting services
* Managing system configuration

### 9. Ansible Roles

Organizing automation in a structured and reusable way using **Ansible roles**.

---

# Architecture Used

Control Node (Ansible Installed)

↓ SSH Connection

Managed Nodes (Target Servers)

---

# Key DevOps Concepts Learned

Configuration Management
Agentless Architecture
Push vs Pull Model
Infrastructure Automation
YAML based automation
Server grouping using inventory

---

# Tools Used

AWS EC2
Linux (Ubuntu)
Ansible
SSH
YAML

---

# Learning Outcome

By completing this hands-on session I learned:

* How to install and configure Ansible
* How to automate server configuration
* How to manage multiple servers using inventory
* The difference between ad-hoc commands and playbooks
* How to structure automation using roles

This repository is part of my **DevOps learning journey and portfolio**.
