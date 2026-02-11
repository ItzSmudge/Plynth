# 🐧 Linux & WSL Compact Cheatsheet

---

# WSL (Windows Subsystem for Linux)

| Action | Command |
|--------|----------|
| Install WSL | `wsl --install` |
| List Distros | `wsl --list --online` |
| Install Distro | `wsl --install -d Ubuntu` |
| List Installed | `wsl -l -v` |
| Shutdown WSL | `wsl --shutdown` |
| Access Windows Drive | `/mnt/c` |
| Access Linux from Windows | `\\wsl$` |

---

# Filesystem Basics

| Path | Meaning |
|------|----------|
| `/` | Root directory |
| `~` | Home directory |
| `/bin` | Core binaries |
| `/etc` | System configs |
| `/var/log` | Logs |
| `/tmp` | Temp files |
| `tree -L 2` | Show folder tree (depth 2) |

---

# Navigation

| Command | Purpose |
|----------|----------|
| `pwd` | Print current directory |
| `ls` | List files |
| `ls -la` | Detailed + hidden |
| `cd dir` | Enter directory |
| `cd ..` | Go up one level |
| `cd ~` | Go home |
| `cd -` | Previous directory |

---

# File & Directory Operations

| Action | Command |
|--------|----------|
| Create dir | `mkdir name` |
| Create nested dirs | `mkdir -p a/b/c` |
| Create file | `touch file.txt` |
| Copy file | `cp a.txt b.txt` |
| Copy dir | `cp -r src/ dest/` |
| Move/Rename | `mv old new` |
| Delete file | `rm file` |
| Delete dir | `rm -r folder/` |
| View file | `cat file.txt` |
| Paginated view | `less file.txt` |

⚠ `rm` is permanent.

---

# Search & Investigation

## grep (Search inside files)

| Use Case | Command |
|----------|----------|
| Basic search | `grep "text" file` |
| Case insensitive | `grep -i "text" file` |
| Recursive search | `grep -r "text" .` |
| Show line numbers | `grep -n "text" file` |
| Count matches | `grep -c "text" file` |
| List matching files | `grep -l "text" *.py` |

## find (Search files by metadata)

| Use Case | Command |
|----------|----------|
| By name | `find . -name "*.py"` |
| By size | `find . -size +100M` |
| By type (files only) | `find . -type f` |
| Modified last 7 days | `find . -mtime -7` |
| Combine with grep | `find . -name "*.txt" \| xargs grep "pass"` |

---

# Pipes & Redirection

| Symbol | Function | Example |
|--------|----------|----------|
| `|` | Pipe output | `cat log \| grep ERROR` |
| `>` | Overwrite file | `ls > files.txt` |
| `>>` | Append to file | `echo done >> log.txt` |
| `head -n 10` | First lines | `head -n 5 file` |
| `tail -n 10` | Last lines | `tail -n 5 file` |
| `tail -f` | Live monitor | `tail -f app.log` |
| `wc -l` | Count lines | `wc -l file.txt` |
| `sort` | Sort lines | `sort names.txt` |
| `uniq` | Remove duplicates | `sort file \| uniq` |
| `xargs` | Pass output as args | `find . -name "*.py" \| xargs grep pandas` |

---

# Permissions

| Symbol | Meaning |
|--------|----------|
| `r` | Read (4) |
| `w` | Write (2) |
| `x` | Execute (1) |
| `755` | `rwxr-xr-x` |
| `777` | Full access (unsafe) |

| Action | Command |
|--------|----------|
| Make executable | `chmod +x script.sh` |
| Set numeric perms | `chmod 755 file` |
| Change owner | `sudo chown user:group file` |
| Run as admin | `sudo command` |

---

# Processes & System Monitoring

| Action | Command |
|--------|----------|
| List processes | `ps aux` |
| Filter process | `ps aux \| grep python` |
| Live monitor | `top` |
| Better monitor | `htop` |
| Kill by PID | `kill PID` |
| Force kill | `kill -9 PID` |
| Kill by name | `pkill python` |
| Background job | `command &` |
| List jobs | `jobs` |
| Bring to front | `fg %1` |

---

# Package Management (Ubuntu/Debian)

| Action | Command |
|--------|----------|
| Update package list | `sudo apt update` |
| Upgrade packages | `sudo apt upgrade` |
| Install package | `sudo apt install git` |
| Remove package | `sudo apt remove git` |

---

# Git Essentials

## Core Workflow

| Action | Command |
|--------|----------|
| Clone repo | `git clone <url>` |
| Status | `git status` |
| Stage all | `git add .` |
| Commit | `git commit -m "msg"` |
| Push | `git push origin main` |
| New branch | `git checkout -b name` |

## Investigation / Forensics

| Action | Command |
|--------|----------|
| Compact log | `git log --oneline` |
| Visual graph | `git log --all --graph` |
| Filter by author | `git log --author="X"` |
| Search string | `git log -S "keyword"` |
| Inspect commit | `git show <hash>` |
| Line history | `git blame file.py` |
| Authors list | `git log --format='%an' \| sort \| uniq` |

---

# AI / Remote Workflow Commands

| Task | Command |
|------|----------|
| SSH into server | `ssh user@server` |
| Monitor training log | `tail -f training.log` |
| Check Python processes | `ps aux \| grep python` |
| Inspect dataset | `head data.csv` |
| Count dataset rows | `wc -l data.csv` |
| Count label frequency | `grep -c label_1 data.csv` |
| Find large models | `find . -name "*.pkl" -size +100M` |
| Check disk usage | `ls -lah` |

---

# Shell Productivity

| Shortcut | Function |
|-----------|----------|
| `Tab` | Autocomplete |
| `↑ / ↓` | History |
| `Ctrl + C` | Kill process |
| `Ctrl + L` | Clear screen |
| `Ctrl + R` | Search history |

---

# Advanced Tools (Mentioned in Workshop)

| Tool | Purpose |
|------|----------|
| `vim` | Terminal editor |
| `awk` | Pattern-based text processing |
| `sed` | Stream editing |
| `cron` | Schedule tasks |
| `systemctl` | Manage services |
| `docker` | Containers |
| `ssh` | Remote access |

---

