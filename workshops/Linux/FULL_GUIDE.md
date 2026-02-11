# Linux: Tech Skills for an AI Era
**Workshop Guide**

This is a comprehensive guide on how to get started with WSL and Linux. If you're already done setting things up or are looking for a specific command, you might find the cheatsheet more useful!
👉 **[View the Cheat Sheet](./CHEATSHEET.md)**

---

## 1. The Setup: Windows Subsystem for Linux (WSL)

The Windows Subsystem for Linux (WSL) is a powerful tool that allows you to run a full Linux environment directly on Windows, without the overhead of a virtual machine or the hassle of dual-booting. 

**If you are on a Mac**, you already have a UNIX-like environment and are ready to proceed. Most commands will be identical.

### Prerequisites (Windows)
* **OS:** Windows 10 version 2004+ or Windows 11.
* **BIOS:** Virtualization must be enabled.

### Step 1: Check Virtualization
WSL 2 requires hardware virtualization. Here's how to check if you have it:

1.  Open **Task Manager** (`Ctrl + Shift + Esc`).
2.  Go to the **Performance** tab.
3.  Select **CPU**.
4.  Look for **"Virtualization"** in the bottom-right.
    * **Enabled:** You're good to go.
    * **Disabled:** You must restart your PC, enter BIOS/UEFI, and enable `Intel VT-x` or `AMD-V`.

### Step 2: Install WSL
Open **PowerShell** as Administrator and run:

```powershell
wsl --install
```

This command automatically:

1. Enables the "Virtual Machine Platform" feature.
2. Enables the "Windows Subsystem for Linux" feature.
3. Installs the default Linux kernel.
4. Installs the default distribution (usually Ubuntu).

### Step 3: Pick a Distro (Optional)

If you want a specific flavor of Linux (we recommend Ubuntu 24.04 LTS for this workshop), you can list available options:

```powershell
wsl --list --online
```

| Friendly Name | Command Name |
| --- | --- |
| Ubuntu | `Ubuntu` |
| Debian | `Debian` |
| Kali Linux | `kali-linux` |
| openSUSE | `openSUSE` |

To install a specific version:

```powershell
wsl --install -d Ubuntu-24.04
```

### Step 4: Finalize

Once installed, open the "Ubuntu" app from your Start menu. You will be prompted to create a **UNIX Username** and **Password**.

* **Note:** When typing your password, *nothing will appear on screen*. This is a security feature. Just type it and hit Enter.

---

## 2. The Filesystem

**Everything in Linux is a file** - including directories, devices, and even processes. The filesystem is structured like an inverted tree, with everything branching from the root.

```
$ tree /  (simplified)

/                       (Root: The base of everything)
├── home/               (User home directories)
│   └── you/            (Your personal space)
├── bin/                (Essential command binaries)
├── etc/                (System configuration files)
├── var/                (Variable data)
│   └── log/            (System and application logs)
├── tmp/                (Temporary files - wiped on reboot)
└── usr/                (User programs and utilities)
```

### Key Directories Explained

| Directory | Purpose | Example Use |
|-----------|---------|-------------|
| **~** (home) | Your personal space. Start here. | `cd ~` takes you home |
| **/bin** | Core commands like ls, cd, grep | Where bash looks for commands |
| **/etc** | Config files for your system | Network settings, app configs |
| **/var/log** | System & application logs | Troubleshooting, monitoring |
| **/tmp** | Temporary files - wiped on reboot | Scratch space for processes |

---

## 3. The Territory: Navigation

The Linux terminal is more than a command runner-it's a map and compass for controlling the system. Think of the filesystem as a giant inverted tree:

* **Root (`/`)**: The base of the tree. Everything starts here.
* **Directories**: Branches of the tree.
* **Files**: Leaves on the branches.
* **Home (`~`)**: Your personal branch (`/home/username`).

### `pwd` - Print Working Directory

**Where am I right now?**

Acts as your GPS, showing your current location in the filesystem tree.

```bash
pwd
# Output: /home/student
```

**When to use:** You've been navigating around and lost track of your position. Run `pwd` to reorient yourself.

---

### `ls` - List Directory Contents

