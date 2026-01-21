# Git Cheatsheet

## Basic commands
| Command | Description |
| :--- | :--- |
| `git init` | Creates a new repository. |
| `git add <file>` | Moves changes to the staging area. |
| `git commit -m "msg"` | Saves the staged changes as a permanent version. |
| `git status` | Shows what is modified or staged. |
| `git push` | Uploads your commits to GitHub. |
| `git pull` | Downloads new commits from GitHub. |
| `git checkout <name>` | Switches to <name> branch |
| `git checkout -b <name>` | Creates and switches to a new branch. |
| `git branch <name>` | Creates a new branch |

## Logging commands
| Command | Description |
| :--- | :--- |
| `git log` | View the commit history |
| `git reflog` | View the *full* commit, reset, branch history. Undo actions you thought were unsaveable |
| `git reset --hard <commit id>` | Reset to the specified commit with the files like they were |
| `git reset --soft <commit id>` | Reset to the specified commit with your current changes unstaged |
| `git blame <filename> ` | See who made changes to which lines in the file |

## Config commands
| Command | Description |
| :--- | :--- |
| `git config --global user.name <username>` | Tell git your username |
| `git config --global user.email <email>` | Tell git your email |
| `git config --global pull.rebase/pull.merge <true/false>` | Tell git what merge strategy you'd like to use |

## SSH and signed commits
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
