## 4. Step-by-Step Project Implementation

### Step 1: Install KOPS

Download, make executable, and move to system path.

---

### Step 2: Setup IAM Permissions

Required permissions:
- EC2
- S3
- IAM
- VPC

---

### Step 3: Configure AWS CLI

aws configure

---

### Step 4: Create S3 Bucket

Used as state storage for KOPS.

---

### Step 5: Create Cluster Configuration

kops create cluster ...

At this stage:
- No resources created
- Only configuration stored in S3

---

### Step 6: Edit Configuration (Optional)

Reduce cost or change instance types.

---

### Step 7: Build Cluster

kops update cluster --yes

Now AWS resources are created.

---

### Step 8: Validate Cluster

Ensure cluster is working properly.

---

### Step 9: Delete Cluster (Important)

kops delete cluster --yes

---

### Step 10: Cleanup S3

Remove bucket after deleting cluster.

---

## 5. Problems Faced & Troubleshooting

### Problem: Confusion between create and update

Cause:
Misunderstanding commands

Solution:
- Create → config only
- Update → actual cluster creation

---

### Problem: Confusion about .local

Cause:
Lack of DNS understanding

Solution:
- .local → learning
- Real domain → production

---

### Problem: Cost concern

Cause:
AWS resources running

Solution:
- Always delete cluster after use
- Remove S3 bucket

---

## 6. Mistakes & Things to Remember ⚠️

- Do not forget to delete cluster (cost risk)
- .local is not used in production
- Always use small instance types for practice
- S3 bucket is mandatory for KOPS
- Check AWS region consistency
- create cluster does NOT create resources
- Always validate cluster after creation

---

## 7. Quick Revision Summary

- KOPS is used to create Kubernetes clusters on AWS
- S3 bucket stores cluster state
- Two steps:
  - Create → config
  - Update → actual cluster
- .local is for learning
- Route53 is used in production
- Always delete cluster to avoid cost
- Environment variables simplify commands

---
