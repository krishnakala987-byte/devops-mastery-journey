# Terraform Learning + Hands-On Project 

## 1. Introduction

This document captures my complete learning of Terraform including:

* Core concepts
* Hands-on implementation
* Errors faced and troubleshooting
* Best practices followed

The objective was to understand how infrastructure can be managed using code in a real DevOps workflow.

---

## 2. What is Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is the process of managing infrastructure using code instead of manual steps.

Instead of creating resources manually in AWS Console, we define them in configuration files and Terraform provisions them automatically.

---

## 3. Terraform Workflow

Terraform follows a standard lifecycle:

terraform init
terraform plan
terraform apply
terraform destroy

Each command plays a specific role in provisioning and managing infrastructure.

---

## 4. Hands-On Project: AWS EC2 Instance

### Step 1: Create Project Directory

mkdir terraform-aws-ec2-demo
cd terraform-aws-ec2-demo

---

### Step 2: Create Terraform Configuration File

File name:

main.tf

---

### Step 3: Terraform Configuration Used

Below is the actual configuration used to provision an EC2 instance:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.x"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"   # Example region (can be changed)
}

# Fetch latest Ubuntu AMI dynamically
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]   # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create EC2 Instance
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"   # Free tier eligible

  tags = {
    Name = "terraform-demo-instance"
  }
}
```

---

### Step 4: Configure AWS Credentials

aws configure

Configured:

* Access Key → YOUR_ACCESS_KEY
* Secret Key → YOUR_SECRET_KEY
* Region → us-west-2

---

### Step 5: Initialize Terraform

terraform init

Purpose:

* Downloads AWS provider
* Prepares working directory

---

### Step 6: Preview Infrastructure

terraform plan

Purpose:

* Shows what Terraform will create before applying

---

### Step 7: Apply Configuration

terraform apply

Result:

* EC2 instance successfully created in AWS

---

## 5. Important Learning: Dynamic AMI

Initially used:

* Hardcoded AMI ID (not recommended)

Improved approach:

* Used `data "aws_ami"` to fetch latest Ubuntu image

Benefits:

* Always up-to-date
* No manual changes required
* Works across regions

---

## 6. Errors Faced and Troubleshooting

### Error 1: Authentication Failure

Error:
AWS was not able to validate credentials

Reason:

* AWS CLI not configured

Solution:
aws configure

---

### Error 2: No Default VPC

Error:
No default VPC found

Reason:

* Default VPC missing in AWS account

Solution:
aws ec2 create-default-vpc

---

### Error 3: Invalid AMI ID

Reason:

* Used outdated AMI

Solution:

* Switched to dynamic AMI using data source

---

## 7. Terraform State File

File:
terraform.tfstate

Purpose:

* Keeps track of infrastructure created by Terraform

Contains:

* Resource IDs
* Metadata
* Configuration state

Important Rules:

* Never edit manually
* Do not delete without understanding
* Do not commit to GitHub

---

## 8. Local vs Remote State

### Local State Issue

* Each user has different state file
* Causes conflicts

### Remote State Solution

* Store state in AWS S3

---

## 9. State Locking

Problem:

* Multiple users running Terraform simultaneously

Solution:

* Use DynamoDB for locking

---

## 10. Terraform Modules

Module = reusable Terraform code

Purpose:

* Reduce duplication
* Improve readability
* Standardize infrastructure

Example:

* EC2 module
* VPC module

---

## 11. Environments (Dev / Stage / Prod)

Dev → testing environment
Stage → pre-production testing
Prod → live environment

Purpose:

* Avoid breaking production systems
* Enable safe testing

---

## 12. Professional Project Structure

terraform-project/

modules/

* ec2/
* vpc/

environments/

* dev/
* stage/
* prod/

---

## 13. Best Practices Learned

* Use dynamic AMI instead of hardcoding
* Always configure AWS before Terraform
* Use remote backend for teams
* Enable state locking
* Separate environments
* Use modules for reusable code
* Never commit terraform.tfstate

---

## 14. Internal Working of Terraform

Terraform works by:

* Reading configuration files
* Creating execution plan
* Interacting with AWS APIs
* Managing resources using state file

---

## 15. Conclusion

This hands-on project helped in:

* Understanding Terraform workflow
* Creating real infrastructure
