# Introduction to Virtual Machines

## What is a Server?

A server is a powerful computer that provides services to other computers (clients).

Examples:
- Web server
- Database server
- Application server

A server can be physical or virtual.

---

## What is a Virtual Machine (VM)?

A Virtual Machine is a software-based computer that runs inside a physical computer.

It behaves like a real machine:
- Has its own OS
- Has its own CPU and RAM (virtually allocated)
- Has its own storage
- Runs applications independently

But it shares the physical hardware with other VMs.

---

## What is a Hypervisor?

A hypervisor is software that creates and manages virtual machines.

It divides physical resources (CPU, RAM, storage) and allocates them to multiple VMs.

### Types of Hypervisors

Type 1 (Bare Metal):
- Installed directly on hardware
- Used in data centers

Type 2:
- Installed on top of an existing OS
- Used for learning and development

---

## Virtualization Concept

Virtualization is the technology that allows multiple virtual machines to run on a single physical server.

It improves:
- Resource utilization
- Cost efficiency
- Scalability
- Isolation

---

## Basic VM Architecture

Physical Hardware
    ↓
Hypervisor
    ↓
Virtual Machines
    ↓
Guest Operating Systems
    ↓
Applications


# How to Create a Virtual Machine

There are multiple ways to create Virtual Machines.

---

## Method 1: Using Type 2 Hypervisor (Local Machine)

Examples:
- VirtualBox
- VMware Workstation

Steps:

1. Install virtualization software.
2. Download ISO file of an operating system.
3. Click "Create New VM".
4. Allocate:
   - RAM
   - CPU
   - Storage
5. Attach ISO file.
6. Start the VM.
7. Install the operating system inside the VM.
8. Configure networking.

This method is commonly used for learning and testing.

---

## Method 2: Using Cloud Platforms

Examples:
- AWS EC2
- Azure VM
- GCP Compute Engine

Steps:

1. Create cloud account.
2. Launch a new instance.
3. Choose operating system.
4. Select instance type (CPU/RAM).
5. Configure storage.
6. Configure networking and security groups.
7. Launch instance.
8. Connect using SSH or RDP.

This method is used in real-world DevOps and production systems.

---

## Method 3: Using Data Center Hypervisor

In enterprise environments:
- Hypervisor is installed directly on hardware.
- Admin creates multiple VMs.
- Used in private data centers.

---

## Important VM Settings

- vCPU allocation
- RAM allocation
- Disk type (SSD/HDD)
- Network type (NAT/Bridged)
- Snapshot creation

---

## Snapshot Concept

A snapshot is a saved state of a VM at a specific time.

If something breaks:
You can roll back to the previous working state.

Used in:
- Testing
- Experimenting
- Safe deployments


# Important Notes – Virtual Machines

## Difference Between Physical and Virtual Machine

Physical Machine:
- One OS
- Direct hardware access
- Expensive
- Less flexible

Virtual Machine:
- Multiple OS on same hardware
- Resource sharing
- Cost-effective
- Highly flexible

---

## Advantages of Virtual Machines

- Better resource utilization
- Isolation between applications
- Cost saving
- Easy backup
- Easy cloning
- Disaster recovery
- Scalability

---

## DevOps Relevance

In DevOps, VMs are used for:

- Development environments
- Testing environments
- Production deployments
- CI/CD servers
- Running container platforms

Cloud infrastructure is built on Virtual Machines.

---

## Interview Answer (Short Definition)

A Virtual Machine is a software emulation of a physical computer that runs on a hypervisor, allowing multiple operating systems to share the same physical hardware.
