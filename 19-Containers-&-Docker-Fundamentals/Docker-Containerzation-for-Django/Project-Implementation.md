
## Step-by-Step Project Implementation

### Step 1: Launch EC2

- Create Ubuntu EC2 instance
- Connect using SSH

---

### Step 2: Install Docker

sudo apt update
sudo apt install docker.io -y

---

### Step 3: Clone Project

git clone <repo-url>
cd python-web-app

---

### Step 4: Create Dockerfile

FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "devops/manage.py", "runserver", "0.0.0.0:8000"]

---

### Step 5: Build Image

docker build -t django-app .

---

### Step 6: Run Container

docker run -p 8000:8000 django-app

---

### Step 7: Update Security Group

Add inbound rule:
- Type: Custom TCP
- Port: 8000
- Source: 0.0.0.0/0

---

### Step 8: Access Application

http://<EC2-IP>:8000/demo/

---

### Step 9: Run Migrations

docker exec -it <container-id> bash

python devops/manage.py migrate

--------------------------------------------------

## 5. Problems Faced & Troubleshooting

### Problem: Container not showing in docker ps

Cause:
Container exited immediately

Solution:
docker ps -a
docker logs <container-id>

---

### Problem: manage.py not found

Error:
No such file or directory: /app/manage.py

Cause:
Wrong file path, manage.py inside devops folder

Solution:
Use correct path:
python devops/manage.py

---

### Problem: Port already allocated

Cause:
Another container using port 8000

Solution:
docker stop $(docker ps -q)

---

### Problem: Django not installed

Cause:
requirements.txt not installed

Solution:
RUN pip install -r requirements.txt

---

### Problem: python command not found

Cause:
Using python instead of python3

Solution:
Use python3 or correct image

---

### Problem: Security group blocking access

Cause:
Port 8000 not open

Solution:
Add inbound rule in AWS

--------------------------------------------------

## 6. Mistakes & Things to Remember

- Do not use virtualenv inside Docker
- Always check logs when container fails
- Use docker run without -d for debugging
- Ensure correct file paths in Dockerfile
- Always expose and map ports
- Security group must allow traffic
- Docker build context (.) is important
- Use Gunicorn instead of runserver in production

--------------------------------------------------

## 7. Quick Revision Summary

- Docker packages application with dependencies
- Dockerfile → Image → Container
- EC2 runs containers
- Port mapping exposes app
- Security group allows access
- Debug using logs and foreground mode
- File paths must match project structure
- Use production server (Gunicorn)

--------------------------------------------------
