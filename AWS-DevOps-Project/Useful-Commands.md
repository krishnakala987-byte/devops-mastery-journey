# -------------------------------
# AWS CLI BASIC COMMANDS
# -------------------------------

# List all S3 buckets
aws s3 ls

# Create a new S3 bucket
aws s3 mb s3://bucket-name

# Delete an empty S3 bucket
aws s3 rb s3://bucket-name

# Delete a bucket with contents
aws s3 rb s3://bucket-name --force

# List EC2 instances
aws ec2 describe-instances

# List Lambda functions
aws lambda list-functions

# List IAM users
aws iam list-users

# Check if AWS CLI is configured
aws configure list


# -------------------------------
# SCRIPT EXECUTION COMMANDS
# -------------------------------

# Make the script executable
chmod +x aws_resource_tracker.sh

# Run the script manually
./aws_resource_tracker.sh

# View generated report
cat aws_report_YYYY-MM-DD.txt

# List files in current directory
ls


# -------------------------------
# jq COMMANDS (JSON FILTERING)
# -------------------------------

# Extract S3 bucket names
aws s3api list-buckets | jq -r '.Buckets[].Name'

# Extract EC2 instance IDs
aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'

# Extract Lambda function names
aws lambda list-functions | jq -r '.Functions[].FunctionName'

# Extract IAM usernames
aws iam list-users | jq -r '.Users[].UserName'


# -------------------------------
# CRON AUTOMATION COMMANDS
# -------------------------------

# Edit cron jobs
crontab -e

# List current cron jobs
crontab -l

# Remove all cron jobs
crontab -r

# Example cron job (run script daily at 6 PM)
0 18 * * * /home/krishna/aws_resource_tracker.sh

# Run script every minute (for testing)
* * * * * /home/krishna/aws_resource_tracker.sh


# -------------------------------
# CRON SERVICE COMMANDS
# -------------------------------

# Check cron service status
systemctl status cron

# Start cron service
sudo systemctl start cron

# Stop cron service
sudo systemctl stop cron

# Restart cron service
sudo systemctl restart cron


# -------------------------------
# LOG MONITORING
# -------------------------------

# View cron logs
journalctl -u cron

# Monitor cron logs live
journalctl -u cron -f
