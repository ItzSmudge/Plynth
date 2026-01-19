# ☃️ Tutorial: Code a Snowman

**The Goal:** Collaboratively build a Python program that generates an ASCII snowman.
**The Setup:** Get into pairs.
* **User 1:** Elsa (The Maintainer/Owner)
* **User 2:** Anna (The Contributor)

---

## Step 1: Start working locally

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