**What's in this directory?**

Lists the files and folders in your current location.

```bash
ls
# Simple list of visible files and folders
```

```bash
ls -a
# Show "all" files (includes hidden files starting with .)
```

```bash
ls -l
# Long format: shows permissions, size, owner, modification date
# Example output:
# drwxr-xr-x  5 user  staff   160 Feb 10 14:23 Documents
# -rw-r--r--  1 user  staff  1234 Feb 10 14:23 notes.txt
```

```bash
ls -lh
# Long format with human-readable file sizes (KB, MB, GB)
```

```bash
ls -la
# Combine flags: long format + show all (including hidden files)
```

**When to use:** Before navigating into a directory, list its contents to see what's available. Use `-l` when you need details about permissions or file sizes.

---

### `cd` - Change Directory

**Move to another directory.**

Your primary teleportation command for navigating the filesystem.

```bash
cd my_folder
# Move down into 'my_folder' (relative path)
```

```bash
cd ..
# Move UP one level (back towards root)
# Think of '..' as "parent directory"
```

```bash
cd ~
# Jump to your home directory from anywhere
# Shortcut: just typing 'cd' with no arguments does the same
```

```bash
cd /
# Jump to the root of the filesystem
```

```bash
cd -
# Return to the previous directory you were in
# Useful for toggling between two locations
```

```bash
cd /home/user/projects/data
# Move using an absolute path (starts from root /)
```

**When to use:** Constantly. Navigation is fundamental to everything else. Use `cd ..` to back out, `cd ~` to reset to home, and `cd -` to bounce between two work locations.

---

### `tree` - Visual Directory Overview

**See the folder structure at a glance.**

Displays a hierarchical tree view of directories and files.

```bash
tree
# Show complete tree from current location (can be overwhelming)
```

```bash
tree -L 2
# Limit display to 2 levels deep
# Essential for large projects - prevents output explosion
```

```bash
tree -d
# Show only directories (no files)
```

**When to use:** When exploring a new project or codebase to understand its structure. Always use `-L` to limit depth in large directories.

*Note: If `tree` isn't installed, run `sudo apt install tree`*

---

## 4. The Toolkit: File Creation & Manipulation

Unlike a GUI, the terminal allows you to manipulate files with extreme speed and precision.

### `mkdir` - Make Directory

**Create a new folder.**

```bash
mkdir data_logs
# Create a single directory called 'data_logs'
```

```bash
mkdir -p project/src/data
# Create nested directories in one command
# The -p flag creates parent directories as needed
# Without -p, this would fail if 'project' doesn't exist
```

**When to use:** Setting up project structures, organizing data, creating workspace folders before generating files.

---

### `touch` - Create Empty File

**Create a new, empty file or update timestamp of existing file.**

```bash
touch notes.txt
# Creates an empty file called 'notes.txt'
# If the file already exists, updates its modification time
```

```bash
touch file1.txt file2.txt file3.txt
# Create multiple files at once
```

**When to use:** Quick file creation before editing, creating placeholder files for scripts, or updating modification timestamps.

---

### `cp` - Copy Files and Directories

**Duplicate files or entire directory trees.**

```bash
cp source.txt backup.txt
# Copy a single file
# Creates 'backup.txt' as exact duplicate of 'source.txt'
```

```bash
cp source.txt data_logs/
# Copy file into an existing directory
# Note the trailing slash - indicates destination is a folder
```

```bash
cp -r folder_old/ folder_new/
# Copy an entire folder recursively (-r flag)
# Recursion means: copy the folder AND everything inside it
# Without -r, copying directories will fail
```

**When to use:** Creating backups before making risky edits, duplicating project templates, preserving original data before transformations.

---

### `mv` - Move or Rename

**In Linux, moving and renaming are the same operation.**

```bash
mv file.txt data_logs/
# Move 'file.txt' into the 'data_logs' folder
```

```bash
mv old_name.txt new_name.txt
# Rename file (moving it to a new name in the same location)
```

```bash
mv *.csv archive/
# Move all CSV files to 'archive' folder
# The * wildcard matches any characters
```

