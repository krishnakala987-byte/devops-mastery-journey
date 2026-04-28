# Linux System Administration - Detailed Notes

## 1. Introduction

Linux system administration is about managing users, files, and servers in a secure and organized way.

In real companies, many people use the same server. So:
- We cannot give everyone root access
- We must track who is doing what
- We must control permissions

Simple example:
Think of a company office building:
- Users = Employees
- Groups = Departments
- Files = Documents
- Permissions = Who can access which room


## 2. Core Concepts

### User Management

Why it matters:
- Security (no shared root access)
- Accountability (track user actions)
- Control access

#### useradd vs adduser

- useradd
  - Low-level command
  - Used in scripts
  - Does NOT create home directory automatically

- adduser
  - User-friendly
  - Interactive
  - Creates home directory automatically


### Password Management

#### passwd

Used to set or change password

Example:
passwd username


### Deleting Users

#### userdel

Removes a user

Example:
userdel username

To remove with home directory:
userdel -r username


### Group Management

Groups help manage permissions easily.

Instead of giving permissions to each user, assign them to a group.

#### groupadd

Creates a group

Example:
groupadd devops


### SSH Access

SSH is used to connect to remote servers securely.

- Server runs sshd service
- Client connects using SSH

Example:
ssh user@server_ip

Why important:
- Remote server management
- Used in all DevOps workflows


## File Management

Basic operations in Linux:

### List Files
ls

### Create Directory
mkdir folder_name

### Create File
touch file.txt

### Copy Files
cp source destination

### Move / Rename Files
mv oldname newname


## Vim Editor

Vim is a powerful text editor used in servers.

It has 3 modes:

### 1. Normal Mode
Default mode used for navigation

### 2. Insert Mode
Used for typing

Press:
i

### 3. Command Mode
Used for saving and exiting

Press:
Esc

Save and exit:
:wq!


## File Viewing Commands

### cat
Displays full file
cat file.txt

### head
Shows first few lines
head file.txt

### tail
Shows last few lines
tail file.txt
