# Shell Scripting for DevOps - Detailed Notes (Part 01)

## Introduction

This section marked my entry into Shell Scripting in DevOps.  
Instead of just running commands manually, I started understanding how to automate tasks using scripts.

Shell scripting is foundational because most DevOps environments run on Linux systems.

---

# Purpose of Scripting & Automation

Manual execution:
- Run commands one by one
- Time consuming
- Error-prone

Automation using script:
- Write commands once
- Execute anytime
- Reduces human error
- Improves speed and reliability

In DevOps, automation is mandatory.

---

# Creating Files

## touch

Used to create empty file.

Example:
touch file.txt

If file exists:
- Updates timestamp only

Used when:
- Creating placeholder files
- Creating script file before editing

---

## vim / vi

Used to create and edit files.

Example:
vim script.sh

Inside vim:
Press i → Insert mode
Write content
Press ESC → Exit insert mode
:wq → Save and quit

Difference:

touch → Only creates file
vim → Creates + edits file

---

# Listing Files

ls → List files
ls -l → Detailed view
ls -a → Show hidden files

---

# man Command

Used to read manual of any command.

Example:
man ls

Very useful in real-world troubleshooting.

---

# Shebang Concept

#!/bin/bash

This tells system:
Use bash interpreter to execute this script.

If not provided:
Script may run with default shell.

---

# #!/bin/bash vs #!/bin/sh

/bin/bash:
- Advanced shell
- Supports arrays
- Supports [[ ]] conditions
- Preferred in DevOps

/bin/sh:
- Basic shell
- More portable
- May link to dash

Best practice:
#!/usr/bin/env bash

Why?
Because env searches bash from system PATH dynamically.

More portable and professional.

---

# Difference Between bash, ksh, dash

bash:
- Most popular
- Used in DevOps
- Feature rich

ksh:
- Korn shell
- Used in older Unix systems

dash:
- Lightweight
- Used as default /bin/sh in Ubuntu
- Faster but limited features

---

# echo Command

Used to print output.

Example:
echo "Hello DevOps"

Used for:
- Debugging
- Displaying messages
- Logging

---

# How to Execute Script

Method 1:
bash script.sh

Method 2:
./script.sh

For method 2:
File must have execute permission.

---

# chmod Command

Used to change file permissions.

chmod +x script.sh

Adds execute permission.

chmod 777 script.sh

Gives full permissions to everyone.

Difference:

chmod +x:
- Only adds execute
- Safe

chmod 777:
- Read, write, execute for all
- Not secure
- Avoid in production

Best practice:
chmod 755 script.sh

---

# Checking History

history

Shows previously executed commands.

Useful for:
- Revising
- Debugging
- Automation

---

# Creating Folders

mkdir foldername

mkdir -p parent/child

---

# Changing Directory

cd foldername
cd ..
cd ~

---

# Writing First Simple Script

Example:

#!/bin/bash
echo "Hello DevOps"
date
whoami

Steps:
1. Create file
2. Add shebang
3. Write commands
4. chmod +x
5. Execute

---

# Purpose of Shell Scripting in DevOps

Used for:
- Deployment
- Server setup
- Package installation
- Monitoring
- CI/CD pipelines
- Cloud automation
- Log cleanup

Shell scripting connects:
Linux + AWS + Docker + CI/CD

---

# Checking CPU & RAM

free -m → Check memory
top → Real-time system monitoring
htop (if installed) → Better interface

top shows:
- CPU usage
- Memory usage
- Running processes
- Load average

Very important for production debugging.

---

# Common Mistakes I Understood

1. Using chmod 777 blindly
2. Forgetting shebang
3. Writing bash features in sh script
4. Trying to SSH without correct permissions
5. Not understanding difference between public and private execution

---

# Key Takeaways

- Shell scripting is automation backbone.
- Always use proper permissions.
- Prefer bash over sh for DevOps scripting.
- Understand PATH and env.
- Never expose production systems unnecessarily.
- Learn commands practically by using them daily.

---

# Conclusion

This part helped me move from basic Linux user to someone who understands scripting fundamentals.

Shell scripting is not optional in DevOps.
It is a core skill that connects infrastructure, automation, and cloud operations.
