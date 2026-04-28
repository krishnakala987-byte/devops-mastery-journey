## 1. Step-by-Step Project Implementation

### Project: User & File Management Practice

Step 1: Create a user
adduser devuser

Step 2: Set password
passwd devuser

Step 3: Create a group
groupadd devops

Step 4: Add user to group
usermod -aG devops devuser

Step 5: Login via SSH
ssh devuser@server_ip

Step 6: Create directory
mkdir project

Step 7: Create file
touch notes.txt

Step 8: Edit file using Vim
vim notes.txt

- Press i → write content
- Press Esc
- Type :wq!

Step 9: View file content
cat notes.txt
head notes.txt
tail notes.txt

Step 10: Copy file
cp notes.txt backup.txt

Step 11: Rename file
mv backup.txt archive.txt


## 4. Problems Faced & Troubleshooting

(No major issues mentioned)


## 5. Mistakes & Things to Remember

- Do NOT give everyone root access
- Always use groups for permission management
- useradd is for scripting
- adduser is for manual use
- Always press Esc before Vim commands
- :wq! saves and exits
- SSH requires sshd running on server
- Be careful with userdel -r


## 6. Quick Revision Summary

- Users → adduser
- Groups → groupadd
- Password → passwd
- SSH → remote access

File commands:
- ls → list
- mkdir → folder
- touch → file
- cp → copy
- mv → move/rename

Vim:
- i → insert
- Esc → normal
- :wq! → save & exit

File viewing:
- cat → full
- head → top
- tail → bottom

This is the base of Linux and DevOps work.
