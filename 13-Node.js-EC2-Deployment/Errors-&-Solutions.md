# Errors and Solutions

During deployment several issues were encountered. Debugging these problems helped improve understanding of real deployment workflows.

---

## Error 1 — Running Application on the Wrong Machine

Initially the Node.js application was started on the local Ubuntu environment instead of the EC2 server.

Because of this the application was not accessible through the EC2 public IP.

Solution:

SSH into the EC2 instance and start the application there.

---

## Error 2 — Missing Dependencies

Error message:

Cannot find module 'express'

Cause:

Dependencies were not installed after cloning the repository.

Solution:

npm install

---

## Error 3 — Node Modules Not Included in Repository

When cloning the repository the `node_modules` directory was not present.

This is expected because the folder is excluded using `.gitignore`.

Solution:

Run `npm install` after cloning the repository.

---

## Error 4 — Application Not Accessible from Browser

Possible reasons:

* Server not running
* Security group not allowing port 3000
* Application running on local machine instead of EC2

Solution:

Ensure the server runs on EC2 and that the security group allows inbound traffic on port 3000.

---

## Error 5 — Permission Issues Installing PM2

While installing PM2 globally, permission errors occurred.

Solution:

sudo npm install -g pm2
