## 1. Step-by-Step Learning Implementation

### Step 1: Understand root structure
```
cd /
ls
```

---

### Step 2: Explore directories
```
cd /home
cd /etc
cd /var
```

---

### Step 3: Check commands location
```
which ls
```

---

### Step 4: Check PATH
```
echo $PATH
```

---

### Step 5: Try full path command
```
/bin/ls
```

---

### Step 6: Compare root vs normal user
```
whoami
```

Switch user (if needed):
```
sudo su
```

---

## 5. Problems Faced & Troubleshooting

(No major issues mentioned in notes)

---

## 6. Mistakes & Things to Remember 

- `/` is NOT root user, it is root directory
- `/root` is root user's home
- Do NOT confuse `/bin` and `/sbin`
- PATH decides command execution
- Without PATH, commands must be run with full path
- Root user can break system easily, use carefully

---

## 7. Quick Revision Summary

- Linux starts from `/`
- Everything is inside it
- Important folders:
  - `/bin` → user commands
  - `/sbin` → admin commands
  - `/etc` → configs
  - `/home` → users
  - `/var` → logs/data
  - `/tmp` → temporary
- PATH tells Linux where commands are located
- Root user has full control, normal user is restricted

```
