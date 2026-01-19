# ☃️ Git Workshop: Do You Want To Build A Repo?

> "The cold never bothered me anyway..." — *Every developer after mastering Git.*

## 1. Overview
Git is a Version Control System (VCS). It is the most popular tool modern developers use to collaborate and build projects. It offers transparent history, rollbacks, and parallel versions.

**Why do we need it?**
Imagine Elsa and Anna are trying to build a snowman together.
* **Without Git:** Anna overwrites Elsa's snow. Elsa accidentally melts Anna's work. They fight.
* **With Git:** They can build separate parts, combine them safely, and if the snowman falls over, they can snap their fingers and go back in time to when it was standing.


---

## 2. Core Concepts: How it Works

A git repository is a folder managed by git. It has three main states, like an airlock system:

1.  **Working Directory (The Workshop):** Where you are currently editing files.
2.  **Staging Area (The Queue):** You pick specific changes to be "staged". You are saying, "I want *this* specific change to be in the next version."
3.  **History (The Archive):** A tree of "Commits" sorted chronologically.

### Key Terms
* **Commit:** A saved version. It is an object with a unique ID (hash), a message, and the changes made.
* **Branch:** An alternate timeline. You can branch away from the main story to experiment without affecting history.
* **Merge:** Bringing two timelines back together.
* **Remote (Origin):** The "cloud" version of your repo (on GitHub, GitLab, etc.).
* **Push/Pull:** Sending your history up to the cloud (Push) or bringing cloud changes down to you (Pull).

---

## 3. Activity 1: The Human Git Repo

Before we touch the keyboards, we are going to act out how Git works physically.

**Roles:**
* **Head:** Points to the most recent commit.
* **Staging:** Someone who collects the changes.
* **The Cloud:** Someone standing far away holding the "Origin" commits.

**The Workflow:**
1.  **Code Review:** We check the "paper" code.
2.  **Git Add:** The Staging person picks up the code.
3.  **Git Commit:** The Code person picks up a "Commit Message" sign, stands in line, and becomes part of the history.
4.  **Git Push:** We take a snapshot of the line (saving it to the cloud).
5.  **Git Branch:** We start a new line of people next to the first one.
6.  **Git Merge:** The two lines join hands.

---

## 4. Activity 2: Code a Snowman

Ready to get hands-on? We will pair up into **Elsas (Maintainers)** and **Annas (Contributors)** to build a Python snowman.

👉 **[Click here for the Snowman Tutorial](./TUTORIAL.md)**

---

## 5. Advanced Magic & Resources

Finished early? Want to learn more stuff?

👉 **[View the Cheat Sheet & Advanced Topics](./CHEAT_SHEET.md)**

### Quick Summary of Commands
| Command | Analogy | Description |
| :--- | :--- | :--- |
| `git init` | **The Big Bang** | Creates a new repository. |
| `git add <file>` | **Packing the Bag** | Moves changes to the staging area. |
| `git commit -m "msg"` | **Taking a Snapshot** | Saves the staged changes as a permanent version. |
| `git status` | **Checking the Map** | Shows what is modified or staged. |
| `git push` | **Sending the Post** | Uploads your commits to GitHub. |
| `git pull` | **Checking the Mail** | Downloads new commits from GitHub. |
| `git checkout -b <name>` | **Multiverse Split** | Creates and switches to a new branch. |

---

*Plynth - 2026*
