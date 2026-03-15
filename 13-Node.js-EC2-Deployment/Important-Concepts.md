# Important Concepts Learned

This project helped reinforce several important DevOps concepts.

---

## EC2 Instance

An EC2 instance is a virtual machine hosted in AWS cloud infrastructure.

Applications running on this machine can be accessed through the internet if networking rules allow it.

---

## Security Groups

Security groups act as firewalls controlling traffic to EC2 instances.

Only allowed ports can receive external requests.

Example:

Port 22 – SSH access
Port 3000 – Application access

---

## SSH Authentication

SSH allows secure remote access to servers.

Authentication is performed using a PEM key file.

Example:

ssh -i key.pem ubuntu@server-ip

---

## Node.js Dependency Management

Node.js applications rely on packages defined in `package.json`.

These packages must be installed using:

npm install

Each environment requires its own dependency installation.

---

## Process Management

Without a process manager the application stops when the terminal session closes.

PM2 is commonly used to keep Node.js applications running continuously.

Example:

pm2 start server.js

---

## Environment Variables

Environment variables allow configuration values to be stored outside the application code.

Sensitive information such as API keys should always be stored in environment variables instead of source code.
