
## Git Branching Strategy – DevOps Learning Notes

This repository documents my learning journey while studying **Git Branching Strategy**, an important concept used in real-world DevOps environments and frequently asked in DevOps interviews.

The goal of this project is to clearly understand how development teams manage code changes using Git branches while working on large scale systems such as Kubernetes based applications.

This repository explains:

* What Git branches are
* Why branching strategies are used in organizations
* Feature branches
* Develop and main workflow
* Release branches
* Hotfix branches
* Merge conflicts
* Pull command usage

The concepts were explored using a **Kubernetes project style workflow**, similar to how large open-source projects manage thousands of contributors and frequent releases.

This repository serves as a **personal DevOps knowledge base** that I can revisit while preparing for interviews or while working on real projects.

---

## Basic Git Branching Workflow

Typical DevOps workflow:

feature → develop → main

Where:

* **feature branch** – developers build new features
* **develop branch** – integration and testing area
* **main branch** – stable production code

This workflow helps teams safely collaborate without breaking production systems.

---

## Common Git Commands Used

Create a feature branch

```
git checkout develop
git checkout -b feature/login
```

Push feature branch

```
git push origin feature/login
```

Pull latest changes

```
git pull origin develop
```

---

## Why This Repository Exists

As part of my **DevOps learning journey**, I am documenting important topics so that:

* I can revise them quickly
* Recruiters can see my understanding of real DevOps workflows
* It demonstrates my ability to learn industry practices

---

