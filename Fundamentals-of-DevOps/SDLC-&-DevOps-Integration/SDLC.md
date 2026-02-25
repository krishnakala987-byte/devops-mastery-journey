# Software Development Life Cycle (SDLC) – Detailed Notes

## 1. What is SDLC?

The Software Development Life Cycle (SDLC) is a structured process followed by the software industry to design, develop, and test high-quality software.

The main objectives of SDLC are:

- Deliver software that meets customer expectations
- Deliver within the shortest possible time
- Maintain cost efficiency
- Ensure product quality

Every software product, whether small or large, follows SDLC in some form.

---

## 2. Phases of SDLC

SDLC follows a circular process. After deployment, feedback is collected and the cycle begins again.

### 1. Planning and Requirement Gathering

This phase involves:

- Product Owners
- Business Analysts
- Senior Management
- Customers

They gather requirements and feedback to decide:
- What new features are needed?
- What problems must be solved?
- What improvements should be made?

This phase defines the direction of the project.

---

### 2. Defining (Requirement Documentation)

All gathered requirements are documented in an SRS (Software Requirement Specification).

The SRS document includes:

- Functional requirements
- Non-functional requirements
- System constraints
- Business rules

This document acts as a reference for developers and architects.

---

### 3. Designing

Architects prepare the system design.

There are two levels of design:

High-Level Design (HLD):
- Focuses on system architecture
- Scalability
- Availability
- Major components and integrations

Low-Level Design (LLD):
- Function-level details
- Database calls
- API structures
- Class diagrams

Design ensures that development happens in a structured and scalable way.

---

### 4. Building (Development)

Developers:

- Write code based on design documents
- Follow coding standards
- Push code to source code repositories like Git

This is where the actual product is created.

---

### 5. Testing

The Quality Engineering (QE) or QA team:

- Tests functionality
- Identifies bugs
- Ensures requirements are met
- Validates performance

Testing usually happens in staging or development environments.

The goal:
Ensure the application is stable and reliable before production.

---

### 6. Deployment

After successful testing:

- The application is deployed to production servers.
- It becomes accessible to customers.
- Real users start interacting with it.

After deployment, feedback is collected and the cycle restarts.

---

## 3. How DevOps Integrates into SDLC

DevOps does not change SDLC phases.
It improves how they are executed.

### Primary Focus Areas of DevOps

DevOps engineers mainly focus on:

- Building
- Testing
- Deployment

These are the phases where automation makes the biggest impact.

---

## 4. Role of DevOps in Each Phase

### During Building

Instead of manually building code:

- Automated build pipelines are created.
- Code is integrated continuously.
- Build failures are detected early.

This is called Continuous Integration (CI).

---

### During Testing

Instead of manually running tests:

- Automated testing is integrated into pipelines.
- Unit tests, integration tests run automatically.
- Feedback is immediate.

This improves quality and speed.

---

### During Deployment

Instead of manual deployment:

- Deployment scripts are written.
- Infrastructure is automated.
- Releases become faster and more reliable.

This is part of Continuous Delivery / Continuous Deployment (CD).

---

## 5. Why DevOps is Important in SDLC

Without DevOps:

- Manual deployments
- Slow feedback
- Human errors
- Longer release cycles

With DevOps:

- Faster delivery
- Reduced human error
- Improved efficiency
- Shorter time from development to customer

DevOps reduces the gap between development and operations.

---

## 6. Interview Perspective

If asked:

"Where does a DevOps Engineer fit into SDLC?"

Best Answer:

A DevOps engineer focuses on automating and improving the efficiency of the building, testing, and deployment phases of SDLC. They ensure faster, reliable, and consistent software delivery by removing manual intervention.

You can also mention:

- CI/CD pipelines
- Automation scripts
- Infrastructure automation
- Monitoring integration

---

# Final Understanding

SDLC provides the structure.

DevOps provides the speed and automation.

Together, they create a modern software delivery system that is fast, reliable, and scalable.
