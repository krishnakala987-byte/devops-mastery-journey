# Git & GitHub – Detailed DevOps Learning Notes

## Introduction

Git is a distributed version control system used by developers and DevOps engineers to track changes in code and collaborate effectively.

In modern DevOps environments, Git plays a central role in:

* Source code management
* CI/CD pipelines
* Infrastructure automation
* Team collaboration

These notes document a complete practical learning session covering Git fundamentals, branching workflows, remote repositories, authentication, and conflict resolution.

---

# 1. Git Repository Initialization

The first step in any Git project is initializing a repository.

### Command

```
git init
```

### What happens internally

When this command runs, Git creates a hidden directory called:

```
.git
```

This directory stores:

* commit history
* branch information
* configuration
* object database

Example project structure after initialization:

```
project-folder/
│
├── files
└── .git
```

---

# 2. Tracking Files with Git

Git does not track files automatically.

Files must be staged before committing.

### Command

```
git add filename
```

or

```
git add .
```

This moves files to the **staging area**.

### Git Workflow

```
Working Directory → Staging Area → Repository
```

---

# 3. Committing Changes

A commit saves the current state of staged files.

### Command

```
git commit -m "message"
```

Example:

```
git commit -m "added login feature"
```

Each commit includes:

* snapshot of files
* author information
* commit message
* timestamp

---

# 4. Viewing Repository Status

### Command

```
git status
```

This command shows:

* modified files
* staged files
* untracked files

It helps developers understand the current repository state.

---

# 5. Connecting to GitHub

To synchronize with GitHub, a remote repository must be added.

### Command

```
git remote add origin <repository-url>
```

Example:

```
git remote add origin https://github.com/username/repo.git
```

Check remote configuration:

```
git remote -v
```

---

# 6. Pushing Code to GitHub

Uploading local commits to GitHub.

### Command

```
git push -u origin main
```

Explanation:

* `origin` → remote repository name
* `main` → branch name
* `-u` → sets upstream branch

After this command, future pushes can be done with:

```
git push
```

---

# 7. Cloning a Repository

Cloning downloads a full repository from GitHub.

### Command

```
git clone <repository-url>
```

Example:

```
git clone https://github.com/user/project.git
```

This downloads:

* all files
* commit history
* branches
* Git configuration

---

# 8. Branching Concept

Branches allow developers to work independently without affecting the main code.

Example structure:

```
main
 └── feature-login
```

### Create and switch branch

```
git checkout -b feature-login
```

This command performs two actions:

1. Creates a new branch
2. Switches to that branch

---

# 9. Merging Branches

Once development on a feature branch is complete, it can be merged into the main branch.

### Commands

```
git checkout main
git merge feature-login
```

### Result

Git creates a **merge commit** that combines histories.

Example commit structure:

```
A---B---C-------M
        \      /
         D----E
```

Where **M** is the merge commit.

---

# 10. Git Rebase

Rebase is an alternative to merge.

Instead of creating a merge commit, it moves commits onto another branch.

### Command

```
git rebase main
```

### Result

```
A---B---C---D---E
```

History becomes linear.

Benefits:

* cleaner commit history
* easier debugging
* clearer timeline

However, rebase rewrites commit history and should not be used on shared branches.

---

# 11. Merge Conflicts

Conflicts occur when two branches modify the same part of a file.

Example conflict markers inside file:

```
<<<<<<< HEAD
version from main
=======
version from feature
>>>>>>> feature-branch
```

Developers must manually edit the file to resolve conflicts.

After fixing:

```
git add file
git commit
```

---

# 12. Git Authentication Issues

Modern GitHub does not allow password authentication.

Two secure methods exist:

1. Personal Access Token (PAT)
2. SSH authentication

---

# 13. SSH Authentication Setup

SSH provides secure communication between local machine and GitHub.

### Generate SSH key

```
ssh-keygen -t ed25519 -C "email@example.com"
```

This generates:

```
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

* private key → stored locally
* public key → uploaded to GitHub

---

# 14. Starting SSH Agent

SSH agent stores keys securely in memory.

### Command

```
eval "$(ssh-agent -s)"
```

Add key to agent:

```
ssh-add ~/.ssh/id_ed25519
```

This prevents repeated passphrase prompts.

---

# 15. Testing SSH Connection

```
ssh -T git@github.com
```

Successful output:

```
Hi username! You've successfully authenticated.
```

---

# 16. Switching Git Remote to SSH

```
git remote set-url origin git@github.com:username/repo.git
```

This allows Git operations without entering credentials.

---

# Key DevOps Takeaways

* Git enables safe collaboration among developers.
* Branching prevents breaking production code.
* Merge and rebase provide different integration strategies.
* SSH authentication is the professional standard for GitHub access.

Understanding these workflows is essential for DevOps engineers working with CI/CD pipelines and infrastructure automation.

---

# Conclusion

This session provided a complete hands-on introduction to Git and GitHub workflows used in real DevOps environments.

The concepts practiced include:

* repository initialization
* version tracking
* branching strategies
* merging workflows
* conflict resolution
* remote repository synchronization
* secure authentication using SSH

These fundamentals form the foundation for advanced DevOps practices such as automated deployments, CI/CD pipelines, and infrastructure as code.
