# Linux & WSL Workshop Cheatsheet

##  Setup 

### **WSL Commands**

| Action | Command | Note |
| --- | --- | --- |
| **Install WSL** | `wsl --install` | Run in PowerShell as Admin. |
| **List Distros** | `wsl --list --online` | See available Linux versions. |
| **Install Distro** | `wsl --install -d <Name>` | e.g., `wsl --install -d Ubuntu` |
| **Status Check** | `wsl -l -v` | Verify version (should be 2). |
| **Shutdown** | `wsl --shutdown` | Stops all running instances. |

### **Filesystem Map**

* `/` (Root): The start of the filesystem tree.
* `~` (Home): Your user folder (`/home/username`).
* `/mnt/c`: Your Windows C: drive accessed from Linux.
* `\\wsl$`: Access Linux files from Windows Explorer.

---

## Navigation

| Command | Description | Example |
| --- | --- | --- |
| `pwd` | Print Working Directory (Where am I?). | `pwd` |
| `ls` | List files in current folder. | `ls` |
| `ls -a` | List **all** (including hidden dotfiles). | `ls -a` |
| `ls -l` | List with **details** (size, owner, perm). | `ls -l` |
| `cd <dir>` | Change directory. | `cd Documents` |
| `cd ..` | Go up one level. | `cd ..` |
| `cd ~` | Go to home directory. | `cd ~` |
| `cd -` | Go to previous directory. | `cd -` |

---

## File Manipulation

| Action | Command | Note |
| --- | --- | --- |
| **Create Folder** | `mkdir <name>` | `mkdir projects` |
| **Create File** | `touch <name>` | `touch notes.txt` |
| **Copy File** | `cp <src> <dest>` | `cp data.csv backup.csv` |
| **Copy Folder** | `cp -r <src> <dest>` | `cp -r src/ dest/` |
| **Move/Rename** | `mv <src> <dest>` | `mv old.txt new.txt` |
| **Delete File** | `rm <file>` | **Permanent!** `rm trash.txt` |
| **Delete Folder** | `rm -r <folder>` | **Permanent!** `rm -r logs/` |

---

## Search & Filter (Data Forensics)

### **Find Files** (`find`)

*Syntax:* `find <where> <criteria> <what>`

* Find by name: `find . -name "*.py"` (Find Python files in current folder)
* Find by size: `find . -size +100M` (Find files larger than 100MB)

### **Search Content** (`grep`)

*Syntax:* `grep <options> "text" <file>`

* Basic search: `grep "Error" app.log`
* Recursive search: `grep -r "TODO" .` (Search in all files in folder)
* Case insensitive: `grep -i "fail" build.log`

---

## Pipes & Redirection

*Combine commands to build data pipelines.*

| Symbol | Name | Function | Example |
| --- | --- | --- | --- |
| `|` | **Pipe** | Pass output of Left to input of Right. | `cat log.txt | grep "Error"` |
| `>` | **Redirect** | Write output to a file (Overwrite). | `ls > file_list.txt` |
| `>>` | **Append** | Add output to end of a file. | `echo "Done" >> log.txt` |
| `head` | **Head** | Show first 10 lines. | `head -n 5 file.txt` |
| `tail` | **Tail** | Show last 10 lines. | `tail -f log.txt` (Live watch) |
| `sort` | **Sort** | Sort lines alphabetically/numerically. | `sort names.txt` |
| `uniq` | **Unique** | Filter out duplicate lines. | `sort names.txt | uniq` |

---

## Permissions & Superuser

### **File Permissions** (`ls -l`)

Format: `-rwxr-xr--` (User / Group / Others)

* `r`: Read
* `w`: Write
* `x`: Execute (Run as program)

### **Modify Access**

| Command | Action | Example |
| --- | --- | --- |
| `chmod +x` | Make file executable. | `chmod +x script.sh` |
| `chmod 777` | Give full permission (Unsafe). | `chmod 777 public_file` |
| `chown` | Change file owner. | `sudo chown user:group file` |
| `sudo` | **SuperUser DO** (Run as Admin). | `sudo apt update` |

---

## System & Packages (Ubuntu/Debian)

| Action | Command | Note |
| --- | --- | --- |
| **Update List** | `sudo apt update` | Refresh package catalog. |
| **Install App** | `sudo apt install <name>` | `sudo apt install python3` |
| **Remove App** | `sudo apt remove <name>` | `sudo apt remove git` |
| **Process List** | `top` or `htop` | Task Manager. |
| **Kill Process** | `kill <PID>` | Stop a specific process ID. |

---

## Useful Shortcuts

* **Tab:** Autocomplete file/folder names.
* **Up/Down Arrow:** Cycle through command history.
* **Ctrl + C:** Kill current running command.
* **Ctrl + L:** Clear the terminal screen.
* **Ctrl + R:** Search command history.