# End-to-End CI/CD Pipeline with Jenkins, Argo CD, and Kubernetes

## Overview

This project demonstrates a complete CI/CD pipeline using Jenkins for Continuous Integration and Argo CD for Continuous Delivery, following GitOps principles. A simple Django-based to-do application is containerized, built, and deployed automatically to a Kubernetes cluster running on Minikube.

The pipeline is designed to minimize manual intervention by automating the build, image creation, and deployment processes.

---

## Architecture

The system is built around two repositories:

1. **Application Repository**

   * Contains the Django application code
   * Includes a Jenkinsfile for CI pipeline

2. **Manifest Repository**

   * Contains Kubernetes deployment and service YAML files
   * Acts as the source of truth for the cluster state

---

## Workflow

### Step 1: Code Change

A developer modifies the application (for example, updating UI text) and pushes changes to the application repository.

### Step 2: Jenkins Pipeline (CI)

Jenkins automatically triggers a pipeline defined in the Jenkinsfile. The pipeline performs the following actions:

* Clones the application repository
* Builds the application
* Creates a Docker image
* Pushes the image to Docker Hub
* Updates the Kubernetes manifest repository with the new image version

### Step 3: Git Update

The updated Kubernetes manifests are pushed to the manifest repository.

### Step 4: Argo CD Sync (CD)

Argo CD continuously monitors the manifest repository. When it detects changes:

* It pulls the updated configuration
* Synchronizes the Kubernetes cluster state
* Deploys the updated application automatically

### Step 5: Application Deployment

Kubernetes updates the running application. The new version becomes accessible through a NodePort service.

---

## Technology Stack

* **Backend**: Django (Python)
* **CI Tool**: Jenkins
* **Containerization**: Docker
* **CD Tool**: Argo CD
* **Orchestration**: Kubernetes (Minikube)
* **Version Control**: GitHub
* **Container Registry**: Docker Hub

---

## Kubernetes Setup

The application is deployed using Kubernetes manifests stored in the manifest repository. These include:

* Deployment configuration for running the application
* Service configuration (NodePort) to expose the application externally

To apply manifests manually:

```
kubectl apply -f deploy/
```

To check resources:

```
kubectl get pods
kubectl get svc
```

To access the application using Minikube:

```
minikube service todo-service
```

---

## Jenkins Pipeline

The Jenkins pipeline is declarative and defined inside the repository. It is responsible for:

* Automating build and packaging
* Managing Docker image lifecycle
* Updating deployment configurations in Git

The Jenkins Pipeline Syntax Generator is used to simplify pipeline creation and reduce manual configuration.

---

## Argo CD (GitOps)

Argo CD is used to implement GitOps-based deployment. It ensures that:

* The Kubernetes cluster always reflects the desired state defined in Git
* Any changes in the manifest repository are automatically deployed

Argo CD is configured through its UI, allowing easy setup without extensive manual coding.

---

## GitOps Approach

This project follows GitOps best practices by separating responsibilities:

* Application repository handles code and CI logic
* Manifest repository manages infrastructure and deployment configuration

Benefits:

* Clear separation of concerns
* Easy rollback using Git history
* Improved traceability and auditability
* No direct manual deployment to the cluster

---

## Live Update Demonstration

A simple change (such as modifying an HTML heading) triggers the full pipeline:

1. Code push
2. Jenkins build and image creation
3. Manifest update in Git
4. Argo CD sync
5. Updated application visible in browser

This demonstrates a fully automated deployment cycle.

---

## Key Concepts

* CI/CD pipeline automation
* Docker image build and registry usage
* Kubernetes deployment and service exposure
* GitOps workflow with Argo CD
* Separation of application and infrastructure repositories

---

## Conclusion

## This project provides a practical implementation of a modern DevOps pipeline using Jenkins and Argo CD. It demonstrates how automation, containerization, and GitOps can be combined to create a reliable, scalable, and maintainable deployment system.
