## 1. Introduction

The OSI Model explains how data travels from one system to another over a network.

Instead of memorizing layers, think of it like sending a package:

- You create a message
- You pack it properly
- You add address details
- It travels through different systems
- The receiver unpacks it and reads it

This is exactly how internet communication works.

---

## 2. Core Concepts

### Step 0: What happens when we type a URL

Example:
https://google.com

We want to understand:
How does this request reach Google's server?

---

### Step 1: DNS Resolution

Problem:
Computers do not understand domain names.

Solution:
DNS converts domain → IP

Example:
google.com → 142.250.xxx.xxx

Think of it like:
Contact name → Phone number

---

### Step 2: TCP 3-Way Handshake

Before sending data, connection is established.

Steps:
1. SYN → Client asks "Can we connect?"
2. SYN-ACK → Server replies "Yes"
3. ACK → Client confirms

Connection is now established.

---

### Step 3: TLS Handshake (HTTPS)

Since HTTPS is used:

- Server sends certificate
- Browser verifies it
- Secure key is created

Now communication is encrypted.

---

### Step 4: HTTP Request

Browser sends actual request:

GET / HTTP/1.1
Host: google.com

Meaning:
"Give me homepage"

---

## OSI MODEL (REAL UNDERSTANDING)

Data does not go directly.
It is processed layer by layer.

---

### Layer 7: Application Layer

What it does:
Defines what the user wants

Examples:
- HTTP
- HTTPS
- FTP

Real Example:
GET / request

DevOps Debug:
- API not working
- 404 / 500 errors

---

### Layer 6: Presentation Layer

What it does:
- Encryption (SSL/TLS)
- Formatting
- Compression

Example:
HTTP → HTTPS

DevOps Debug:
- SSL certificate expired
- HTTPS errors

---

### Layer 5: Session Layer

What it does:
Maintains connection/session

Examples:
- Login sessions
- Cookies
- Tokens

DevOps Debug:
- User gets logged out
- Session expires

---

### Layer 4: Transport Layer

What it does:
Controls delivery of data

Protocols:
- TCP (reliable)
- UDP (fast)

Functions:
- Breaks data into segments
- Adds port numbers

DevOps Debug:
- Port not open
- Connection refused
- Timeout issues

---

### Layer 3: Network Layer

What it does:
Adds IP addresses and routes data

Example:
Source IP → Destination IP

DevOps Debug:
- Cannot reach server
- Wrong routing
- Network issues

---

### Layer 2: Data Link Layer

What it does:
Handles communication inside local network

Adds:
MAC address

DevOps Debug:
- ARP issues
- Switch problems

---

### Layer 1: Physical Layer

What it does:
Converts data into signals

Example:
0s and 1s sent through cable or WiFi

DevOps Debug:
- Cable unplugged
- No internet

---

## Data Flow (VERY IMPORTANT)

### Sending (Encapsulation)

Application → Presentation → Session → Transport → Network → Data Link → Physical

Data gets wrapped layer by layer.

---

### Receiving (De-encapsulation)

Physical → Data Link → Network → Transport → Session → Presentation → Application

Data gets unwrapped layer by layer.

---

## Real Request Flow (End-to-End)

1. User types URL
2. DNS resolves IP
3. TCP connection established
4. TLS handshake done
5. HTTP request sent
6. Data travels through internet
7. Server receives request
8. Server processes it
9. Response sent back
10. Browser renders page

---

## 3. Important Commands / Syntax

Check connectivity:
ping <ip>

Trace route:
traceroute <ip>

Check ports:
netstat
ss

Test connection:
telnet <ip> <port>

Send request:
curl https://google.com
