# Shell Scripting for DevOps - Part 02  
## AWS Resource Monitoring Automation

## Introduction

This session focused on combining AWS CLI with Shell Scripting to build a practical automation tool.

The goal was to solve a real-world DevOps problem:
Unused AWS resources increase cloud costs significantly.

Instead of manually checking AWS Console every day, I automated the process.

---

# Problem Understanding

In large companies:
- Multiple developers create resources
- Temporary test environments are forgotten
- S3 buckets, EC2 instances, Lambdas remain active
- AWS bills increase

Manual checking is inefficient.

Automation is required.

---

# Prerequisites

1. AWS CLI installed
2. Configured using:

aws configure

Requires:
- Access Key
- Secret Key
- Region
- Output format

3. IAM Permissions required:
- s3:ListAllMyBuckets
- ec2:DescribeInstances
- lambda:ListFunctions
- iam:ListUsers

Best practice:
Use ReadOnlyAccess policy.

---

# Installing jq

AWS CLI outputs JSON.
JSON is difficult to read in raw format.

Installed jq:

Amazon Linux:
sudo yum install jq -y

Ubuntu:
sudo apt install jq -y

jq helps extract specific values from JSON.

---

# Writing the Script

Script Name:
aws_resource_list.sh

---

## Step 1: Shebang and Metadata

#!/bin/bash
# Author: Krishna
# Version: v1
# Purpose: Report AWS resource usage

---

## Step 2: Debug & Safe Mode

set -x
set -e

set -x:
Prints each command before executing.
Useful for debugging.

set -e:
Stops script if any command fails.
Prevents partial execution.

---

# Listing Resources

## S3 Buckets

aws s3 ls

Lists all buckets in account.

---

## EC2 Instance IDs

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

Without jq:
Output is large JSON.

With jq:
Extract only Instance IDs.

---

## Lambda Functions

aws lambda list-functions

Can refine using jq:

aws lambda list-functions | jq '.Functions[].FunctionName'

---

## IAM Users

aws iam list-users | jq '.Users[].UserName'

---

# Output Redirection

Instead of printing on screen:

./aws_resource_list.sh > resource_report.txt

This creates report file.

Can be:
- Stored
- Sent via email
- Uploaded to S3

---

# Automation using Cron

Crontab edit:

crontab -e

Example to run daily at 11 PM:

0 23 * * * /home/ec2-user/aws_resource_list.sh > /home/ec2-user/resource_report.txt

Cron Format:

* * * * *
| | | | |
| | | | +-- Day of week
| | | +---- Month
| | +------ Day of month
| +-------- Hour
+---------- Minute

Important:
Use full path in cron jobs.

---

# Common Errors Faced

1. aws command not found
Reason:
AWS CLI not installed or PATH not set.

2. Permission denied
Reason:
Script not executable.
Solution:
chmod +x aws_resource_list.sh

3. jq not found
Reason:
jq not installed.

4. Cron not running script
Reason:
Cron runs in limited environment.
Solution:
Use full path for aws and jq if required.

---

# Enhancements I Can Add Later

- Add email notification
- Add resource count summary
- Check stopped EC2 instances separately
- Check unattached EBS volumes
- Detect unused Elastic IPs
- Upload report to S3 automatically

---

# DevOps Importance

This project demonstrates:

- Cost optimization
- Monitoring automation
- AWS CLI usage
- JSON parsing
- Cron scheduling
- Linux scripting
- IAM permission understanding

This is a strong interview example.

When asked:
"What have you automated?"

I can answer:
"I built a shell-based AWS resource monitoring tool that tracks S3, EC2, Lambda, and IAM resources and generates daily reports using Cron."

---

# Key Learnings

- AWS CLI integrates easily with shell scripting.
- jq is powerful for JSON filtering.
- Automation saves money.
- Cron is essential for scheduled tasks.
- IAM permissions must be properly configured.
- Debugging using set -x and set -e improves script reliability.

---

# Conclusion

This project moved me from basic shell scripting to real-world DevOps automation.

It connects:
Linux + AWS CLI + IAM + Cron + JSON parsing.

This is a practical production-level automation example.
