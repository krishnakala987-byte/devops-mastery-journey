# Ansible JBoss Deployment (Hands-On DevOps Practice)

## Overview

This repository documents my hands-on learning journey with **Ansible automation and infrastructure provisioning on AWS**.
The goal of this project was to understand how configuration management tools like Ansible can automate software deployment across servers.

In this lab I used **Ansible to deploy and configure JBoss Application Server on an AWS EC2 instance**.

The work is based on a mentor-guided learning process combined with my own troubleshooting and experimentation.

---

## Technologies Used

* Ansible
* AWS EC2
* Linux (Ubuntu)
* SSH
* YAML
* JBoss Application Server

---

## Topics Covered

* Ansible Installation and Setup
* Ansible Inventory Configuration
* SSH Passwordless Authentication
* Ansible Ad-Hoc Commands
* Ansible Playbooks
* Ansible Roles
* Deploying JBoss using Ansible
* Troubleshooting real DevOps issues
* AWS Infrastructure setup

---

## Key Learning Outcomes

* Understood how Ansible communicates with remote servers using SSH
* Learned the difference between **Ad-Hoc commands and Playbooks**
* Built and executed a **production-style Ansible role**
* Practiced debugging real configuration issues between **CentOS-based automation and Ubuntu servers**
* Deployed JBoss server automatically using infrastructure automation

---

## Project Workflow

1. Launch AWS EC2 instance
2. Configure SSH key authentication
3. Install Ansible on control node
4. Create inventory file
5. Test connectivity using Ansible ping module
6. Execute Ansible playbooks
7. Deploy and configure JBoss server
8. Troubleshoot compatibility issues

---

## Example Command

```bash
ansible-playbook -i hosts site.yml
```


---

## What This Project Demonstrates

This repository shows my ability to:

* Work with **Infrastructure as Code**
* Use **Ansible for configuration management**
* Deploy applications in **cloud environments**
* Debug automation failures
* Understand real DevOps workflows

---

## Author

Krishna Kala
DevOps Learner | Cloud & Automation Enthusiast
