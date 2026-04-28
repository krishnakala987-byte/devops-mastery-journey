# Jenkins + Docker CI/CD Learning (Hands-on)

This repository documents my complete hands-on journey of setting up Jenkins on AWS EC2, integrating Docker, and building real CI/CD pipelines using Docker agents. It includes setup, concepts, pipelines, issues faced, and key learnings.

---

## 1. What I Did (End-to-End)

- Created EC2 instance and connected via SSH  
- Installed Java (required for Jenkins)  
- Installed Jenkins and fixed installation issues  
- Accessed Jenkins UI via browser  
- Installed Docker on EC2  
- Configured Docker permissions for Jenkins  
- Connected Jenkins with GitHub  
- Created and executed Jenkins pipelines  
- Used Docker as Jenkins agent  
- Implemented single-stage pipeline  
- Implemented multi-stage multi-agent pipeline  
- Debugged real errors and fixed them  

---

## 2. Setup Steps

### Launch EC2 and Connect

```bash
ssh -i your-key.pem ubuntu@your-ec2-ip
```

---

### Install Java

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
```

Jenkins requires Java to run.

---

### Install Jenkins (Working Method)

```bash
wget https://pkg.jenkins.io/debian-stable/binary/jenkins_2.452.3_all.deb
sudo dpkg -i jenkins_2.452.3_all.deb
sudo apt-get install -f -y
```

---

### Start Jenkins

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

---

### Get Jenkins Admin Password

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Access Jenkins in browser:
http://<EC2-PUBLIC-IP>:8080

---

### Install Docker

```bash
sudo apt update
sudo apt install docker.io -y
```

---

### Start Docker

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

---

### Test Docker

```bash
sudo docker run hello-world
```

---

### Give Docker Permission to Jenkins

```bash
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
sudo reboot
```

This is required so Jenkins can run Docker commands.

---

## 3. Core Concepts (Simple Understanding)

### Jenkins
Automation tool used to run CI/CD pipelines.

---

### Pipeline
Sequence of steps:
- Build
- Test
- Deploy

---

### Agent
Defines where pipeline runs.

- agent any → anywhere  
- agent docker → inside container  

---

### Docker Agent
Jenkins creates a container to run the job.

Flow:
Create container → Run job → Delete container

---

### Ephemeral Containers
Containers are temporary:
- Created during execution  
- Deleted after execution  

---

### Multi-Stage Pipeline
Pipeline divided into stages.

---

### Multi-Agent Pipeline
Each stage runs in different container.

Example:
- Backend → Java/Maven  
- Frontend → Node  

---

### Important Understanding

Jenkins does not run applications permanently.

Jenkins is only for:
- Build
- Test
- Validation

---

### CI vs Production

CI (Jenkins):
- Temporary containers  
- Runs for seconds  
- Used for testing  

Production:
- Permanent containers  
- Runs continuously  
- Serves users  

Important line:
Jenkins builds, Kubernetes runs.

---

## 4. Jenkins Pipelines

### 4.1 Docker Agent Pipeline

```groovy
pipeline {
  agent {
    docker { image 'node:16-alpine' }
  }
  stages {
    stage('Test') {
      steps {
        sh 'node --version'
      }
    }
  }
}
```

What happens:
- Jenkins pulls Node image  
- Creates container  
- Runs command  
- Deletes container  

---

### 4.2 Multi-Stage Multi-Agent Pipeline

```groovy
pipeline {
  agent none
  stages {
    stage('Back-end') {
      agent {
        docker { image 'maven:3.8.1-adoptopenjdk-11' }
      }
      steps {
        sh 'mvn --version'
      }
    }
    stage('Front-end') {
      agent {
        docker { image 'node:16-alpine' }
      }
      steps {
        sh 'node --version'
      }
    }
  }
}
```

What happens:

Stage 1:
- Maven + Java container created  
- Command runs  
- Container deleted  

Stage 2:
- Node container created  
- Command runs  
- Container deleted  

---

## 5. Key Understanding from Pipelines

- Only one image runs per stage  
- Maven image already contains Java  
- Containers are temporary  
- Each stage is isolated  
- No dependency conflicts  

---

## 6. Problems Faced & Fixes

### Java Not Found

Cause:
Java not installed  

Fix:
Installed OpenJDK 17  

---

### Jenkins Installation Error (GPG Issue)

Cause:
Repository key issue  

Fix:
Used .deb installation method  

---

### Docker Permission Denied

Error:
permission denied while connecting to docker.sock  

Cause:
Jenkins not in docker group  

Fix:

```bash
sudo usermod -aG docker jenkins
sudo reboot
```

---

### Jenkinsfile Not Found

Error:
Unable to find Jenkinsfile  

Cause:
- Wrong file name  
- Wrong path  

Fix:
- Use correct name: Jenkinsfile  
- Fix script path  

---

## 7. Mistakes & Things to Remember

- Jenkinsfile must have capital "J"  
- Always check console logs  
- Restart Jenkins after permission change  
- Docker containers are temporary  
- Each stage can have different environment  
- Do not expect containers to stay after execution  

---

## 8. Final Understanding

- Jenkins automates CI/CD  
- Docker provides isolated environments  
- Pipeline defines workflow  
- Agent defines execution environment  
- Docker agent runs jobs in containers  
- Multi-agent pipelines use different containers per stage  
- CI uses temporary containers  
- Production uses permanent containers  

---

## 9. What I Learned

- Complete Jenkins setup from scratch  
- Docker integration with Jenkins  
- Writing Jenkins pipelines  
- Using Docker agents  
- Multi-stage pipeline execution  
- Debugging real issues  

---

## 10. Next Steps

- Build real application pipeline  
- Create Docker image  
- Push to DockerHub  
- Deploy using Kubernetes  

---

This file represents my complete hands-on learning and practical implementation of Jenkins and Docker in CI/CD.
