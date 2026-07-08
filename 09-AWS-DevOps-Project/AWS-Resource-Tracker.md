# AWS Resource Tracker – Complete Project Guide

## 1. Introduction

This project was built as part of my DevOps learning journey to understand automation using Shell scripting and AWS CLI.

In real-world environments, cloud resources are continuously created and deleted. Without proper visibility, unused resources may increase costs and reduce operational clarity.

The objective of this project was to build a lightweight automated monitoring solution using basic DevOps tools.

---

## 2. Problem Statement

Manual monitoring of AWS resources via AWS Console is inefficient and not scalable.

We need an automated system that:

- Retrieves AWS resource information
- Formats the data clearly
- Saves it for review
- Can run automatically on a schedule

---

## 3. Project Architecture

Shell Script  
→ AWS CLI  
→ AWS Services  
→ JSON Output  
→ jq Filtering  
→ Report File  
→ Cron Scheduler  

This demonstrates a real automation workflow.

---

## 4. Tools and Technologies

### Linux (Ubuntu)
Used as the working environment.

### Bash Shell Scripting
Used to automate AWS CLI commands and control execution flow.

### AWS CLI
Command-line tool to interact with AWS services.

Example:
```bash
aws s3api list-buckets
```

### jq
A JSON processor used to extract specific fields from AWS CLI JSON output.

Example:
```bash
jq -r '.Reservations[].Instances[].InstanceId'
```

### Cron
Linux scheduler used to automate execution of the script.

---

## 5. Script Explanation (Line-by-Line Concept)

### Shebang

```bash
#!/bin/bash
```

Tells the system to execute the script using Bash.

---

### Report File Creation

```bash
REPORT="$HOME/aws_report_$(date +%F).txt"
```

- `$HOME` = home directory
- `$(date +%F)` = current date (YYYY-MM-DD)
- Ensures unique report per day

This prevents overwriting old reports.

---

### Output Redirection

- `>` creates or overwrites file
- `>>` appends to file

Used to structure the report properly.

---

### AWS CLI Commands Used

#### S3 Buckets
```bash
aws s3api list-buckets
```

#### EC2 Instances
```bash
aws ec2 describe-instances
```

#### Lambda Functions
```bash
aws lambda list-functions
```

#### IAM Users
```bash
aws iam list-users
```

---

### JSON Filtering Using jq

AWS CLI returns complex JSON.

Example structure:

```json
{
  "Reservations": [
    {
      "Instances": [
        {
          "InstanceId": "i-123456"
        }
      ]
    }
  ]
}
```

To extract only InstanceId:

```bash
jq -r '.Reservations[].Instances[].InstanceId'
```

`-r` removes double quotes.

---

## 6. Why Save Output To File?

When scripts run automatically:

- No interactive terminal
- Output must be stored
- Reports can be reviewed later
- Historical tracking is possible

This simulates production monitoring systems.

---

## 7. Cron Integration

Cron is used to automate execution.

Example entry:

```bash
0 18 * * * /home/krishna/aws_resource_tracker.sh
```

Meaning:
Run daily at 6 PM.

Cron eliminates manual execution.

---

## 8. Implementation Steps Followed

1. Installed AWS CLI
2. Configured credentials using `aws configure`
3. Installed jq
4. Tested AWS CLI commands individually
5. Built initial script
6. Integrated jq for filtering
7. Implemented file redirection
8. Created timestamped report
9. Tested script manually
10. Created and tested S3 bucket
11. Deleted resources to avoid cost
12. Integrated cron automation

---

## 9. What I Learned

- How AWS CLI communicates with AWS services
- Understanding JSON structure
- Extracting nested fields using jq
- Bash scripting fundamentals
- Output redirection concepts
- Cron scheduling
- Importance of automation in DevOps

---

## 10. Real-World Relevance

This project demonstrates:

- Cloud monitoring automation
- DevOps scripting skills
- Infrastructure visibility
- Lightweight governance practices

It reflects practical, hands-on cloud automation experience.

---

## 11. Possible Enhancements

Future improvements could include:

- Filtering EC2 by running/stopped state
- Detecting unused EBS volumes
- Uploading reports to S3
- Sending reports via email
- Generating HTML reports
- Integrating with monitoring dashboards

---

## 12. Final Understanding

This project connects multiple core DevOps concepts:

Shell Scripting + AWS CLI + JSON Parsing + Automation + Scheduling

It represents a foundational automation workflow in cloud environments.
