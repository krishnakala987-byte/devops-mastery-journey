# CI/CD Detailed Notes

## 1. Introduction

CI/CD stands for Continuous Integration and Continuous Delivery/Deployment.

It is a process that automates the journey of code from a developer’s system to the end user.

Instead of manually testing, building, and deploying code, everything is handled automatically.

Real-world analogy:

Think of a food delivery system:
- Cooking → Writing code
- Taste testing → Unit testing
- Quality checking → Code analysis
- Full testing → Integration testing
- Delivery → Deployment

CI/CD is like an automated system where everything happens without manual effort.

---

## 2. Core Concepts

### Continuous Integration (CI)

Whenever a developer pushes code:
- Code is automatically tested
- Quality is checked
- Application is built

Goal:
Catch issues early and avoid broken code.

---

### Continuous Delivery / Deployment (CD)

After CI passes:
- Application is tested further
- Prepared for release
- Deployed to servers

Difference:
- Continuous Delivery → Manual approval before deploy
- Continuous Deployment → Fully automatic deploy

---

## CI/CD Pipeline Stages

### 1. Unit Testing

Tests small parts of code.

Example:

def add(a, b):
    return a + b

assert add(2,3) == 5

Purpose:
Catch bugs early.

---

### 2. Static Code Analysis

Code is checked without running it.

Checks:
- Syntax errors
- Code style
- Bad practices

---

### 3. Security / Vulnerability Testing

Checks:
- Vulnerable dependencies
- Security issues
- Secret leaks

---

### 4. Build Stage

Converts code into runnable format.

Examples:
- Java → .jar
- Node.js → build files
- Docker → image

Output:
Artifact

---

### 5. Integration / End-to-End Testing

Tests full system behavior.

Examples:
- Login functionality
- API responses
- Database connections

---

### 6. Reporting

Shows:
- Test results
- Success/failure status
- Coverage reports

---

### 7. Deployment

Application is deployed to:
- Servers
- Cloud platforms
- Kubernetes clusters

---

## CI/CD Flow

Developer → Push code → Pipeline runs → Tests → Build → Deploy → Users access app

---

## Legacy vs Modern CI/CD

### Legacy (Jenkins)

- Runs on servers
- Needs maintenance
- Hard to scale

---

### Modern CI/CD

Tools:
- GitHub Actions
- GitLab CI
- CircleCI

Features:
- Event-driven
- Uses containers
- Auto scaling
- No idle resources

---

## Event-Driven Concept

Pipeline triggers:
- Code push
- Pull request
- Merge

---

## 3. Important Commands / Syntax

Docker Build:
docker build -t myapp .

Docker Push:
docker push myapp

Kubernetes Deploy:
kubectl apply -f deployment.yaml

Explanation:
- docker build → creates image
- docker push → uploads image
- kubectl apply → deploys app
