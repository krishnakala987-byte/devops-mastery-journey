# Ansible & JBoss Deployment

---

## 1. Introduction

Ansible is a tool used to automate tasks on servers.

Instead of manually logging into servers and running commands, Ansible allows us to control multiple servers from one machine.

Real-world example:
If you have 50 servers and want to install software on all of them, doing it manually is slow and error-prone.
With Ansible, you write one file and it does everything automatically.

---

## 2. Core Concepts

### Control Node

The machine where Ansible is installed and from where commands are executed.

### Managed Node (Target Server)

The server where tasks are executed (EC2 instance in our case).

### Inventory

A file that contains the list of servers.

Example:

```
[servers]
3.85.81.57
```

### SSH

Ansible connects to servers using SSH.

### Passwordless SSH

Instead of typing password every time, we use SSH keys.

---

### Ad-hoc Commands

Used for quick tasks.

Example:

```
ansible -i inventory all -m shell -a "touch devopsclass"
```

This creates a file on remote server.

---

### Playbooks

Playbooks are YAML files used for structured automation.

They define:

* hosts
* tasks
* modules

---

### Roles

Roles organize playbooks into reusable structure.

Command:

```
ansible-galaxy role init kubernetes
```

This creates folders:

* tasks → main logic
* handlers → triggered tasks
* files → static files
* templates → dynamic configs
* vars → variables
* defaults → default values
* meta → metadata
* tests → testing
* README.md → documentation

---

## 3. Important Commands

### Install Ansible

```
sudo apt update
sudo apt install ansible -y
```

---

### Check Version

```
ansible --version
```

---

### Test Connectivity

```
ansible all -i inventory -m ping
```

Output:

```
SUCCESS => ping: pong
```

---

### Run Ad-hoc Command

```
ansible -i inventory all -m shell -a "touch devopsclass"
```

---

### Run Playbook

```
ansible-playbook -i inventory first-playbook.yml
```

---

### SSH Login

```
ssh -i ansible-demo.pem ubuntu@IP
```

---

### Copy SSH Key

```
ssh-copy-id ubuntu@IP
```

---

## 4. Step-by-Step Project Implementation

### Step 1 – Launch EC2

* Create Ubuntu EC2 instance
* Enable public IP
* Allow ports:

  * 22 (SSH)
  * 8080 (JBoss)

---

### Step 2 – Connect to EC2

```
ssh -i ansible-demo.pem ubuntu@IP
```

---

### Step 3 – Setup Passwordless SSH

```
ssh-keygen
ssh-copy-id ubuntu@IP
```

---

### Step 4 – Create Inventory

```
[servers]
IP_ADDRESS
```

---

### Step 5 – Test Connection

```
ansible all -i inventory -m ping
```

---

### Step 6 – Run Ad-hoc Command

```
ansible -i inventory all -m shell -a "touch devopsclass"
```

---

### Step 7 – Create Playbook (Nginx)

* Install nginx
* Start service

---

### Step 8 – Run Playbook

```
ansible-playbook -i inventory first-playbook.yml
```

---

### Step 9 – Use JBoss Role (Mentor Repo)

* Clone repo
* Navigate to jboss-standalone
* Run:

```
ansible-playbook -i hosts site.yml
```

---

### Step 10 – Fix OS Compatibility

Original role used:

```
yum
```

But server was Ubuntu → needed:

```
apt
```

---

### Step 11 – Start JBoss

```
cd /usr/share/jboss-as/bin
./standalone.sh -b 0.0.0.0
```

---

### Step 12 – Access in Browser

```
http://IP:8080
```

---

## 5. Problems Faced & Troubleshooting

### Problem 1: Permission denied (publickey)

Cause:
Wrong SSH key or key not copied

Solution:

```
ssh-copy-id ubuntu@IP
```

---

### Problem 2: .pem file not found

Cause:
File not in current directory

Solution:
Check:

```
ls
```

or give full path

---

### Problem 3: Ansible UNREACHABLE

Cause:
SSH not working

Solution:
Fix SSH first

---

### Problem 4: apt/yum issue

Cause:
Playbook written for CentOS, server is Ubuntu

Solution:
Replace:

```
yum → apt
```

---

### Problem 5: apt lock error

Cause:
No sudo privileges

Solution:
Add:

```
become: yes
```

---

### Problem 6: Service not starting (init.d error)

Cause:
Old init scripts used in modern systemd OS

Solution:
Run JBoss manually:

```
./standalone.sh -b 0.0.0.0
```

---

### Problem 7: Website not opening

Cause:

* Port 8080 not open
* Service not running

Solution:

* Open port in security group
* Start JBoss

---

### Problem 8: SSH hanging (no error)

Cause:

* Security group missing SSH rule
* Network issue

Solution:
Allow port 22

---

## 6. Mistakes & Things to Remember

* Always check security group first
* Always test SSH before Ansible
* Do not mix yum and apt
* Always use correct key file
* Always open required ports
* Old scripts may not work on new OS
* Check logs carefully, error always tells problem

---

## 7. Quick Revision Summary

* Ansible automates server tasks
* Uses SSH for connection
* Inventory defines servers
* Ad-hoc = quick command
* Playbook = structured automation
* Roles = reusable structure
* AWS EC2 used as target server
* Always fix SSH before anything
* Debugging is key skill in DevOps

---

## Final Learning

This project helped understand:

* Real DevOps workflow
* Automation using Ansible
* Cloud server management
* Troubleshooting real issues

This is not just theory, but actual hands-on experience.
