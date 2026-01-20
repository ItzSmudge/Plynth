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
