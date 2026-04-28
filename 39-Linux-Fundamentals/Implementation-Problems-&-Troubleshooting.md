# 1. Step-by-Step Project Implementation

Step 1: Attach EBS Volume  
- Go to AWS EC2  
- Attach volume  
- Select device name like /dev/sdf  

Step 2: Verify Disk  
lsblk  
Look for new disk like xvdf  

Step 3: Format Disk  
sudo mkfs.ext4 /dev/xvdf  

Step 4: Create Mount Directory  
sudo mkdir /data  

Step 5: Mount Disk  
sudo mount /dev/xvdf /data  

Step 6: Verify  
df -h  

Step 7: Fix Permissions  
sudo chown -R ubuntu:ubuntu /data  

Step 8: Make Persistent  
sudo vim /etc/fstab  

Add:
 /dev/xvdf /data ext4 defaults 0 0  

Step 9: Reboot and Verify  
sudo reboot  
df -h  

Step 10: Final Test  
cd /data  
echo "hello devops" > test.txt  
cat test.txt  

---

# 5. Problems Faced & Troubleshooting

Problem: Permission denied while writing file  

Command:
 sudo echo "hello" > test.txt  

Cause:
sudo works only on echo, not on redirection  

Solution:
 sudo sh -c 'echo "hello" > test.txt'  
 OR  
 sudo tee test.txt  

---

Problem: Cannot write in /data  

Cause:
Directory owned by root  

Solution:
 sudo chown -R ubuntu:ubuntu /data  

---

Problem: Disk disappears after reboot  

Cause:
fstab not configured  

Solution:
Add entry in /etc/fstab  

---

Problem: Device name confusion  

Cause:
AWS name ≠ Linux name  

Example:
 /dev/sdf → /dev/xvdf  

---

# 6. Mistakes & Things to Remember

- Terminating EC2 does NOT delete EBS volumes  
- Always check volumes after termination  
- Never use chmod 777 blindly  
- Always configure fstab for persistence  
- Device names may change after reboot  
- Always verify using df -h  
- Do not format wrong disk  
- Always check lsblk before operations  

---

# 7. Important Points

- Disk must be formatted before use  
- Mount connects disk to folder  
- /dev contains device files  
- fstab makes mount permanent  
- chown fixes permission issues  
- df shows disk usage  
- du shows folder usage  
- Without fstab, mount is temporary  
- Always verify after reboot  

---

This completes a real-world DevOps disk management workflow with AWS EBS.
