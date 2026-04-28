## 1. Step-by-Step Project Implementation

Project: Add and Mount EBS Volume

Step 1: Create Volume (AWS)  
- Go to EC2 → Volumes  
- Create new volume  
- Attach to instance  

Step 2: Connect  
ssh ec2-user@<ip>  

Step 3: Check Disk  
lsblk  

Step 4: Format  
mkfs -t ext4 /dev/xvdf  

Step 5: Create Directory  
mkdir /mnt/data  

Step 6: Mount  
mount /dev/xvdf /mnt/data  

Step 7: Verify  
df -h  

---

## 2. Problems Faced & Troubleshooting

Problem: Disk not visible  
Cause: Not attached properly  
Solution:  
lsblk  
Reattach volume  

Problem: Permission denied  
Cause: No sudo  
Solution:  
sudo mount /dev/xvdf /mnt/data  

Problem: Data lost after reboot  
Cause: Mount not permanent  
Solution:  
Add entry in /etc/fstab  

---

## 3. Mistakes & Things to Remember

- Avoid kill -9 unless required  
- Always verify PID before killing  
- Never format wrong disk  
- Always check using lsblk  
- Mount is temporary without fstab  
- Use services instead of manual processes  
- Monitoring is critical in real systems  

---

## 4. Quick Revision Summary

- Process = running program  
- ps aux → view processes  
- kill → stop process  
- systemctl → manage services  
- top/htop → monitoring  
- free -h → memory  
- df -h / du -sh → disk  

Disk setup flow:
lsblk → mkfs → mount → verify  


