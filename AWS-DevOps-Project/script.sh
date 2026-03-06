#!/bin/bash

# ---------------------------------------------------------
# AWS Resource Tracker
# Author: Krishna
# Description:
# This script collects information about AWS resources and
# generates a daily report file.
#
# Resources monitored:
# - S3 Buckets
# - EC2 Instances
# - Lambda Functions
# - IAM Users
#
# The script can be automated using cron.
# Example cron job (runs daily at 6 PM):
# 0 18 * * * /home/krishna/aws_resource_tracker.sh
# ---------------------------------------------------------

# Create report file with current date
REPORT="$HOME/aws_report_$(date +%F).txt"

# Add report header
echo "AWS Resource Report - $(date)" > "$REPORT"
echo "----------------------------------------" >> "$REPORT"

# ---------------------------------------------------------
# S3 Buckets
# ---------------------------------------------------------
echo "" >> "$REPORT"
echo "S3 Buckets:" >> "$REPORT"

aws s3api list-buckets | jq -r '.Buckets[].Name' >> "$REPORT"

# ---------------------------------------------------------
# EC2 Instances
# ---------------------------------------------------------
echo "" >> "$REPORT"
echo "EC2 Instances:" >> "$REPORT"

aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId' >> "$REPORT"

# ---------------------------------------------------------
# Lambda Functions
# ---------------------------------------------------------
echo "" >> "$REPORT"
echo "Lambda Functions:" >> "$REPORT"

aws lambda list-functions | jq -r '.Functions[].FunctionName' >> "$REPORT"

# ---------------------------------------------------------
# IAM Users
# ---------------------------------------------------------
echo "" >> "$REPORT"
echo "IAM Users:" >> "$REPORT"

aws iam list-users | jq -r '.Users[].UserName' >> "$REPORT"

# ---------------------------------------------------------
# Completion Message
# ---------------------------------------------------------
echo ""
echo "Report successfully generated."
echo "Report saved at: $REPORT"
