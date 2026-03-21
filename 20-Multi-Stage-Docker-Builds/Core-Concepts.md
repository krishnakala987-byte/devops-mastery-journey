# Multi-Stage Docker Builds & Distroless Images

---

## 1. Introduction

In Docker, beginners often create large images because they include everything like OS, compilers, and dependencies.

But in real-world DevOps, we only need the final application to run.

Multi-stage builds help us:
- Build the application in one stage
- Run it in a minimal environment

Real-world analogy:
Cooking happens in a kitchen, but only the final dish is served. You don’t serve the kitchen.

---

## 2. Core Concepts

### What is a Binary?

A binary is the compiled version of your code.

Example:
- calculator.go → after build → app (binary)

It is a ready-to-run file.

---

### Static Binary

A static binary contains everything needed to run the application inside one file.

It does not depend on the OS or external libraries.

Why important:
- Works in minimal environments
- Required for scratch image

---

### What is CGO?

CGO allows Go to use C libraries.

If CGO is enabled:
- App depends on OS libraries

If disabled:
CGO_ENABLED=0

This creates a static binary.

---

### Multi-Stage Docker Build

Used to reduce image size.

Two stages:
1. Build Stage (heavy)
2. Final Stage (light)

Example flow:
- Install Go
- Build app
- Copy only binary to final image

---

### Distroless Images

Distroless images contain only:
- Application
- Required runtime

They do NOT contain:
- Shell
- Package manager
- Debug tools

Benefits:
- Smaller size
- More secure
- Less attack surface

---

### scratch vs Distroless

| Feature | scratch | distroless |
|--------|--------|-----------|
| OS | None | Minimal |
| Size | Smallest | Small |
| Debugging | Not possible | Limited |
| Use case | Simple apps | Production |

---

## 3. Important Commands / Syntax

### Build Docker Image
docker build -t simplecalculator .

Builds the Docker image from Dockerfile.

---

### Run Container
docker run simplecalculator

Runs the application.

---

### Interactive Mode
docker run -it simplecalculator

Used for debugging.

---

### List Images
docker images

Shows all images.

---

### Build Without Cache
docker build --no-cache -t app .

Forces fresh build.

---

### Go Build Command
CGO_ENABLED=0 go build -o /app .

Creates static binary.

