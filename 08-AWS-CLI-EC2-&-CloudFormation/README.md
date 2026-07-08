# AWS CLI, EC2 and CloudFormation – DevOps Learning Notes

## Overview

This repository documents my practical learning related to:

- AWS CLI
- Connecting to EC2
- SSH authentication
- IAM Access Keys
- Basic AWS resource management
- AWS CloudFormation (Infrastructure as Code)

This work was done as part of my DevOps learning journey.

---

## Topics Covered

### 1. Introduction to the Session

- Understanding the importance of AWS CLI in DevOps
- Connecting to EC2 instances
- Introduction to AWS CloudFormation (CFT)
- Infrastructure as Code basics

---

### 2. Connecting to EC2 Instance

#### Method 1: AWS Console (EC2 Instance Connect)

- Used browser-based shell
- No local SSH setup required
- Useful for quick access

#### Method 2: SSH from Local Terminal

- Downloaded key pair (.pem file)
- Set correct permissions using:

  chmod 400 keyname.pem

- Connected using:

  ssh -i "keyname.pem" ec2-user@<Public-IP>

- Understood importance of key security and file permissions

---

### 3. AWS CLI

#### Installation

- Installed AWS CLI v2
- Verified using:

  aws --version

#### Configuration

- Generated IAM Access Keys
- Configured CLI using:

  aws configure

- Set:
  - Access Key ID
  - Secret Access Key
  - Default region
  - Output format (json)

- Verified configuration using:

  aws sts get-caller-identity

---

### 4. Basic AWS CLI Commands Practiced

- List S3 buckets:

  aws s3 ls

- Describe EC2 instances:

  aws ec2 describe-instances

- List IAM users:

  aws iam list-users

- Filter outputs using --query

---

### 5. AWS CloudFormation (CFT)

- Understood Infrastructure as Code (IaC)
- Learned what a template is (YAML / JSON)
- Understood Stack concept
- Created resources using CloudFormation template
- Compared manual creation vs template-based automation
- Understood stack creation and stack deletion

---

## Practical Outcomes

- Successfully configured AWS CLI
- Connected to EC2 via SSH
- Managed AWS resources using CLI
- Understood IAM Access Keys
- Created and deleted resources via CloudFormation
- Understood dependency handling in infrastructure

---

## Key Understanding

- CLI is faster and scriptable compared to UI
- SSH requires correct permissions
- Access keys must be protected
- CloudFormation manages grouped resources through stacks
- Automation is fundamental in DevOps