**When to use:** Organizing files, renaming for clarity, moving outputs to proper locations, bulk file organization with wildcards.

---

### `rm` - Remove Files and Directories

**⚠️ WARNING: There is no Recycle Bin in the terminal. Deleted files are gone forever.**

```bash
rm file.txt
# Delete a single file permanently
```

```bash
rmdir empty_folder/
# Remove an empty directory only
# Fails if directory contains anything
```

```bash
rm -r folder_name/
# Recursively remove folder and all contents
# -r means: delete the folder AND everything inside it
```

```bash
rm -rf folder_name/
# Force remove without confirmation (-f flag)
# EXTREMELY DANGEROUS - use with caution
# No "Are you sure?" prompt
```

**When to use:** Cleaning up temporary files, removing failed experiments, deleting old data. **Always double-check your path before pressing Enter.**

**Safety tip:** Use `ls` first to verify what you're about to delete: `ls folder_name/` then `rm -r folder_name/`

---

### `cat` - Concatenate and Print Files

**Dump file contents to the terminal.**

```bash
cat dataset.csv
# Print entire file to screen
# Good for small files, chaotic for large files
```

```bash
cat file1.txt file2.txt
# Concatenate multiple files and print them
```

```bash
cat file1.txt file2.txt > combined.txt
# Combine multiple files into one new file
```

**When to use:** Quick previews of small config files, combining simple text files, checking file contents before processing.

---

### `head` - View File Beginning

**Show only the first few lines.**

```bash
head dataset.csv
# Show first 10 lines (default)
```

```bash
head -n 5 dataset.csv
# Show only the first 5 lines
# Perfect for previewing CSV headers
```

**When to use:** Checking CSV column names, previewing log file formats, verifying file structure before processing.

---

### `tail` - View File End

**Show only the last few lines.**

```bash
tail dataset.csv
# Show last 10 lines (default)
```

```bash
tail -n 5 dataset.csv
# Show only the last 5 lines
```

```bash
tail -f training.log
# FOLLOW mode: continuously show new lines as they're added
# CRITICAL for monitoring live processes (training runs, server logs)
# Press Ctrl+C to exit
```

**When to use:** Checking how data ends, monitoring live log files (`-f` flag), debugging running processes in real-time.

---

### `less` - Interactive File Viewer

**Scroll through large files without overwhelming your terminal.**

```bash
less dataset.csv
# Opens file in scrollable viewer
# Use arrow keys or Page Up/Down to navigate
# Press 'q' to quit
# Press '/' to search within the file
```

**When to use:** Reading documentation, browsing large logs, examining data files - anytime you need controlled, scrollable viewing.

---

## 5. The Power: Pipes & Filters

This is the **"Secret Sauce"** for Data Science and AI Engineering. Linux allows you to chain small tools together to build complex data pipelines instantly.

### Understanding the Pipe (`|`)

**The pipe takes the OUTPUT of the command on the left and pushes it as INPUT to the command on the right.**

Think of it as a data assembly line - each command transforms the data and passes it along.

```bash
ls | wc -l
# Count how many files are in the current directory
# ls produces list → pipe → wc -l counts lines
```

**Why this matters:** Instead of writing custom scripts for every data task, you compose solutions from small, reusable tools.

---

### `grep` - Global Regular Expression Print

**Your searchlight for data. Find patterns in text.**

```bash
grep "error" server.log
# Find all lines containing "error" in server.log
# Case-sensitive by default
```

```bash
grep -i "warning" server.log
# Case-insensitive search (-i flag)
# Matches "Warning", "WARNING", "warning"
```

```bash
grep -r "TODO" ./project_code/
# Recursive search through all files in folder (-r flag)
# Essential for codebase searches
```

```bash
grep -n "bug" code.py
# Show line numbers (-n flag)
# Output: 42:# TODO: fix this bug
```

```bash
grep -c "error" server.log
# Count matches (-c flag)
# Returns just the number, not the lines themselves
```

```bash
grep -v "debug" app.log
# Inverse match (-v flag): show lines that DON'T contain "debug"
# Useful for filtering out noise
```

**When to use:** Searching logs for errors, finding API keys in code, locating TODOs, filtering out debug messages, counting occurrences of patterns.

