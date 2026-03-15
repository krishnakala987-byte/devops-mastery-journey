
The session covered both **theoretical concepts and hands-on implementation** on AWS EC2 instances.

---

# 1. The Problem with Traditional Server Management

In early infrastructure setups, system administrators managed servers manually.

Typical process:

1. Login into each server using SSH
2. Install packages manually
3. Configure services
4. Apply updates and patches

Example:

ssh ubuntu@server1
sudo apt update
sudo apt install nginx

This approach works when managing **few servers**, but modern infrastructures may contain:

* Hundreds of servers
* Microservices
* Auto-scaling cloud instances

Managing such environments manually becomes **time consuming, inconsistent, and error-prone**.

This challenge led to the development of **Configuration Management tools**.

---

# 2. What is Configuration Management?

Configuration Management is the process of **automatically maintaining servers in a desired state**.

Example desired state:

All servers must have:

* Docker installed
* Nginx installed
* Git installed
* Required users created
* Correct configuration files

Instead of manually configuring each server, configuration management tools apply these settings automatically.

Popular tools include:

* Ansible
* Puppet
* Chef
* SaltStack

Among these, **Ansible is widely used due to its simplicity**.

---

# 3. Introduction to Ansible

Ansible is an **open-source automation and configuration management tool** developed by RedHat.

It is used for:

* Server configuration
* Application deployment
* Infrastructure automation
* Cloud provisioning

---

# 4. Key Advantages of Ansible

## Agentless Architecture

Unlike Puppet or Chef, Ansible does not require installing agents on target machines.

Instead, it connects using:

Linux → SSH
Windows → WinRM

This makes Ansible easier to deploy and maintain.

---

## Push Model

Ansible uses a **push-based architecture**.

Control Node → pushes configuration → Target Servers

This means when a command or playbook runs, the control node pushes instructions to the managed nodes.

---

## Simple Language

Ansible uses **YAML**, which is very readable and easy to learn.

Example:

tasks:

* name: install nginx
  apt:
  name: nginx
  state: present

---

# 5. Ansible Architecture

Ansible architecture mainly consists of two components.

## Control Node

The machine where Ansible is installed.

This machine:

* Runs Ansible commands
* Stores playbooks
* Manages inventory
* Communicates with servers

Example:

AWS EC2 instance with Ansible installed.

---

## Managed Nodes

These are the servers that Ansible configures.

Examples:

Web servers
Database servers
Application servers

Ansible connects to these servers using **SSH**.

---

# 6. Installing Ansible

Update packages:

sudo apt update

Install Ansible:

sudo apt install ansible -y

Verify installation:

ansible --version

---

# 7. Passwordless SSH Authentication

To automate tasks across multiple servers, Ansible requires **passwordless authentication**.

Step 1 – Generate SSH key

ssh-keygen

This generates:

~/.ssh/id_rsa
~/.ssh/id_rsa.pub

Step 2 – Copy key to target server

ssh-copy-id ubuntu@SERVER_IP

Now login works without password:

ssh ubuntu@SERVER_IP

This allows Ansible to connect to servers automatically.

---

# 8. Inventory File

An inventory file defines **which servers Ansible should manage**.

Example inventory:

[web]
3.110.21.44
3.110.45.60

[db]
3.110.88.12

Grouping servers allows running tasks only on specific groups.

Example:

web servers
database servers

---

# 9. Testing Connectivity

Test connection with:

ansible all -i inventory -m ping

If successful, Ansible will return:

SUCCESS

This confirms the control node can reach the managed nodes.

---

# 10. Ad-Hoc Commands

Ad-hoc commands are **quick one-line commands** used for simple tasks.

Examples include:

Checking disk usage

ansible all -i inventory -a "df -h"

Creating files

ansible all -i inventory -m file -a "path=/tmp/test state=touch"

Ad-hoc commands are useful for quick operations but are not ideal for complex automation.

---

# 11. Ansible Playbooks

Playbooks are **automation scripts written in YAML**.

They allow execution of multiple tasks sequentially.

Example playbook:

* hosts: web
  become: yes

  tasks:

  * name: install nginx
    apt:
    name: nginx
    state: present

  * name: start nginx
    service:
    name: nginx
    state: started

Run playbook:

ansible-playbook -i inventory nginx.yml

This automatically installs and starts nginx on all web servers.

---

# 12. YAML Basics

YAML relies on indentation.

Correct indentation is essential.

Example:

tasks:

* name: install nginx
  apt:
  name: nginx
  state: present

Incorrect indentation may cause playbook errors.

---

# 13. Ansible Modules

Modules are prebuilt functions used by Ansible to perform tasks.

Examples:

apt → install packages
service → manage services
file → manage files
copy → copy files
user → manage users

Modules simplify automation tasks.

---

# 14. Ansible Roles

When playbooks grow large, they can become difficult to manage.

Roles provide a structured way to organize automation.

Create a role:

ansible-galaxy init nginx_role

Directory structure created:

roles/
nginx_role/
tasks/
handlers/
templates/
files/
vars/
defaults/

Roles make automation reusable and easier to maintain.

---

# 15. Dynamic Inventory

In cloud environments like AWS, servers may be created or destroyed automatically.

Dynamic inventory allows Ansible to automatically discover servers from cloud platforms such as:

AWS
Azure
GCP

This is useful in auto-scaling environments.

---

# 16. Ad-Hoc Commands vs Playbooks

Ad-Hoc Commands

* Quick tasks
* One-line commands
* Not reusable

Playbooks

* Structured automation
* YAML based
* Reusable and scalable

---

# 17. Real DevOps Workflow

Typical DevOps pipeline:

Developer pushes code → GitHub

CI/CD pipeline triggers

Terraform creates infrastructure

AWS EC2 instances launched

Ansible configures servers

Example configuration tasks:

Install Docker
Install Nginx
Deploy applications
Configure environment

---

# Conclusion

This session introduced the **core fundamentals of configuration management using Ansible** and demonstrated how automation can simplify server management at scale.

Key takeaways:

* Importance of configuration management
* Ansible architecture and advantages
* SSH-based automation
* Inventory management
* Ad-hoc commands
* Playbooks and roles
* YAML-based automation

These concepts form the foundation for **automating infrastructure in modern DevOps environments**.
