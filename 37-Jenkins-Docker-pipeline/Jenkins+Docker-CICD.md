
## 1. Introduction

Jenkins is a CI/CD tool used to automate building, testing, and deploying applications.

In this setup, Docker is used with Jenkins so that every job runs inside a container instead of directly on the server.

Simple understanding:
Jenkins = Manager  
Docker = Temporary worker  

Jenkins creates a worker → does the task → removes it.

---

## 2. Core Concepts

### Jenkins Pipeline
A pipeline is a set of steps Jenkins follows to automate tasks like build, test, deploy.

---

### Agent
Agent defines where the pipeline runs.

- agent any → run anywhere
- agent docker → run inside container

---

### Docker Agent
Jenkins creates a container, runs the job, and deletes it.

This is called:
Ephemeral environment (temporary execution)

---

### Single Agent Pipeline
One container runs everything.

Problem:
Same environment for all stages.

---

### Multi-Stage Multi-Agent Pipeline
Each stage runs in a different container.

Example:
Backend → Java container  
Frontend → Node container  

---

### Important Concept

Each stage:
- Creates container
- Runs commands
- Deletes container

---

### CI vs Production

CI (Jenkins):
- Temporary containers
- Used for testing/building
- Destroyed after use

Production:
- Permanent containers
- Serve real users

Key line:
Jenkins builds, Kubernetes runs.

---

## 3. Important Commands / Syntax

### Install Java (Ubuntu)

sudo apt update
sudo apt install openjdk-17-jdk -y

Used because Jenkins requires Java.

---

### Install Jenkins (.deb method)

wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.452.3_all.deb
sudo dpkg -i jenkins_2.452.3_all.deb
sudo apt-get install -f -y

---

### Start Jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins

---

### Get Jenkins Password

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

---

### Install Docker

sudo apt update
sudo apt install docker.io -y

---

### Start Docker

sudo systemctl start docker
sudo systemctl enable docker

---

### Test Docker

sudo docker run hello-world

---

### Give Jenkins Docker Permission

sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
sudo reboot
