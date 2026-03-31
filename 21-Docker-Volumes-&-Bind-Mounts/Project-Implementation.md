## 4. Step-by-Step Project Implementation

### Step 1: Create Volume
docker volume create krishna

---

### Step 2: Build Docker Image
docker build -t volumedemo .

---

### Step 3: Run Container with Volume
docker run -it --mount source=krishna,target=/app/data volumedemo bash

---

### Step 4: Navigate to Volume Path
cd /app/data

---

### Step 5: Create File in Volume
echo "testing volume" > file.txt

---

### Step 6: Verify File
ls

Output:
file.txt

---

### Step 7: Exit Container
exit

---

### Step 8: Run New Container
docker run -it --mount source=krishna,target=/app/data ubuntu bash

---

### Step 9: Verify Persistence
cd /app/data  
ls  

Output:
file.txt

Conclusion:
Data created in first container is still available in second container → volume is working.

---

## 5. Problems Faced & Troubleshooting

### Problem 1: Container exited immediately

Cause:
The container was running a script (python3 app.py) which finished execution.

Explanation:
Containers only run while the main process is running.

Solution:
This is expected behavior. No issue.

---

### Problem 2: Volume appeared empty

Cause:
No data was written into the mounted directory.

Solution:
Manually create file:
echo "testing volume" > file.txt

---

### Problem 3: Checked wrong directory

Cause:
Ran `ls` in root directory `/` instead of `/app/data`

Wrong:
ls

Correct:
cd /app/data  
ls

---

### Problem 4: Incorrect docker command

Cause:
- Image name split incorrectly
- Target path was wrong (/app/v)

Fix:
docker run -d --mount source=krishna,target=/app/data volumedemo

---

## 6. Mistakes & Things to Remember

- Containers are temporary, volumes are permanent
- Volume does not store data automatically
- Always write inside mounted path (/app/data)
- Always verify using a new container
- -d does not keep container alive if process ends
- Use -it for debugging and learning
- Always check correct directory before verifying data
- Volume must not be in use while deleting

---

## 7. Important Concepts (Deep Understanding)

- Container = execution environment
- Volume = storage layer
- Data inside container = temporary
- Data inside volume = persistent

Key Logic:
If data survives container deletion → it is stored in volume

---

## 8. Volume Deletion

### Delete specific volume
docker volume rm krishna

---

### If error (volume in use)

Step 1:
docker ps -a

Step 2:
docker rm <container_id>

Step 3:
docker volume rm krishna

---

### Delete all unused volumes
docker volume prune

---

## 9. Final Summary (Quick Revision)

- Containers lose data when stopped
- Volumes provide persistent storage
- Volume is shared across containers
- Data written in volume survives container deletion
- Use --mount to attach volume
- Verify using new container
- If data exists in new container → volume works

Final understanding:
Volume acts like a hard disk for containers.
