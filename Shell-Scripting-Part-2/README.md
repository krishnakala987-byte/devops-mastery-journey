# Shell Scripting for DevOps - Part 02  
## AWS Resource Monitoring Automation using AWS CLI

## Objective

Built a real-world automation script to monitor AWS resources in order to prevent unnecessary cloud costs caused by unused services.

---

## Problem Statement

In large organizations:
- Developers create AWS resources
- Often forget to delete them
- Leads to high AWS bills

Manual checking in AWS Console is not scalable.

Solution:
Create a Shell Script that automatically lists AWS resources and generate reports daily using Cron.

---

## Resources Tracked

- S3 Buckets
- EC2 Instances
- Lambda Functions
- IAM Users

---

## Prerequisites

- AWS CLI installed
- AWS CLI configured using `aws configure`
- IAM user with ReadOnly or List/Describe permissions
- Linux environment (EC2 used for testing)
- jq installed for JSON parsing

---

## Script Name

aws_resource_list.sh

---

## Implementation Steps

### 1. Script Metadata
- Added shebang
- Added author, date, version

### 2. Debug & Safety
- set -x → Print commands while executing
- set -e → Exit if command fails

### 3. AWS Resource Listing

- List S3 Buckets
  - aws s3 ls

- List EC2 Instance IDs
  - aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

- List Lambda Functions
  - aws lambda list-functions

- List IAM Users
  - aws iam list-users

### 4. Output Redirection

Generated report file:

./aws_resource_list.sh > resource_report.txt

---

## Automation

Configured Crontab to run script daily at 11 PM.

Example:

0 23 * * * /home/ec2-user/aws_resource_list.sh > /home/ec2-user/resource_report.txt

---

## Outcome

- Built a cost monitoring automation tool
- Learned AWS CLI + Shell scripting integration
- Practiced JSON parsing using jq
- Understood cron-based scheduling
- Built interview-ready automation project
