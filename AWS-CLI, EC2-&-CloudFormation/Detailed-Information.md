# AWS CLI, EC2 and CloudFormation – Detailed Notes and Revision Guide

## 1. Introduction

This document summarizes everything I learned related to:

- AWS CLI
- Connecting to EC2
- IAM access configuration
- CloudFormation basics
- Infrastructure as Code
- Errors faced and troubleshooting

This serves as a structured revision document.

---

# 2. Connecting to EC2 Instance

## Method 1: EC2 Instance Connect (Browser)

- No SSH setup required
- Uses browser-based terminal
- Quick and simple
- Not ideal for automation

## Method 2: SSH from Local Terminal

Steps followed:

1. Downloaded key pair (.pem file)
2. Set permission:

   chmod 400 keyname.pem

   Reason:
   SSH requires private key file to have restricted permissions.
   If permissions are open, connection fails.

3. Connected using:

   ssh -i "keyname.pem" ec2-user@<Public-IP>

Important:
- Amazon Linux uses ec2-user
- Ubuntu uses ubuntu

---

# 3. AWS CLI

## Why CLI is Important

- Faster than UI
- Scriptable
- Used in CI/CD
- Foundation for automation
- Preferred in DevOps

---

## AWS CLI Installation

Verified installation:

aws --version

---

## AWS CLI Configuration

Command:

aws configure

Required inputs:

- AWS Access Key ID
- AWS Secret Access Key
- Default region
- Default output format

Verified using:

aws sts get-caller-identity

If configuration fails:
- Check credentials
- Check region
- Check IAM permissions

---

# 4. IAM Access Keys

Generated from IAM console.

Important points:

- Access Key ID and Secret Access Key are sensitive
- Never commit them to GitHub
- Prefer IAM roles in production

---

# 5. Basic CLI Commands Practiced

List S3 buckets:

aws s3 ls

Describe EC2 instances:

aws ec2 describe-instances

List IAM users:

aws iam list-users

Learned to use:

--query
--output table
--output json

---

# 6. AWS CloudFormation (CFT)

## What is CloudFormation?

AWS service that allows infrastructure creation using templates.

Instead of manually creating resources:
- Write template (YAML/JSON)
- Create stack
- AWS provisions resources automatically

---

## Template

Defines resources such as:

- EC2
- S3
- VPC
- Security Groups

---

## Stack

Stack = Group of resources managed as one unit.

If stack is deleted, all resources inside are deleted.

Command to create:

aws cloudformation create-stack

Command to delete:

aws cloudformation delete-stack

---

# 7. CLI vs UI vs CloudFormation

| Feature | Console | CLI | CloudFormation |
|----------|----------|------|----------------|
| Manual creation | Yes | Yes | No |
| Automation | No | Yes | Yes |
| Group resource tracking | No | No | Yes |
| One-command deletion | No | No | Yes |
| Production recommended | No | Limited | Yes |

---

# 8. Errors and Troubleshooting

## SSH Permission Error

Cause:
.pem file has open permissions.

Fix:
chmod 400 key.pem

---

## AWS CLI Not Configured

Error:
Unable to locate credentials.

Fix:
Run aws configure.

---

## Wrong Region

Cause:
Default region not matching resource region.

Fix:
Check using aws configure list.

---

## Access Denied

Cause:
IAM user missing permissions.

Fix:
Attach proper IAM policy.

---

# 9. Important Revision Notes

- CLI is built on AWS APIs
- Every CLI command calls an AWS API
- Region matters in all AWS operations
- Access keys must be protected
- CloudFormation simplifies lifecycle management
- Automation reduces manual errors
- Stack deletion removes all grouped resources
- SSH requires correct key permissions

---

# 10. DevOps Perspective

Manual UI usage helps understanding.

CLI builds automation mindset.

CloudFormation introduces Infrastructure as Code.

Real production environments rely on:

- CLI scripting
- CloudFormation or Terraform
- IAM roles
- CI/CD pipelines

