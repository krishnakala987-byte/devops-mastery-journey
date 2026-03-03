# AWS Resource Tracker – Shell Scripting Project

## Project Overview

This project demonstrates how to automate AWS resource monitoring using Shell scripting, AWS CLI, jq, and Cron.

The script collects AWS resource information and generates a structured report file automatically.

---

## Technologies Used

- Linux (Ubuntu)
- Shell Scripting (Bash)
- AWS CLI
- jq (JSON processor)
- Cron (Job Scheduler)
- Amazon S3
- Amazon EC2
- AWS Lambda
- AWS IAM

---

## What This Project Does

- Connects to AWS using AWS CLI
- Retrieves:
  - S3 bucket names
  - EC2 instance IDs
  - Lambda function names
  - IAM user names
- Formats output using jq
- Generates a timestamped report file
- Automates execution using Cron

---

## Key Concepts Covered

- Shell script structure
- Variables in Bash
- Output redirection ( > and >> )
- JSON parsing with jq
- AWS CLI commands
- Linux cron job scheduling
- Automation mindset in DevOps

---

## Script Execution

Make script executable:

```bash
chmod +x aws_resource_tracker.sh
