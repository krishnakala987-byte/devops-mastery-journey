# GitHub Actions 

## Introduction

In this part of my DevOps journey, I explored GitHub Actions and understood how it helps automate the development process. Earlier I was learning Jenkins, and now I can clearly see how GitHub Actions simplifies many things by being directly integrated with GitHub.

---

## What I Understood About GitHub Actions

GitHub Actions is basically a CI/CD tool inside GitHub.
It helps automate tasks like:

* running tests
* building applications
* deploying code

The best part is that everything happens inside the repository itself, so no need to set up a separate server like Jenkins.

---

## Core Concepts (My Understanding)

### 1. Events (Triggers)

This is what starts the workflow.

Example:

* When I push code → workflow starts
* When I create a pull request → workflow starts

So basically:
**Event = When to run automation**

---

### 2. Workflow

Workflow is the main file where everything is written.

It is stored inside:

```
.github/workflows/
```

This file is written in YAML and defines the complete pipeline.

---

### 3. Jobs

A workflow can have multiple jobs.

Each job:

* runs on a machine (called runner)
* can run parallel or sequential

---

### 4. Steps

Steps are the actual commands.

For example:

* checkout code
* install dependencies
* run tests

So in simple words:
**Steps = actual work being done**

---

## My First Understanding of a Pipeline

When I push code:

1. GitHub detects the event
2. It creates a virtual machine
3. Runs all the steps one by one
4. Shows success or failure

This helped me understand how automation actually works in real projects.

---

## About Runners

Runner is the machine that executes the workflow.

Types I learned:

* GitHub-hosted (auto created, easy to use)
* Self-hosted (our own machine, more control)

---

## Secrets (Important Learning)

We should never put passwords or API keys directly in code.

Instead, GitHub provides Secrets:

* stored securely in repository settings
* used inside workflow when needed

This is important for real-world projects.

---

## GitHub Actions vs Jenkins (My Clarity)

After learning both, here is what I understood:

* Jenkins requires setup and maintenance
* GitHub Actions works directly inside GitHub
* Jenkins gives more control
* GitHub Actions is simpler and faster to start

So:

* For beginners or GitHub projects → GitHub Actions is easier
* For complex enterprise setups → Jenkins is still useful

---

## Biggest Confusion I Cleared

Earlier I was confused about one thing:

"If the runner machine is destroyed after execution, how does the app run?"

Now I understand:

* Runner is only for build/test
* The actual app is deployed somewhere else (server/cloud)

---

## Overall Learning

GitHub Actions made CI/CD easier for me to understand because:

* no setup required
* everything is inside GitHub
* simple YAML configuration

This is an important step in my DevOps learning, and I feel more confident about automation now.

---

## Next Step

Next, I plan to:

* connect this with Docker
* build a complete CI/CD pipeline
* deploy applications automatically

---

## Author

This is part of my personal DevOps learning journey where I am trying to understand concepts deeply and practically.
