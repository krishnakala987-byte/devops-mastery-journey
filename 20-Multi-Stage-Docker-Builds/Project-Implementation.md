

## Step-by-Step Project Implementation

### Step 1: Create Simple Dockerfile (Single-stage)

- Used Ubuntu
- Installed Go
- Built application
- Result: Large image (~800MB)

---

### Step 2: Create Multi-Stage Dockerfile

FROM ubuntu AS build

RUN apt-get update && apt-get install -y golang-go

ENV GO111MODULE=off

COPY . .

RUN CGO_ENABLED=0 go build -o /app .

FROM scratch

COPY --from=build /app /app

ENTRYPOINT ["/app"]

---

### Step 3: Build Image
docker build -t simplecalculator .

---

### Step 4: Run Container
docker run simplecalculator

---

### Step 5: Compare Image Sizes

Single-stage: ~800MB  
Multi-stage: ~2MB  

Huge improvement.

---

## 5. Problems Faced & Troubleshooting

### Problem 1: go command not found

Cause:
Go was not installed on system.

Solution:
sudo apt install golang-go

---

### Problem 2: Docker build stopped midway

Cause:
Slow system or interruption.

Solution:
Re-run:
docker build -t simplecalculator .

Docker uses cache and continues.

---

### Problem 3: Terminal exited with code 1

Cause:
Installation finished and terminal session closed.

Solution:
Restart terminal and check:
go version

---

## 6. Mistakes & Things to Remember ⚠️

- Do not use Ubuntu in final image
- Always use multi-stage builds
- Avoid copying unnecessary files
- Do not run containers as root
- Use static binaries for minimal images
- Prefer official base images (golang:1.22)
- Avoid outdated settings like GO111MODULE=off
- Use .dockerignore to reduce build context

---

## 7. Quick Revision Summary

- Binary = compiled application
- Static binary = no dependency on OS
- CGO_ENABLED=0 = creates static binary
- Multi-stage = build heavy, run light
- scratch = empty image
- distroless = minimal secure image
- Goal = smaller, faster, more secure containers

Final idea:
Keep only what is necessary to run the application.
