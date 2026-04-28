## 1. Step-by-Step Project Implementation

### Project 1: Docker Agent Pipeline

Jenkinsfile:

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

Flow:
- Pull Node image
- Create container
- Run command
- Delete container

---

### Project 2: Multi-Stage Multi-Agent Pipeline

Jenkinsfile:

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

Flow:
Stage 1 → Java container → run → delete  
Stage 2 → Node container → run → delete  

---

## 5. Problems Faced & Troubleshooting

Problem: Java not found  
Cause: Java not installed  
Solution: Install OpenJDK 17  

---

Problem: Jenkins install GPG error  
Cause: Repo issue  
Solution: Use .deb installation  

---

Problem: Docker permission denied  
Cause: Jenkins not in docker group  
Solution:

sudo usermod -aG docker jenkins
sudo reboot

---

Problem: Jenkinsfile not found  
Cause:
- Wrong path
- Wrong case (jenkinsfile vs Jenkinsfile)

Solution:
- Rename to Jenkinsfile
- Fix script path

---

## 6. Mistakes & Things to Remember

- Jenkinsfile must be capital J
- Always check console logs
- Restart Jenkins after permission changes
- Containers are temporary
- Each stage can use different environment

---

## 7. Quick Revision Summary

- Jenkins automates CI/CD
- Docker runs jobs in containers
- Pipeline = steps
- Agent = execution environment
- Docker agent = container execution
- Multi-agent = different containers per stage
- CI containers are temporary
- Jenkins builds, Kubernetes runs
