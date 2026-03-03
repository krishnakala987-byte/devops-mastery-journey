# AWS Resource Tracker – Shell Scripting Automation Project

## Overview

This project demonstrates how to automate AWS resource monitoring using Bash scripting, AWS CLI, jq, and Cron.

The script connects to AWS, retrieves resource details, filters JSON output, and generates a timestamped report file. It can also be scheduled to run automatically using cron.

This project simulates real-world DevOps automation and cloud governance practices.

---

## Technologies Used

- Linux (Ubuntu)
- Bash Shell Scripting
- AWS CLI
- jq (JSON Processor)
- Cron Scheduler
- Amazon S3
- Amazon EC2
- AWS Lambda
- AWS IAM

---

## AWS Services Monitored

The script collects:

- S3 bucket names
- EC2 instance IDs
- Lambda function names
- IAM user names

---

## How It Works

1. Creates a report file with current date.
2. Uses AWS CLI to fetch resource data.
3. Parses JSON output using jq.
4. Saves formatted results into a text file.
5. Can be automated using cron.

---

## How To Run

Make the script executable:

```bash
chmod +x aws_resource_tracker.sh
```

Run manually:

```bash
./aws_resource_tracker.sh
```

---

## Cron Automation (Optional)

Edit cron jobs:

```bash
crontab -e
```

Add:

```bash
0 18 * * * /home/krishna/aws_resource_tracker.sh
```

This runs the script daily at 6 PM.

---

## Learning Outcome

- Practical AWS CLI usage
- JSON parsing with jq
- Shell scripting fundamentals
- Linux task automation
- DevOps monitoring mindset

---

This project reflects hands-on experience with automation in cloud environments.
