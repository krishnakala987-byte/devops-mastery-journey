# Terraform AWS EC2 Demo (DevOps Learning)

## Overview

This repository contains my hands-on learning of Terraform, where I implemented Infrastructure as Code (IaC) to provision AWS resources. The project focuses on understanding Terraform fundamentals along with real-world debugging and best practices.

## Topics Covered

* Infrastructure as Code (IaC)
* Terraform workflow (init, plan, apply, destroy)
* AWS provider configuration
* Dynamic AMI using data source
* Terraform state file
* Remote backend concept (S3 + DynamoDB)
* Modules and environment separation (dev, stage, prod)

## Project Implementation

* Created a Terraform configuration to launch an AWS EC2 instance
* Configured AWS CLI authentication
* Used dynamic Ubuntu AMI instead of hardcoded values
* Executed Terraform lifecycle commands
* Debugged real-time errors during setup

## Commands Used

terraform init
terraform plan
terraform apply
terraform destroy

## Key Learnings

* Avoid hardcoding AMI IDs, use data sources
* Terraform state file is critical for tracking infrastructure
* Authentication setup is mandatory before running Terraform
* Default VPC issues can block resource creation
* Proper structure improves maintainability

## Project Structure

terraform-aws-ec2-demo/
main.tf
README.md
TERRAFORM_DETAILED_NOTES.md

## Next Goals

* Implement remote backend (S3 + DynamoDB)
* Use modules for reusable infrastructure
* Create dev/stage/prod environments
* Integrate Terraform with CI/CD

---

This project reflects my practical understanding of Terraform and DevOps fundamentals.
