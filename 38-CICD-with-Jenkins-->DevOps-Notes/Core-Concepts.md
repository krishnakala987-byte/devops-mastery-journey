# CI/CD with Jenkins - Detailed Notes

## 1. Introduction

CI/CD stands for Continuous Integration and Continuous Delivery/Deployment.

In simple terms:
- CI means automatically building and testing code whenever developers push changes
- CD means automatically deploying that code to servers

Real-world analogy:
Think of it like a factory:
- Developers write code (raw material)
- Jenkins is the assembly line
- Testing tools check quality
- Docker packs the product
- Kubernetes delivers it to users

Everything is automated so that delivery is fast, reliable, and consistent.

---

## 2. Core Concepts

### CI (Continuous Integration)
- Developers push code to repository (GitHub)
- Pipeline automatically starts
- Code is built and tested

Goal:
Catch bugs early and ensure code always works

---

### CD (Continuous Delivery/Deployment)
- After successful build and testing
- Code is deployed automatically

Delivery vs Deployment:
- Delivery: Manual approval before deployment
- Deployment: Fully automatic

---

### Jenkins

Jenkins is a CI/CD tool used to automate pipelines.

It acts as:
- Pipeline executor
- Automation engine

---

### CI/CD Pipeline Flow (Important)

Step-by-step flow:

1. Developer pushes code to GitHub
2. Webhook triggers Jenkins pipeline
3. Jenkins pulls latest code
4. Build process starts (Maven)
5. Tests are executed
6. Code quality check using SonarQube
7. Docker image is created
8. Image is pushed to registry
9. Deployment happens using Argo CD
10. Application runs on Kubernetes

This is the most important concept for interviews.

---

### Pipeline Triggers

There are 3 types:

#### Webhook (Recommended)
- GitHub sends signal to Jenkins instantly
- Real-time trigger
- Most efficient

#### Polling
- Jenkins keeps checking repo
- Wastes resources

#### Cron Job
- Runs at fixed intervals
- Not real-time

Conclusion:
Always prefer webhook

---

### Jenkins Backup

Jenkins stores everything inside .jenkins directory:
- Jobs
- Configurations
- Plugins

Backup methods:
- rsync
- Cloud storage (S3)
- VM snapshot

Important:
Always automate backups in production

---

### Secret Management

Never store passwords in code.

Use:
- Jenkins Credentials Manager
- HashiCorp Vault

How it works:
- Secrets are stored securely
- Injected into pipeline at runtime

---

### Shared Libraries

Used to reuse pipeline code.

Instead of writing same pipeline again and again:
- Create reusable functions
- Share across teams

Benefits:
- Cleaner code
- Standardization
- Easy maintenance

---

### Docker Agents

Pipelines can run inside Docker containers.

Example:
- Java build → Maven container
- Python build → Python container

Benefits:
- Consistent environment
- Supports multiple languages

---

### Auto Scaling (Advanced)

Jenkins workers can scale automatically.

How:
- Use AWS Auto Scaling

Benefits:
- Handles high workload
- Saves cost when idle

---

### JNLP (Java Network Launch Protocol)

Used for communication between:
- Jenkins controller (master)
- Jenkins agents (workers)

---

### Plugins

Plugins extend Jenkins functionality.

Common plugins:
- Git plugin
- Docker plugin
- Pipeline plugin
- SonarQube plugin
- Kubernetes plugin

Interview tip:
Always mention plugins to show hands-on experience

---

## 3. Important Commands / Syntax

### Example Jenkins Pipeline (Basic)

```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building application'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application'
            }
        }
    }
}