---

### `find` - Locate Files in the Filesystem

**Search for files by name, type, size, or modification time.**

```bash
find . -name "config.json"
# Find files named exactly "config.json" starting from current directory (.)
```

```bash
find /home -name "*.pdf"
# Find all PDF files in /home and subdirectories
# The * wildcard matches any characters
```

```bash
find . -type f -size +10M
# Find all regular files (-type f) larger than 10 megabytes
# Essential for finding large model checkpoints eating disk space
```

```bash
find . -name "*.log" -mtime -7
# Find log files modified in the last 7 days
# -mtime -7 means "modified less than 7 days ago"
```

```bash
find . -name "*.txt" | xargs grep "password"
# Find all .txt files, then search inside them for "password"
# xargs feeds the found files to grep as arguments
```

**When to use:** Locating specific files in large projects, finding large files to clean up, searching by modification date, preparing file lists for batch operations.

---

### Redirection (`>`, `>>`)

**Save command output to files instead of printing to terminal.**

```bash
ls > file_list.txt
# Redirect output to file (overwrites existing content)
# Creates file_list.txt with directory contents
```

```bash
echo "Simulation complete" >> experiment_logs.txt
# Append output to file (keeps existing content, adds to end)
# Use >> for adding to logs without destroying previous entries
```

```bash
grep "CRITICAL" app.log > critical_errors.txt
# Save filtered output to new file
# Overwrites critical_errors.txt if it exists
```

**When to use:** Saving filtered logs, capturing command outputs for reports, building automated log aggregation pipelines.

---

### The Ultimate Combo

**Imagine you have a messy log file. You want to find all "Critical" errors, sort them, remove duplicates, and save to a report.**

```bash
cat app.log | grep "CRITICAL" | sort | uniq > report.txt
```

**Step-by-step breakdown:**
1. `cat app.log` - Read the log file
2. `| grep "CRITICAL"` - Filter only lines with "CRITICAL"
3. `| sort` - Sort the filtered lines alphabetically
4. `| uniq` - Remove duplicate lines (only works on sorted data)
5. `> report.txt` - Save the final result to a file

**Real AI/ML workflow example:**

```bash
find . -name "*.py" | xargs grep -l "import pandas" | wc -l
# Count how many Python files in your project use pandas
# 1. Find all .py files
# 2. Search each for "import pandas"
# 3. List just filenames (-l flag)
# 4. Count the lines (= number of files)
```

---

## 6. The Law: Permissions & Superusers

Linux is built for multi-user security. Every file has an owner and a set of permissions that control who can read, write, or execute it.

### Understanding `ls -l` Output

When you run `ls -l`, you see something like this:

```
-rwxr-xr--  1 user  staff  2048  Feb 10  15:23  script.sh
```

Let's break down the permission string: `-rwxr-xr--`

| Position | Meaning | Example |
|----------|---------|---------|
| 1st character | File type | `-` = file, `d` = directory, `l` = link |
| Characters 2-4 | Owner permissions | `rwx` = read, write, execute |
| Characters 5-7 | Group permissions | `r-x` = read, execute (no write) |
| Characters 8-10 | Others permissions | `r--` = read only |

**Permission meanings:**
- **r (read)** = View file contents or list directory contents
- **w (write)** = Modify file or create/delete files in directory
- **x (execute)** = Run file as program or enter directory

### Numeric Permissions

Each permission has a numeric value:

| Permission | Value | Meaning |
|------------|-------|---------|
| r (read) | 4 | Can read file |
| w (write) | 2 | Can modify file |
| x (execute) | 1 | Can run file |

You combine these by adding: `rwx` = 4+2+1 = **7**

**Common permission patterns:**

| Code | Permissions | Use Case |
|------|-------------|----------|
| 755 | `rwxr-xr-x` | Scripts and directories (owner full, others read+execute) |
| 644 | `rw-r--r--` | Regular files (owner write, others read-only) |
| 700 | `rwx------` | Private scripts (owner only) |
| 777 | `rwxrwxrwx` | Fully open (⚠️ dangerous, rarely needed) |

---

### `chmod` - Change Mode (Permissions)

