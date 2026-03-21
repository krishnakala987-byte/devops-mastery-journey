# DevOps Project Management Tools & Workflow

---

## 1. Introduction

In real DevOps jobs, writing code is not the first thing you do.  
You first need to understand how work is planned, tracked, and delivered.

DevOps is not only about tools like Docker or AWS.  
It is also about how teams collaborate and manage work.

Real-world analogy:

Think of a construction site:
- Agile = how work is planned
- Jira = task list for workers
- Confluence = instruction manual
- ServiceNow = emergency and approval system
- GitHub = place where actual building happens (code)

---

## 2. Core Concepts

### Agile Methodology

Agile is a way of working where large tasks are divided into small parts.

Instead of building everything at once:
- Build small parts
- Test quickly
- Improve continuously

#### Key Terms

**Sprint**
- Short cycle (1–2 weeks)
- Small set of tasks to complete

**Backlog**
- List of all tasks

**Standup Meeting**
- Daily quick meeting
- Discuss:
  - What you did
  - What you will do
  - Any issues

---

### Kanban Board

A visual way to track work.

Basic structure:

To Do → In Progress → Done

Each task moves across columns as work progresses.

---

### Jira

Jira is a tool used to track work.

Everything is a "ticket".

#### Types of Tickets

- Story → Feature
- Bug → Issue
- Task → General work

#### What you do daily

- Pick a ticket
- Work on it
- Update status
- Add comments
- Mark as done

---

### Confluence / SharePoint

These are documentation tools.

Used to store:
- Setup guides
- Architecture details
- Troubleshooting steps

Purpose:
So knowledge is not lost when someone leaves.

---

### ServiceNow

Used for handling real production operations.

#### Incident Management

When something breaks:
- Website down
- Server issue

Steps:
- Create incident
- Assign to engineer
- Fix quickly

#### Change Management

Before making changes in production:
- Create request
- Get approval
- Deploy safely

---

### Read the Docs

Open-source documentation tool.

Used when:
- No paid tools like Confluence
- Open-source projects

---

### Git & GitHub Projects

Used for:
- Code management
- Task tracking

#### Key Concepts

**Issues**
- Tasks or bugs

**Pull Requests**
- Code review before merging

**Projects**
- Kanban board for tracking work

---

## 3. Important Commands / Syntax

(No specific commands were used in this topic, as it is concept-focused)

---

## 4. Step-by-Step Project Implementation

### Project: DevOps Task Tracking Simulation

#### Step 1: Create GitHub Repository

- Create a new repo
- Initialize with README

#### Step 2: Create Issues

Examples:
- Setup CI/CD pipeline
- Fix deployment bug
- Add monitoring

#### Step 3: Create GitHub Project Board

Columns:
- To Do
- In Progress
- Done

#### Step 4: Link Issues to Board

- Add issues to board
- Move based on progress

#### Step 5: Simulate Workflow

- Pick issue
- Move to "In Progress"
- Complete work
- Move to "Done"

#### Step 6: Use Pull Requests

- Make changes
- Create PR
- Merge after review

---

## 5. Problems Faced & Troubleshooting

(No major issues mentioned in this topic)

---

## 6. Mistakes & Things to Remember

- DevOps is not only tools like Docker or AWS
- Understanding workflow is equally important
- Always update ticket status
- Do not work without tracking tasks
- Always read documentation before starting work
- Never push directly to production without approval
- Communication is very important in DevOps

---

## 7. Quick Revision Summary

- Agile = Work in small parts
- Sprint = Short work cycle
- Kanban = Visual task tracking
- Jira = Task management tool
- Confluence = Documentation
- ServiceNow = Incident + Change handling
- GitHub = Code + tasks

Final understanding:

DevOps = Process + Collaboration + Tools
