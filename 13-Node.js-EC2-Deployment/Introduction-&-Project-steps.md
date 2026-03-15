# Introduction

This project demonstrates how to deploy a Node.js application on an AWS EC2 instance and make it accessible over the internet using the instance's public IP address.

The objective of this project was to understand the real deployment workflow used when hosting backend services on cloud infrastructure.

Instead of running the application locally, the application is hosted on a remote server where users can access it through the internet.

The deployment process involved several important tasks:

* Creating a virtual server using AWS EC2
* Connecting to the server using SSH
* Cloning the project repository from GitHub
* Installing application dependencies
* Configuring environment variables
* Running the application on the server
* Exposing the application through a public IP address

The application used in this project is a Node.js server that serves static client files and backend functionality.

---

# Deployment Architecture

User Browser
↓
Public Internet
↓
AWS EC2 Instance
↓
Node.js Application (Port 3000)

The browser sends a request to the EC2 public IP address.

The EC2 server receives the request and forwards it to the Node.js application running on port 3000.

Security group rules allow external traffic to reach this port.

---

# Key Learnings

This project helped reinforce several core DevOps concepts:

* Cloud servers behave like remote computers that run applications
* Applications must run on the server itself to be accessible through its public IP
* Dependencies must be installed on each machine separately
* Security groups control which network ports can receive traffic
* Process managers are necessary to keep applications running continuously

Completing this project provided practical experience with real-world application deployment workflows.


# Project Deployment Steps

This section documents the complete process used to deploy the Node.js application on AWS EC2.

---

## Step 1 — Create EC2 Instance

An EC2 instance was created using the Ubuntu server image.

Configuration used:

Instance type
t2.micro

Security group rules:

Port 22 (SSH) – Remote server access
Port 3000 – Application access

A key pair (.pem file) was generated for secure SSH authentication.

---

## Step 2 — Connect to the EC2 Server

The server was accessed using SSH.

Example command:

ssh -i key.pem ubuntu@<public-ip>

After connecting successfully the terminal prompt changes to the EC2 server environment.

---

## Step 3 — Clone the Project Repository

The project repository was cloned from GitHub onto the EC2 server.

git clone <repository-url>

cd Deploy-NodeJS-on-AWS

---

## Step 4 — Install Dependencies

Node.js dependencies were installed using:

npm install

This command installs all required libraries listed in `package.json`.

The dependencies are stored inside the `node_modules` directory.

---

## Step 5 — Configure Environment Variables

A `.env` file was created to store configuration values.

Example configuration:

DOMAIN="http://<public-ip>:3000"
PORT=3000
STATIC_DIR="./client"

These variables are used by the Node.js application during runtime.

---

## Step 6 — Start the Application

The application was started using:

npm run start

The Node.js server begins listening on port 3000.

---

## Step 7 — Process Management with PM2

To ensure the application continues running after the terminal session closes, PM2 was installed.

Install PM2:

sudo npm install -g pm2

Start the server:

pm2 start server.js

Save process list:

pm2 save

PM2 allows the application to run in the background.

---

## Step 8 — Access the Application

The application becomes accessible through the EC2 public IP address.

Example:

http://<public-ip>:3000

Users can access the web application through their browser.

