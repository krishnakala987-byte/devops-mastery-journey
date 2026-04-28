## 1. Introduction

Linux follows a tree-like structure where everything starts from a single root directory `/`.

Think of it like a company:

- `/` is the CEO (top level)
- Different folders are departments
- Files and commands are employees working inside those departments

Everything in Linux (files, folders, devices) exists under `/`.

---

## 2. Core Concepts

### 2.1 Root Directory `/`

- This is the starting point of the entire file system
- All directories exist inside this

---

### 2.2 Important Directories

#### `/bin` and `/usr/bin`

- These contain user commands (binaries)
- Commands like:
  - `ls`
  - `cat`
  - `pwd`
- `/bin` → essential commands
- `/usr/bin` → additional user commands

---

#### `/sbin` and `/usr/sbin`

- System-level commands
- Used mainly by admin (root user)

Examples:
- user management
- system control commands

---

#### `/etc`

- Contains configuration files
- Important for system behavior

Examples:
- network configs
- user configs
- service configs

---

#### `/home`

- Contains personal directories of users

Example:
```
/home/krishna
```

- All personal files are stored here

---

#### `/root`

- Home directory for root user (admin)
- Different from `/home`

---

#### `/opt`

- Used to install third-party software
- Example: custom apps installed manually

---

#### `/var`

- Stores changing data (variable data)

Examples:
- logs
- cache
- application data

---

#### `/tmp`

- Temporary files
- System may automatically delete these

---

#### `/mnt` and `/media`

- Used to mount external storage

Examples:
- USB drives
- external disks

---

### 2.3 Root User vs Normal User

#### Root User
- Full access
- Can do anything in system
- Dangerous if misused

#### Normal User
- Limited access
- Safer for daily work

---

## 3. PATH Variable (Very Important)

### What is PATH?

PATH is an environment variable that tells Linux:

"Where to look for commands"

---

### Example

When you run:
```
ls
```

Linux does NOT magically know `ls`

It searches in directories defined in PATH:
```
/bin
/usr/bin
```

---

### Check PATH

```
echo $PATH
```

Output looks like:
```
/usr/local/bin:/usr/bin:/bin
```

---

### How it works

1. You type a command → `ls`
2. Linux checks each directory in PATH
3. Finds `/bin/ls`
4. Executes it

---

### Why PATH is Important

Without PATH:
```
/bin/ls
```

You would need full path every time