**Control who can read, write, or execute files.**

```bash
chmod +x script.sh
# Add execute permission for everyone
# Makes script.sh runnable
```

```bash
chmod 755 deploy.sh
# Set specific permissions: owner=rwx, group=rx, others=rx
# Common for scripts and binaries
```

```bash
chmod 600 secret.txt
# Owner read+write, no one else can access
# Essential for private keys and sensitive data
```

```bash
chmod -R 755 project/
# Recursively apply permissions to directory and contents
# -R flag means: apply to this folder AND everything inside
```

**When to use:** Making scripts executable, securing sensitive files, fixing permission errors that prevent file access.

---

### Making a Script Executable - Complete Example

```bash
# Create a simple script
echo '#!/bin/bash' > hello.sh
echo 'echo Hello World!' >> hello.sh

# Try to run it (will fail)
./hello.sh
# Output: Permission denied

# Check current permissions
ls -l hello.sh
# Output: -rw-r--r--  (no execute permission)

# Make it executable
chmod +x hello.sh

# Verify permissions changed
ls -l hello.sh
# Output: -rwxr-xr-x  (now has execute bit)

# Now it works
./hello.sh
# Output: Hello World!
```

---

### `sudo` - Superuser Do

**Some actions (installing software, editing system files, accessing restricted areas) require Administrator privileges.**

```bash
sudo apt update
# Run command as root (system administrator)
# Required for system-wide package management
```

```bash
sudo chmod 644 /etc/hosts
# Modify system file permissions
# Normal users can't edit system files without sudo
```

```bash
sudo python3 train.py
# Run script with elevated privileges
# Sometimes needed for GPU access or system resources
```

**When to use:** Installing packages, editing system configurations, accessing restricted files, managing system services.

**Security note:** `sudo` will ask for your password. Like during initial setup, *no characters appear as you type*. This is normal - just type your password and press Enter.

---

## 7. Processes: What's Running?

Every running program is a process - you can inspect, control, and kill them.

### `ps aux` - Process Status

**List all running processes.**

```bash
ps aux
# Show all processes from all users
# a = all users, u = user-oriented format, x = include background processes
```

```bash
ps aux | grep python
# Find only processes containing "python"
# Essential for finding your training scripts
```

**Output format:**
```
USER    PID  %CPU %MEM    VSZ   RSS TTY   STAT START   TIME COMMAND
user   1234  25.3  2.1  500000 50000 ?    Sl   14:23   0:05 python train.py
```

Key columns:
- **PID**: Process ID (unique identifier)
- **%CPU**: CPU usage percentage
- **%MEM**: Memory usage percentage
- **COMMAND**: The actual command running

**When to use:** Identifying resource-hungry processes, finding process IDs for management, checking if your long-running script is still alive.

---

### `top` / `htop` - Live Process Monitor

**Real-time, continuously updating view of system processes.**

```bash
top
# Interactive display of processes, sorted by CPU usage
# Press 'q' to quit
# Press 'k' to kill a process by PID
```

```bash
htop
# Enhanced version with better UI and controls
# More intuitive color-coding and navigation
# Install with: sudo apt install htop
```

**When to use:** Monitoring system resource usage in real-time, identifying CPU/memory bottlenecks, watching training progress impact on system.

---

### `kill` - Terminate Processes

**Stop processes by their Process ID (PID).**

```bash
kill 1234
# Politely ask process 1234 to terminate (SIGTERM)
# Gives process chance to clean up and exit gracefully
```

```bash
kill -9 1234
# Force kill process 1234 immediately (SIGKILL)
# -9 is the nuclear option - process cannot ignore this
# Use when normal kill doesn't work
```

**When to use:** Stopping frozen scripts, terminating runaway training jobs, killing unresponsive programs.

---

### `pkill` - Kill by Name

**Terminate processes by name pattern instead of PID.**

```bash
pkill python
# Kill all processes with "python" in their name
# Dangerous - kills ALL matching processes
```

```bash
pkill -f "train.py"
# Kill processes matching full command line (-f flag)
# More precise than matching just the program name
```

**When to use:** Cleaning up multiple related processes, stopping all instances of a program, emergency process cleanup.

