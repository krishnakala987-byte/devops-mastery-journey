# AWS and DevOps Concepts – Detailed Notes

## Introduction

This document contains detailed explanations of the core AWS and DevOps concepts that form the foundation of modern cloud infrastructure.

The objective of these notes is to build a strong conceptual understanding of:

* Cloud infrastructure
* Networking in AWS
* Storage services
* Security and compliance
* Container orchestration
* Monitoring and logging systems

The focus is not only on definitions but also on **why these services exist, when they are used, and how they interact within real production systems**.

---

# 1. Amazon EC2

Amazon EC2 (Elastic Compute Cloud) provides virtual servers in the AWS cloud.

Instead of purchasing physical hardware, developers can launch virtual machines that run applications.

EC2 allows users to choose:

* operating system
* CPU configuration
* memory capacity
* storage

These virtual machines are called **instances**.

### Key EC2 Components

AMI (Amazon Machine Image)
A template that defines the operating system and preinstalled software.

Instance Type
Defines the hardware configuration such as CPU and memory.

Security Groups
Act as firewalls that control inbound and outbound traffic.

Key Pairs
Used for secure SSH access to EC2 instances.

Elastic IP
A static public IP address used for stable internet access.

### Use Cases

* hosting web applications
* backend APIs
* CI/CD servers
* container nodes

---

# 2. Amazon VPC

Amazon VPC (Virtual Private Cloud) allows users to create a private network within AWS.

All AWS resources such as EC2 instances run inside a VPC.

A VPC defines:

* IP address ranges
* network routing
* security rules

### CIDR Block

A CIDR block defines the IP address range of a VPC.

Example:

10.0.0.0/16

A /16 network allows **65,536 possible IP addresses**.

### Subnets

Subnets divide a VPC into smaller networks.

Two common types exist:

Public Subnet
Resources can access the internet.

Private Subnet
Resources are isolated from the internet.

### Internet Gateway

Allows communication between the VPC and the internet.

### NAT Gateway

Allows private instances to access the internet while preventing external access.

---

# 3. Amazon EBS

Amazon Elastic Block Store provides persistent storage for EC2 instances.

It behaves like a hard disk attached to a server.

Characteristics:

* persistent storage
* high performance
* supports snapshots

EBS volumes remain intact even when an EC2 instance stops.

---

# 4. Amazon S3

Amazon S3 is an object storage service designed for storing large amounts of data.

Data is stored as **objects inside buckets**.

Each object contains:

* the file itself
* metadata
* a unique key

### Use Cases

* storing images and videos
* application backups
* static website hosting
* log storage

S3 is designed for **high durability and scalability**.

---

# 5. IAM (Identity and Access Management)

IAM controls access to AWS resources.

It determines:

* who can access AWS
* what actions they can perform

### Core Components

Users
Represent individuals or applications.

Groups
Collections of users with shared permissions.

Policies
JSON documents that define permissions.

Roles
Temporary permissions assigned to AWS services.

IAM follows the **principle of least privilege**, meaning users should receive only the permissions necessary for their tasks.

---

# 6. AWS Lambda

AWS Lambda is a serverless compute service that runs code in response to events.

Developers upload code functions and AWS automatically executes them.

Examples of triggers:

* file uploads to S3
* API requests
* scheduled tasks
* database updates

Lambda automatically scales depending on the number of incoming requests.

---

# 7. AWS CodeBuild

AWS CodeBuild is a managed build service used in CI/CD pipelines.

It compiles source code, runs tests, and produces build artifacts.

Build instructions are defined in a file called **buildspec.yml**.

This service eliminates the need to maintain build servers.

---

# 8. AWS Config

AWS Config records configuration changes to AWS resources.

It helps answer questions like:

* who modified a resource
* when configuration changed
* whether a resource violates compliance rules

AWS Config supports automated compliance checks through **Config Rules**.

---

# 9. AWS CloudTrail

AWS CloudTrail logs every API call made in an AWS account.

It provides a complete history of actions such as:

* launching EC2 instances
* deleting resources
* modifying security groups

These logs are typically stored in Amazon S3.

CloudTrail is essential for auditing and security investigations.

---

# 10. AWS KMS

AWS Key Management Service manages encryption keys used to secure data.

It allows encryption of data stored in services such as:

* S3
* EBS
* RDS

KMS supports automatic key rotation and integrates with IAM for access control.

---

# 11. AWS Billing and Cost Management

AWS uses a pay-as-you-go model.

Costs are calculated based on resource usage.

Important tools include:

Cost Explorer
Analyzes spending patterns.

AWS Budgets
Sends alerts when spending reaches a defined threshold.

Understanding billing is important for cost optimization in cloud environments.

---

# 12. Container Technologies

Containers package applications and their dependencies into a portable unit.

Docker is the most widely used container platform.

Container orchestration systems manage large numbers of containers.

---

# 13. Amazon ECS

Amazon ECS is AWS’s native container orchestration service.

It manages container deployments, scaling, and networking.

Key components:

Cluster
A group of compute resources.

Task Definition
A configuration describing container requirements.

Task
A running instance of a container.

Service
Maintains a desired number of running containers.

---

# 14. Amazon EKS

Amazon EKS is a managed Kubernetes service.

It allows developers to run Kubernetes clusters without managing the control plane.

EKS is commonly used for large microservice architectures.

---

# 15. AWS Fargate

AWS Fargate is a serverless compute engine for containers.

It removes the need to manage EC2 instances.

Containers run directly on managed infrastructure.

---

# 16. ECS vs EKS

ECS is simpler and tightly integrated with AWS.

EKS uses Kubernetes and supports multi-cloud deployments.

ECS is typically used for simpler container workloads, while EKS is used for complex distributed systems.

---

# 17. ELK Stack

The ELK stack consists of:

Elasticsearch – search and analytics engine
Logstash – log processing pipeline
Kibana – visualization dashboard

It is widely used for centralized log analysis.

---

# 18. Prometheus and Grafana

Prometheus collects metrics from systems.

Grafana visualizes these metrics in dashboards.

Together they provide real-time monitoring of system performance.

---

# 19. Compliance Standards

Cloud systems often follow regulatory frameworks.

ISO 27001
International information security standard.

HIPAA
Protects healthcare data.

SOC 2
Ensures secure handling of customer information.

---

# Conclusion

Understanding these services provides the foundation required for modern DevOps and cloud engineering.

These technologies together enable organizations to build systems that are:

* scalable
* secure
* highly available
* observable
* cost efficient

This documentation serves as a long-term reference for revisiting core cloud concepts and understanding how different AWS services work together in real-world architectures.
