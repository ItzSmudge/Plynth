
# Linux: Tech Skills for an AI Era
**Workshop Guide**

This a full-guide on how to get started with WSL and Linux. If you're already done setting things up or are loooking for a specific command, you might find the cheatsheet more useful!
👉 **[View the Cheat Sheet](./CHEATSHEET.md)**
---

## 1. The Setup: Windows Subsystem for Linux (WSL)

The Windows Subsystem for Linux (WSL) is a powerful tool that allows you to run a full Linux environment directly on Windows, without the overhead of a virtual machine or the hassle of dual-booting. 

If you are on a Mac, you already have a UNIX-like environment and are ready to proceed. Most commands will be identical.

### Prerequisites (Windows)
* **OS:** Windows 10 version 2004+ or Windows 11.
* **BIOS:** Virtualization must be enabled.

### Step 1: Check Virtualization
WSL 2 requires hardware virtualization. Here is how to check if you have it:

1.  Open **Task Manager** (`Ctrl + Shift + Esc`).
2.  Go to the **Performance** tab.
3.  Select **CPU**.
4.  Look for **"Virtualization"** in the bottom-right.
    * **Enabled:** You are good to go.
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

*Tip: You may need to restart your computer after this step.*

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

## 2. The Territory: Navigation

The Linux terminal is more than a command runner—it’s a map and compass for controlling the system. Think of the filesystem as a giant inverted tree:

* **Root (`/`)**: The base of the tree. Everything starts here.
* **Directories**: Branches of the tree.
* **Files**: Leaves on the branches.
* **Home (`~`)**: Your personal branch (`/home/username`).

### Where am I?

The **P**rint **W**orking **D**irectory command acts as your GPS.

```bash
pwd
# Output example: /home/student

```

### What is around me?

**L**i**s**t the contents of the current directory.

```bash
ls          # Simple list
ls -a       # Show "all" (includes hidden files starting with .)
ls -l       # Long format (shows permissions, size, owner)

```

### Moving Around

**C**hange **D**irectory allows you to teleport between branches.

```bash
cd my_folder        # Go down into 'my_folder'
cd ..               # Go UP one level (back towards root)
cd ~                # Go to your Home directory
cd /                # Go to the Root of the filesystem
cd -                # Go back to the previous directory you were in

```

---

## 3. The Toolkit: Creation & Manipulation

Unlike a GUI, the terminal allows you to manipulate files with extreme speed and precision.

### Creating

```bash
mkdir data_logs              # Make a directory
touch notes.txt              # Create an empty file

```

### Copying (cp)

```bash
cp source.txt backup.txt     # Copy a file
cp source.txt data_logs/     # Copy file into a folder
cp -r folder_old/ folder_new/ # Copy an entire folder (-r = recursive)

```

### Moving & Renaming (mv)

In Linux, renaming is just moving a file to a new name.

```bash
mv file.txt data_logs/       # Move file into folder
mv old_name.txt new_name.txt # Rename file

```

### Deleting (rm)

⚠️ **Warning:** There is no Recycle Bin in the terminal. **Deleted files are gone forever.**

```bash
rm file.txt                  # Remove a file
rmdir empty_folder/          # Remove an empty folder
rm -rf folder_name/          # Force remove a folder and everything inside it
                             # (-r = recursive, -f = force)

```

### Searching (find)

Locate files within the massive tree structure.

```bash
# Syntax: find [where] [criteria] [what]
find . -name "config.json"   # Find file in current directory (.)
find /home -name "*.pdf"     # Find all PDF files in /home

```

---

## 4. The Power: Pipes & Filters

This is the "Secret Sauce" for Data Science and AI Engineering. Linux allows you to chain small tools together to build complex data pipelines instantly.

### Viewing Content (`cat`, `head`, `tail`)

Before you edit a file, you need to read it.

```bash
cat dataset.csv              # Dumps the whole file to screen (Chaos!)
head -n 5 dataset.csv        # Shows only the first 5 lines
tail -n 5 dataset.csv        # Shows only the last 5 lines
less dataset.csv             # Opens a scrollable viewer (Press 'q' to exit)

```

### The Pipe (`|`)

The pipe takes the **output** of the command on the left and pushes it as **input** to the command on the right.

```bash
# Count how many files are in the current directory
ls | wc -l  
# (ls lists files) -> (wc -l counts lines)

```

### The Filter (`grep`)

**G**lobal **R**egular **E**xpression **P**rint. This is your searchlight for data.

```bash
# Search for "error" in a log file
grep "error" server.log

# Case insensitive search (-i)
grep -i "warning" server.log

# Recursive search through all files in a folder (-r)
grep -r "TODO" ./project_code/

```

### Redirection (`>`, `>>`)

Save your command output to a file instead of printing it to the screen.

```bash
# Save output to a file (Overwrites existing content)
ls > file_list.txt

# Append output to the end of a file (Keeps existing content)
echo "Simulation complete" >> experiment_logs.txt

```

**The Ultimate Combo:**
Imagine you have a messy log file. You want to find all "Critical" errors and save them to a report.

```bash
cat app.log | grep "CRITICAL" | sort | uniq > report.txt

```

---

## 5. The Law: Permissions & Superusers

Linux is built for multi-user security. Every file has an owner and a set of permissions.

### Understanding `ls -l`

When you run `ls -l`, you see something like `-rwxr-xr--`.

* `r` = Read
* `w` = Write
* `x` = Execute (Run as a program)

### Changing Permissions (`chmod`)

```bash
chmod +x script.sh           # Make a file executable
chmod 777 file.txt           # Give everyone full permission (Dangerous!)

```

### The Superuser (`sudo`)

Some actions (installing software, editing system files) require Administrator privileges. We use `sudo` (**S**uper**u**ser **DO**).

```bash
sudo apt update              # Run command as root

```

*Note: It will ask for your password. It will not show characters as you type.*

---

## 6. The Supply Chain: Package Management

In Windows, you go to a website and download an `.exe`. In Linux, you use a package manager (like an App Store for the terminal). In Ubuntu, this is `apt`.

```bash
sudo apt update              # Refresh the list of available software
sudo apt install python3     # Install Python
sudo apt install git         # Install Git
sudo apt remove nano         # Uninstall software (please dont do this nano is useful)

```

---

## 7. The Time Machine: Git Essentials

For our workshop challenge, you will need to investigate the history of a codebase to find a bug.

```bash
git clone <url>              # Download a repository
git status                   # See changed files
git log                      # See history of changes
git blame filename.txt       # See who wrote each line of a file (The detective tool!)

```