---

### Background Processes (`&`, `jobs`, `fg`)

**Run commands in the background so you can keep using the terminal.**

```bash
python train.py &
# Start training in background
# The & sends it to background immediately
# Output: [1] 1234 (job number and PID)
```

```bash
jobs
# List all background jobs in current terminal
# Output: [1]+ Running    python train.py
```

```bash
fg %1
# Bring background job 1 to foreground
# Makes it active again in your terminal
```

```bash
python train.py &
tail -f training.log
# Common pattern: run training in background, monitor log in foreground
```

**When to use:** Long-running tasks that don't need interaction, monitoring multiple processes, keeping terminal available while tasks run.

**AI/ML tip:** On GPU servers, your two best friends are:
- `ps aux | grep python` - Check if your training is still running
- `tail -f training.log` - Watch progress in real-time

---

## 8. The Supply Chain: Package Management

In Windows, you download `.exe` files from websites. In Linux, you use a **package manager** - like an app store for the terminal. In Ubuntu/Debian, this is `apt`.

### `apt update` - Refresh Package List

**Download the latest list of available software.**

```bash
sudo apt update
# Refreshes the database of available packages
# Doesn't install anything - just updates the catalog
# Always run this before installing packages
```

**When to use:** Before installing any software, after adding new repositories, to check for available updates.

---

### `apt install` - Install Software

**Download and install packages.**

```bash
sudo apt install python3
# Install Python 3 and its dependencies
```

```bash
sudo apt install git
# Install Git version control system
```

```bash
sudo apt install htop tree curl wget
# Install multiple packages at once
# Space-separated list
```

**When to use:** Setting up development environment, installing tools for your project, adding missing system utilities.

---

### `apt remove` - Uninstall Software

**Remove installed packages.**

```bash
sudo apt remove nano
# Uninstall the nano text editor
# (Please don't actually do this - nano is useful!)
```

```bash
sudo apt remove --purge nano
# Remove package AND its configuration files
# --purge ensures complete removal
```

**When to use:** Cleaning up unused software, removing conflicting packages, freeing disk space.

---

### `apt upgrade` - Update Installed Packages

**Install newer versions of currently installed software.**

```bash
sudo apt upgrade
# Upgrade all installed packages to latest versions
# Preserves configuration files
```

**When to use:** Periodic system maintenance, security updates, bug fixes.

---

## 9. Git Essentials: Version Control for Investigators

For the workshop challenge, you'll need to investigate the history of a codebase to find bugs. Git is your time machine and forensic toolkit.

### Basic Workflow

#### `git clone` - Copy a Repository

**Download a remote repository to your local machine.**

```bash
git clone https://github.com/username/repo.git
# Downloads the entire repository including all history
# Creates a folder named 'repo' in current directory
```

```bash
git clone https://github.com/username/repo.git my-folder
# Clone into a custom folder name
```

**When to use:** Starting work on a project, downloading workshop materials, accessing shared codebases.

---

#### `git status` - Check Repository State

**See what files have changed.**

```bash
git status
# Shows modified files, staged changes, untracked files
# Your constant companion for version control
```

**Output interpretation:**
- **Untracked**: New files Git doesn't know about
- **Modified**: Files changed since last commit
- **Staged**: Changes ready to be committed

