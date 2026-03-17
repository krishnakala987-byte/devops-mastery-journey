# Terraform Basics to Hands-On (DevOps Learning)

## Overview

This repository documents my learning journey of Terraform as part of DevOps preparation. It covers both theoretical understanding and hands-on implementation of Infrastructure as Code (IaC).

## Topics Covered

* Introduction to Infrastructure as Code (IaC)
* Problems with manual infrastructure and provider-specific tools
* Terraform fundamentals and workflow (init, plan, apply, destroy)
* Writing first Terraform configuration (main.tf)
* AWS authentication using CLI
* Dynamic AMI fetching using data sources
* Terraform state file concept
* Remote backend (S3) and state locking (DynamoDB)
* Terraform modules (reusable infrastructure)
* Environment separation (dev, stage, prod)
* Common errors and troubleshooting

## Hands-On Work

* Created first Terraform project to provision an EC2 instance
* Configured AWS CLI authentication
* Used dynamic Ubuntu AMI instead of hardcoded values
* Executed full Terraform lifecycle commands
* Debugged real-world errors (credentials, VPC issues)

## Key Learnings

* Never hardcode AMI IDs
* Always use remote backend for team environments
* State file is critical and should never be modified manually
* Modules help in writing reusable and clean infrastructure code
* Separate environments prevent production failures

## Next Steps

* Terraform variables and outputs
* Advanced modules
* CI/CD integration with Terraform
* Real-world multi-environment architecture

---

This repository reflects practical DevOps learning with a focus on real-world implementation.
