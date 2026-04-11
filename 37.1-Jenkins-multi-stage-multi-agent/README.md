# Multi-Stage Multi-Agent Jenkins Pipeline

## Overview

This project demonstrates a Jenkins pipeline where each stage runs in a separate Docker container using different environments.

## What it does

* Backend stage runs in a Maven + Java container
* Frontend stage runs in a Node.js container
* Each stage uses its own isolated environment

## Workflow

1. Jenkins starts the pipeline
2. Backend stage runs in `maven:3.8.1-adoptopenjdk-11`
3. Frontend stage runs in `node:16-alpine`
4. Containers are created and destroyed automatically

## Output

* Displays Maven version (backend stage)
* Displays Node.js version (frontend stage)

## Purpose

* Demonstrate multi-stage pipelines
* Show use of multiple Docker agents
* Simulate real-world CI/CD environments

---

**Key Concept:** Each stage runs in its own container (isolated execution).