**When to use:** Before committing (to see what you're about to save), checking if you forgot to add files, verifying clean working state.

---

#### `git add` - Stage Changes

**Mark files to be included in the next commit.**

```bash
git add file.py
# Stage a single file
```

```bash
git add .
# Stage all changes in current directory and subdirectories
# The . means "everything here"
```

```bash
git add *.py
# Stage all Python files
```

**When to use:** Preparing changes to commit, selectively choosing which modifications to save, building up a logical set of changes.

---

#### `git commit` - Save a Snapshot

**Record staged changes with a message.**

```bash
git commit -m "Fix data loading bug"
# Create commit with inline message (-m flag)
# Keep messages clear and descriptive
```

```bash
git commit
# Opens text editor for longer commit message
# First line is title, blank line, then detailed description
```

**Good commit message practices:**
- Start with verb: "Fix", "Add", "Remove", "Update"
- Be specific: "Fix data loading bug" not "Fix bug"
- Explain WHY if not obvious

**When to use:** After completing a logical unit of work, before switching tasks, creating save points you can return to.

---

#### `git push` - Upload to Remote

**Send your local commits to GitHub/remote server.**

```bash
git push origin main
# Push to 'origin' remote, 'main' branch
# origin = remote repository name
# main = branch name
```

```bash
git push
# Shorthand - pushes to configured default remote and branch
```

**When to use:** Sharing work with team, backing up local changes to cloud, submitting assignments, deploying code.

---

#### `git checkout -b` - Create and Switch Branch

**Create a new branch and switch to it in one command.**

```bash
git checkout -b feature-analysis
# Creates new branch named 'feature-analysis' and switches to it
# -b means "create new branch"
```

```bash
git checkout main
# Switch back to main branch (no -b flag)
```

**When to use:** Starting new features, working on separate tasks, experimenting without affecting main code.

---

### Forensic / Investigation Commands

These are your detective tools for the workshop challenge.

#### `git log` - View Commit History

**See the timeline of changes.**

```bash
git log
# Full commit history with messages, authors, dates
# Press 'q' to quit
```

```bash
git log --oneline
# Condensed format: one line per commit
# Shows abbreviated hash and message
# Essential for quick overview
```

```bash
git log --graph --all
# Visual branch history
# Shows merge patterns and branch relationships
```

```bash
git log --author="Alice"
# Filter commits by author
# Find all changes made by specific person
```

```bash
git log -S "api_key"
# Find commits that added or removed "api_key"
# Searches through actual code changes
# Essential for tracking when specific code appeared
```

**When to use:** Understanding project history, finding when bugs were introduced, identifying code authors, tracing feature development.

---

#### `git blame` - Who Wrote Each Line?

**See who last modified each line of a file and when.**

```bash
git blame filename.py
# Shows author, date, and commit hash for every line
# Your primary detective tool
```

```bash
git blame -L 50,100 filename.py
# Only show lines 50-100
# -L flag limits the range
```

**Output format:**
```
a3f8d9c2 (Alice  2025-01-15 14:23:11)   def load_data():
b1c4e7f9 (Bob    2025-01-16 09:15:22)       # BUG: Missing validation
```

**When to use:** Finding who introduced a bug, understanding why code was written that way (check commit message), assigning responsibility for fixes.

---

#### `git show` - View Commit Details

**See exactly what changed in a specific commit.**

```bash
git show a3f8d9c2
# Show the full diff for commit a3f8d9c2
# Displays commit message + all code changes
```

```bash
git show HEAD
# Show the most recent commit
```

```bash
git show a3f8d9c2:path/to/file.py
# Show specific file as it existed in that commit
```

**When to use:** Investigating suspicious commits found with `git blame`, understanding context of changes, verifying bug introduction point.

---

## 10. The Linux Detective Challenge

**Your mission:** A critical bug has been planted in the codebase. Multiple suspects left traces. Use your Linux and Git skills to investigate the repository, identify who introduced the bugs, collect evidence, and file your report.

### Investigation Phases

#### Phase 1: Recon (~10 min)

**Get oriented in the territory.**

```bash
# Generate the case files
./generate_case.sh

# Get visual overview of structure
tree -L 2

# List all files and sizes
ls -lah

# Note any suspicious patterns
```

**What to look for:** Unusual file names, recent modifications, files in odd locations.

---

#### Phase 2: Investigate (~15 min)

**Hunt for the bugs.**

```bash
# Search for bug markers
grep -r "BUG" .
grep -r "TODO" .
grep -r "FIXME" .

# Inspect suspicious files
cat suspicious_file.py
less large_file.log

# Eliminate red herrings
# Not every "BUG" comment is the target
```

**Remember:** Use `grep -n` to get line numbers, `grep -c` to count occurrences.

---

#### Phase 3: Forensics (~10 min)

**Track down the perpetrators.**

```bash
# Get commit history
git log --oneline

# Find who wrote the buggy lines
git blame suspicious_file.py

# Examine the suspicious commits
git show <commit-hash>

# Filter by author if you have suspects
git log --author="Suspect Name"
```

**Goal:** Identify exact commit hash, author, timestamp, and changed lines for each bug.

---

#### Phase 4: Document Report (~10 min)

**Compile your evidence.**

```bash
# Create investigation folder
mkdir investigation/

# Copy evidence files
cp buggy_file.py investigation/
cp related_log.txt investigation/

# Write your findings
echo "Bug found in commit a3f8d9c2" > investigation/REPORT.md
echo "Author: Alice" >> investigation/REPORT.md
echo "File: src/data_loader.py" >> investigation/REPORT.md
```

---

#### Phase 5: Submit (~5 min)

**File your report.**

```bash
# Stage your investigation
git add investigation/

# Commit with clear message
git commit -m "Investigation complete: identified 3 bugs"

# Push to your fork
git push origin main

# Open Pull Request on GitHub
# The automated system will verify your findings
```

**Success criteria:** GitHub Action auto-verifies your PR. If the case is solved correctly, it merges automatically.

---

## 11. Why This Is the Secret Sauce

**The Linux skills you learned today - mapped directly to AI/ML workflows.**

### Training a Model on Remote GPU Server

```bash
# Connect to remote server
ssh user@gpu-server

# Monitor training progress in real-time
tail -f training.log

# Check if training process is still running
ps aux | grep python

# Kill runaway training if needed
pkill -f "train.py"
```

---

### Checking If Your AI Job Is Still Running

```bash
# Quick check
htop
# Look for your Python process

# Detailed process info
ps aux | grep train.py

# List background jobs
jobs

# CPU usage over time
top
```

---

### Inspecting a Large Dataset Before Training

```bash
# Preview first 100 rows
head -n 100 data.csv

# Count total rows (excluding header)
wc -l data.csv

# Count specific label occurrences
grep -c 'label_1' data.csv

# Check for missing values (empty cells)
grep ',,' data.csv | wc -l

# Get unique values in a column (assuming CSV)
cut -d',' -f2 data.csv | sort | uniq
```

---

### Finding Large Model Files Eating Disk Space

```bash
# Find all pickle files over 100MB
find . -name '*.pkl' -size +100M

# List checkpoint folder contents with sizes
ls -lah checkpoints/

# Find biggest files in current directory tree
du -h . | sort -h | tail -n 20

# Check total disk usage
df -h
```

---

## 12. Keep Going: Next Steps

### Shell Scripting

Automate repetitive tasks by writing your first `.sh` script.

```bash
# Create a backup script
nano backup.sh

# Content:
#!/bin/bash
cp -r ~/project ~/project_backup_$(date +%Y%m%d)
echo "Backup complete"

# Make executable and run
chmod +x backup.sh
./backup.sh
```

---

### SSH & Remote Servers

Connect to cloud compute - the AWS/GCP workflow.

```bash
# Connect to remote server
ssh username@remote-ip

# Copy files to remote
scp local_file.txt username@remote-ip:/path/

# Copy files from remote
scp username@remote-ip:/path/file.txt ./
```

---

### Docker & Containers

Everything is Linux under the hood - start demystifying Docker.

```bash
# Run a container
docker run -it ubuntu bash

# List running containers
docker ps

# Inside container, you have full Linux environment
```

---

### Vim

The editor that lives everywhere (you may or may not like using it).

```bash
vim filename.txt
# Press 'i' to enter insert mode
# Type your content
# Press 'Esc' then ':wq' to save and quit
# Press 'Esc' then ':q!' to quit without saving
```

---

### `awk` & `sed`

Power tools for text processing and log analysis.

```bash
# Extract second column from CSV
awk -F',' '{print $2}' data.csv

# Replace text in file
sed 's/old/new/g' file.txt

# Count occurrences of pattern per line
awk '/error/ {count++} END {print count}' log.txt
```

---

### `cron` & `systemd`

Schedule jobs, manage services, automate everything.

```bash
# Edit cron schedule
crontab -e

# Run backup script every day at 2am
0 2 * * * /home/user/backup.sh

# Check systemd services
systemctl status nginx
```

---

