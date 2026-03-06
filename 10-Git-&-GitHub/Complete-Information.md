# Git and GitHub Learning Notes

## Introduction

Git is a distributed version control system used to track changes in files during software development. It helps developers maintain the history of their code, collaborate with teams, and safely revert to previous versions when needed.

Version control is extremely important in modern software development because projects constantly change and multiple developers may work on the same codebase.

Git was created by Linus Torvalds in 2005 while developing the Linux kernel. Today Git is one of the most widely used tools in software engineering and DevOps.

GitHub is a cloud platform that hosts Git repositories. It allows developers to store code online, collaborate with teams, and manage projects efficiently.

---

## What is Version Control

Version control is a system that records changes made to files over time so that specific versions can be recalled later.

Without version control:

* Changes in code can be lost
* Collaboration becomes difficult
* It is hard to identify what changes were made
* Reverting to a previous working version becomes complicated

With version control:

* Every change is tracked
* Previous versions can be restored
* Developers can work together easily
* Code history is maintained

---

## Types of Version Control Systems

### Centralized Version Control System

Examples:
SVN
CVS

Characteristics:

* One central server stores the repository
* Developers pull and push code from the central server
* If the server fails, development stops
* Internet connection is usually required

Structure example:

Developers → Central Server

---

### Distributed Version Control System

Git is a distributed version control system.

Characteristics:

* Every developer has a complete copy of the repository
* Work can be done offline
* Operations are faster
* There is no single point of failure

Structure example:

Developer A → Full repository
Developer B → Full repository
Developer C → Full repository

Remote platforms like GitHub act as shared repositories for collaboration.

---

## Git Repository

A Git repository is a project directory that Git tracks for changes.

When Git is initialized in a directory, a hidden folder called `.git` is created. This folder contains all the information about the repository including commits, configuration, and version history.

Example project structure:

example.com
│
├── calculator.sh
└── .git

---

## Initializing a Git Repository

Command used to initialize Git:

git init

Purpose of this command:

* Converts a normal directory into a Git repository
* Creates the hidden `.git` directory
* Enables Git to track changes in files

Example workflow:

mkdir example.com
cd example.com
git init

After running this command, Git starts tracking the project.

---

## The .git Directory

The `.git` directory contains all Git related information.

Important components inside `.git`:

HEAD
Points to the current branch.

config
Stores repository configuration such as username and email.

objects
Stores all commits and versions of files.

refs
Stores references to branches and tags.

hooks
Contains scripts that run automatically before or after Git actions.

---

## Git Workflow

Git works in three main stages.

Working Directory
The area where files are created and edited.

Staging Area
A temporary area where selected changes are prepared before committing.

Repository
The location where committed changes are permanently stored.

Workflow representation:

Edit file → Stage changes → Commit changes

---

## Understanding the Working Directory

The working directory is the folder where the project files exist. When a file is modified or created, the changes occur in the working directory.

Example:

calculator.sh is edited.

Git detects that the file has been modified but the change is not yet staged for commit.

---

## git add Command

Command:

git add <file-name>

Example:

git add calculator.sh

Purpose of git add:
Moves changes from the working directory to the staging area.

This prepares the file for the next commit.

Alternative command to add all files:

git add .

This stages all modified and new files in the current directory.

---

## git commit Command

Command:

git commit -m "message"

Example:

git commit -m "added addition logic"

Purpose of git commit:
Creates a snapshot of the staged changes and stores it in the repository.

Each commit represents a version of the project.

A commit contains:

* unique commit ID
* commit message
* author information
* timestamp
* snapshot of files

Commits build the version history of a project.

---

## Example Commit Output

Example output after committing:

[main (root-commit) 556b144] first version
1 file changed, 1 insertion(+)
create mode 100644 calculator.sh

Explanation:

main
Current branch name.

root-commit
Indicates the first commit in the repository.

556b144
Unique commit ID.

1 file changed
One file was modified.

1 insertion
One line was added.

create mode 100644
File was created with specific permissions.

---

## Viewing Commit History

Command:

git log

This shows the complete commit history including commit IDs, author information, and messages.

Simplified version:

git log --oneline

Example output:

a45f3b2 second version
d21c4a1 first version

Each commit represents a version of the project.

---

## Understanding Versions

Each commit acts like a snapshot of the project.

Example version timeline:

Commit 3
Commit 2
Commit 1

Developers can return to any previous commit if needed.

This helps in fixing bugs or restoring earlier working code.

---

## Moving to a Previous Version

Command:

git checkout <commit-id>

Example:

git checkout a45f3b2

This temporarily moves the project to an older version.

To return to the latest branch:

git checkout main

---

## Resetting to a Previous Version

Command:

git reset --hard <commit-id>

Example:

git reset --hard a45f3b2

Purpose:
Moves the repository back to a specific commit and removes later changes.

This command should be used carefully because it rewrites history.

---

## Important Commands Practiced

Initialize repository

git init

Check repository status

git status

Add files to staging

git add .

Commit staged changes

git commit -m "message"

View commit history

git log

Simplified history

git log --oneline

Switch to previous version

git checkout <commit-id>

Reset repository version

git reset --hard <commit-id>

---

## Key Learnings from This Practice

* Git tracks the history of a project using commits
* Each commit represents a snapshot of the project
* The `.git` directory stores all repository data
* git add prepares files for committing
* git commit saves the staged changes as a version
* Git allows developers to safely revert to older versions
* Version control makes collaboration easier and safer

---

## Summary

Git is one of the most important tools in the DevOps ecosystem. Almost every DevOps workflow uses Git repositories to store application code, infrastructure scripts, automation tools, and configuration files.

Understanding Git fundamentals such as repository initialization, staging changes, committing versions, and navigating version history builds the foundation for advanced concepts like branching, pull requests, and CI/CD integration.

These fundamentals form the base for efficient collaboration and reliable software development practices.
