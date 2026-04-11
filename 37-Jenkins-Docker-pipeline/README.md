# Jenkins Docker Pipeline

A simple Jenkins pipeline to verify Docker agent configuration by running a Node.js container.

## What it does

* Uses Docker (`node:16-alpine`) as Jenkins agent
* Runs inside a container
* Prints Node.js version

## How to run

1. Create a Jenkins pipeline job
2. Connect this repository
3. Run the pipeline

## Output

Displays Node.js version in Jenkins console logs.

---

**Purpose:** Validate Docker-based CI pipeline setup in Jenkins.
