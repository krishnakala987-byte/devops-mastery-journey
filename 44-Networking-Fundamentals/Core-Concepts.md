## 1. Introduction

Networking is the backbone of DevOps. Every application, server, or cloud service communicates over a network.

Simple understanding:
- Devices = Houses
- Network = City
- IP Address = House address

Without proper addressing and structure, communication is not possible.

---

## 2. Core Concepts

### 2.1 Bit and Byte (Foundation)

- Bit = smallest unit of data → can be 0 or 1
- Byte = 8 bits

1 Byte = 8 Bits

Why important:
- 8 bits can represent 256 values → (2^8 = 256)
- Range becomes: 0 to 255

---

### 2.2 IP Address

An IP address is a unique identifier of a device in a network.

Example:
192.168.1.10

IPv4 format:
- Total = 32 bits
- Divided into 4 parts
- Each part = 8 bits (1 byte)

So:
4 × 8 = 32 bits

Each block ranges from:
0 to 255

---

### Types of IP

#### Private IP
- Used inside internal network
- Not accessible from internet

Examples:
192.168.x.x
10.x.x.x

#### Public IP
- Used on internet
- Assigned by ISP

---

### 2.3 Subnet

Subnet = dividing a large network into smaller networks

Example:
- Company network divided into:
  - HR
  - Finance
  - Engineering

Why subnet:
- Security
- Isolation
- Better management

---

### Types (Cloud perspective)

#### Public Subnet
- Internet accessible
- Used for web servers

#### Private Subnet
- No direct internet access
- Used for databases and internal services

---

### 2.4 CIDR (Classless Inter-Domain Routing)

CIDR defines how many IPs are available in a network.

Format:
192.168.1.0/24

Meaning:
- Total bits = 32
- 24 bits = network
- Remaining bits = host

Formula:
Number of IPs = 2^(32 - CIDR)

Examples:

/24:
2^(32-24) = 256 IPs

/30:
2^(32-30) = 4 IPs

---

### 2.5 CIDR in Binary (Important Understanding)

Example:
192.168.1.0

Binary:
11000000.10101000.00000001.00000000

For /24:
11000000.10101000.00000001 | 00000000
NETWORK (24 bits)           HOST (8 bits)

- Network part = fixed
- Host part = changeable

Range:
192.168.1.0 → 192.168.1.255

---

Example /26:

11000000.10101000.00000001.00 | 000000
NETWORK                       HOST

Host bits = 6

2^6 = 64 IPs

---

Key understanding:
- More CIDR → fewer IPs
- Less CIDR → more IPs

---

### 2.6 Ports

IP = address of server  
Port = specific application inside server  

Example:
192.168.1.10:80

Common ports:

- 80 → HTTP
- 443 → HTTPS
- 22 → SSH
- 3306 → MySQL

Why needed:
- One server runs multiple applications
- Ports help identify which app to connect

---

## 3. Step-by-Step Understanding Flow

How everything works together:

1. Device gets private IP
2. Router assigns public IP
3. Request goes to server IP
4. Server listens on a port
5. Response comes back

Cloud mapping:

- VPC = Network
- Subnet = Small network
- EC2 = Server
- Port = Entry point
- Security Group = Firewall

---

## 4. Mistakes & Things to Remember

- IP range is not random → comes from binary (0–255)
- IPv4 is 32-bit because of 4 bytes
- CIDR is just bit division (not magic)
- Not all IPs are usable:
  - 1 = Network address
  - 1 = Broadcast address

Important confusion:
- b = bits
- B = Bytes

Example:
8 MB ≠ 8 Mb  
8 MB = 64 Mb

---

## 7. Quick Revision Summary

- Bit = 0 or 1
- Byte = 8 bits → 0–255 range
- IPv4 = 32 bits (4 bytes)
- Subnet = dividing network
- CIDR = defines size of subnet
- Ports = application entry points

CIDR shortcut:
- /24 → 256 IPs
- /30 → 4 IPs

Core idea:
- Network bits = fixed
- Host bits = changeable

---

