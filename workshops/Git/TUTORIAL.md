# ☃️ Tutorial: Code a Snowman

**The Goal:** Collaboratively build a Python program that generates an ASCII snowman.
**The Setup:** Get into pairs.
* **User 1:** Elsa (The Maintainer/Owner)
* **User 2:** Anna (The Contributor)

---

## Start working locally

**Both users** start by doing this on their own computers to warm up.

### 1. Create the Workspace
Open your terminal/command prompt.

```bash
mkdir snowman
cd snowman
git init
```
Great! Now you've made this regular folder into a Git repository. ```git init``` told Git to start tracking this folder. It creates a hidden ```.git``` folder that stores all the information Git needs to manage versions of your project.

### 2. Build your snowman

Create a file named ```drawsnowman.py``` and add your code. Remmeber, something simple would do, after all you're here to learn Git today!

Start by drawing the base of the snowman:

```python
def draw_snowman():
    #add your code in a function like this

if __name__ == "__main__":
    draw_snowman()
```

Now, the exciting stuff begins....

**Freeze** this moment in time: 

```bash
git add drawsnowman.py
git commit -m "Created base snowball"
``` 

What just happened? You made your first step in saving your changes. ```git add``` tells Git which changes (files) you want include.
```git commit``` just saved those changes as a permanent snapshot! You even get to label it with a message so you don't forget what the change you made was. 

### 3. Build your snowman a bit more
Go back to your Python file and edit it  to add a second snowball for the body. Save it, and repeat the commit process with a new message. 

```bash
git add drawsnowman.py
git commit -m "Added body section"
```
Now, check your history of magic: 

```bash
git log
```

You should see **two** entries, one for each commit you made:
```Added body section``` - your most recent change (at the top)
```Created base snowball``` - your first saved snapshot


And just like that, Git allows you to see the entire history of your project, with a list of every saved snapshot with explanations of what was done.

Try adding more commits to complete your snowman, and view your commit history. 

**PS**: if you've made it this far, you should have a magic snowman just like Olaf by now!

---


## Alternate Timelines (Branching)
*What if Olaf dreams of summer?*

### 1. Create a "Summer" Timeline
We want to try out a new idea *without touching the main snowman*.

```bash
git branch feature/summer
git checkout feature/summer
```

This creates a new branch, which is like an alternate timeline.
You’ve copied the project at its current state so you can experiment safely.

### 2. Make Summery Changes

Now you’re working inside the *summer timeline*.

Edit ```drawsnowman.py``` to add sunglasses, a puddle, or anything summery.

```bash
git add drawsnowman.py
git commit -m "Added summer sunglasses"
```

This saves your summer idea only in the ```feature/summer``` branch.
The main version is still untouched.

### 3. Return to Reality

You can switch back to your main, reguar snowman timeline with the ```checkout``` command.

```bash
git checkout main
```

Notice something surprising:
Your summer changes are gone from the file.

They weren’t deleted! They’re just stored safely in the other branch.
Each branch remembers its own version of the project.

### 4. Dealing with Mistakes

Oh no! You accidentally added a carrot nose… but Sven ate it.

Edit `drawsnowman.py` and add a carrot nose.

Save it, then commit the change:
 
```bash
git add drawsnowman.py
git commit -m "Added carrot nose"
```
You’ve now saved a change you *don’t* want.

**Realise the mistake**

Check your project history to find the commit where the nose was added using ```git log```.
Copy the **commit hash** (the long ID) for ```"Added carrot nose"```.

**Undo it (Safely)**

To remove the carrot nose without rewriting history, run:

```bash
git revert < your-commit-hash >
```
Instead of deleting the commit, Git creates a **new commit that reverses it**.

---

# The Kingdom (GitHub Setup)

**Elsa (Maintainer) Only:**

1. Head to GitHub and create a new repository called `snowman`.

2. Connect your local folder to your new GitHub repo:
```bash
   git remote add origin <your-github-url>
   git push -u origin main
```

3. **Protect the main branch** so nobody can accidentally break the snowman:
   - Go to your repo → **Settings** → **Branches**
   - Click **Add Branch Protection Rule**
   - Branch name pattern: `main`
   - Check: **"Require a pull request before merging"**
   - Save changes
   
   🔒 The gates are now locked! All changes must be reviewed before merging.

---

#  The Collaboration

**Anna (Contributor) Joins:**

1. Visit Elsa's GitHub repo and click the **Fork** button (top right).

2. Clone *your* fork to your computer:
```bash
   git clone <url-of-your-fork>
   cd snowman
```

**Anna's Mission:**

1. Create a branch for your feature:
```bash
   git checkout -b feature/arms
```

2. Edit the code to add stick arms to the snowman.

3. Save and push your changes:
```bash
   git add .
   git commit -m "Added stick arms"
   git push origin feature/arms
```

4. Go to GitHub and click **"Compare & Pull Request"** to propose your changes.

**Elsa's Duty:**

1. Review Anna's pull request on GitHub.

2. If the arms look good, click **Merge Pull Request**.

3. Your snowman is complete! ⛄

---

# The Merge Conflict (This is bad)

**Scenario:** Elsa and Anna both try to decorate the snowman's neck at the same time. Chaos ensues! ❄️💥


## 1. Elsa's Move (Local)

Elsa decides to add a cozy scarf.

1. Create a new branch:
```bash
   git checkout -b feature/scarf
```

2. Edit the code to add a scarf line.

3. Commit and push:
```bash
   git add .
   git commit -m "Added warm scarf"
   git push origin feature/scarf
```

4. Go to GitHub and merge this PR into `main`.


## 2. Anna's Move (Local)

Anna decides to add a fancy pearl necklace.  
**⚠️ Crucial:** Anna hasn't pulled Elsa's changes yet, so she thinks the neck is empty!

1. Switch to a new branch:
```bash
   git checkout -b feature/necklace
```

2. Edit the **same line** Elsa just changed and add a necklace.

3. Commit and push:
```bash
   git add .
   git commit -m "Added pearl necklace"
   git push origin feature/necklace
```

4. Go to GitHub and create a Pull Request.

---

## 3. The Conflict 

GitHub shows: **"Can't automatically merge"** because both changed the same line!

**Anna must resolve this:**

1. Link to Elsa's original repo (call it `upstream`):
```bash
   git remote add upstream <url-of-elsa-repo>
```

2. Fetch Elsa's latest changes:
```bash
   git fetch upstream
```

3. Merge Elsa's `main` into your branch:
```bash
   git merge upstream/main
```

4. **BOOM! Conflict detected!** Open the file in your editor and you'll see:
```python
   <<<<<<< HEAD
   print("  (:::)  ")  # Anna's necklace
   =======
   print("  ~===~  ")  # Elsa's scarf
   >>>>>>> upstream/main
```

5. **Decide what to keep:** Choose one, combine both, or create a compromise. Delete the conflict markers (`<<<`, `===`, `>>>`).

6. Save the file, then finish the merge:
```bash
   git add .
   git commit -m "Resolved neckwear conflict"
   git push origin feature/necklace
```

---
## 4. Peace At Last

Elsa reviews the updated PR and clicks **Merge**, with your snowman looking better than ever! ⛄
