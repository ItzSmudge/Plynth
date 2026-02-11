#!/bin/bash

# ==============================================================================
# WORKSHOP CHALLENGE GENERATOR: "The Poisoned Model"
# ==============================================================================
# This script procedurally generates a Git repository with "dummy" training data,
# logs, and code. It injects 3 specific bugs/clues and backdates the git history.
# ==============================================================================

REPO_NAME="incident_report_001"
SUSPECTS=("Tim" "Helitha" "Josh" "Edwin" "Xav")
CULPRIT="Josh"

# 1. Clean up previous runs
rm -rf "$REPO_NAME"
mkdir "$REPO_NAME"
cd "$REPO_NAME" || exit

# 2. Initialize Git Repository
git init -q
git config user.email "workshop@example.com"
git config user.name "System"

echo "Initializing Project Structure..."

# 3. Create File Structure
mkdir -p data/training
mkdir -p src/models
mkdir -p logs/archive
mkdir -p configs

# 4. Generate "Noise" (Normal Files)
# We create 50 dummy data files to make manual searching impossible
for i in {1..50}; do
    echo "id,value,label" > "data/training/batch_$i.csv"
    for j in {1..100}; do
        echo "$RANDOM,$RANDOM,0" >> "data/training/batch_$i.csv"
    done
done

# Create dummy python scripts
echo "import numpy as np" > src/models/transformer.py
echo "import torch" > src/models/optimizer.py
echo "learning_rate: 0.001" > configs/hyperparams.yaml

# Create dummy logs
for i in {1..10}; do
    echo "[INFO] Training epoch $i completed. Loss: 0.$RANDOM" > "logs/archive/run_$i.log"
done

# Initial Commit
git add .
git commit -q -m "Initial project setup" --date="2 weeks ago"

# 5. Simulate Development History (Random Commits)
for i in {1..5}; do
    DEV=${SUSPECTS[$RANDOM % ${#SUSPECTS[@]}]} 
    git config user.name "$DEV"
    
    echo "# Updated by $DEV" >> src/models/optimizer.py
    git commit -q -am "Optimization update $i" --date="$((10-i)) days ago"
done

# ==============================================================================
# INJECT CLUE #1: The Poisoned Data (Grep Challenge)
# We hide a "POISON" label in one random CSV file.
TARGET_CSV="data/training/batch_$((1 + RANDOM % 50)).csv"
echo "99999,99999,POISON_LABEL" >> "$TARGET_CSV"

git config user.name "Alice"
git add "$TARGET_CSV"
git commit -q -m "Added new training batch" --date="5 days ago"

# ==============================================================================
# INJECT CLUE #2: The Hidden Miner (Find/Permissions Challenge)
# We create a large hidden file masquerading as a picture or log
# It will have executable permissions (777) which is suspicious.

MINER_PATH="logs/.sys_cache"
dd if=/dev/zero of="$MINER_PATH" bs=1M count=15 2>/dev/null # Create 15MB file
chmod 777 "$MINER_PATH"

git config user.name "Bob"
git add "$MINER_PATH"
git commit -q -m "Update system cache" --date="4 days ago"

# ==============================================================================
# INJECT CLUE #3: The Sabotaged Config (Git Blame Challenge)
# The culprit changes the learning rate to zero, breaking the model.

git config user.name "$CULPRIT"
echo "learning_rate: 0.0000000" > configs/hyperparams.yaml
git commit -q -am "Adjust hyperparameters for stability" --date="2 days ago"

# More noise on top to bury the bad commit
git config user.name "Charlie"
echo "# Reviewed config" >> configs/hyperparams.yaml
git commit -q -am "Code review" --date="1 day ago"

# ==============================================================================
# GENERATE VERIFICATION SCRIPT
# This creates a small script the student can run to check their answers.
# It compares their 'solution.txt' against the actual generated values.

cat <<EOF > verify.sh
#!/bin/bash
SCORE=0

if [ ! -f solution.txt ]; then
    echo "solution.txt not found!"
    exit 1
fi

echo "Verifying Evidence..."

# Check 1: Did they find the Poisoned File?
REAL_POISON_FILE="$TARGET_CSV"
USER_POISON_FILE=\$(grep "Evidence 1:" solution.txt | cut -d: -f2 | xargs)

if [[ "\$REAL_POISON_FILE" == *"\$USER_POISON_FILE"* ]] && [[ -n "\$USER_POISON_FILE" ]]; then
    echo "Evidence 1 Correct: Found the poisoned data batch."
    ((SCORE++))
else
    echo "Evidence 1 Incorrect. Keep looking for the 'POISON_LABEL'."
fi

# Check 2: Did they find the Hidden Process/File?
REAL_MINER="$MINER_PATH"
USER_MINER=\$(grep "Evidence 2:" solution.txt | cut -d: -f2 | xargs)

if [[ "\$REAL_MINER" == *"\$USER_MINER"* ]] && [[ -n "\$USER_MINER" ]]; then
    echo "Evidence 2 Correct: Found the hidden executable."
    ((SCORE++))
else
    echo "Evidence 2 Incorrect. Look for hidden files or suspicious permissions."
fi

# Check 3: Did they find the Culprit?
REAL_CULPRIT="$CULPRIT"
USER_CULPRIT=\$(grep "Evidence 3:" solution.txt | cut -d: -f2 | xargs)

if [[ "\$REAL_CULPRIT" == "\$USER_CULPRIT" ]]; then
    echo "Evidence 3 Correct: You identified the saboteur."
    ((SCORE++))
else
    echo "Evidence 3 Incorrect. Who changed the learning rate to 0?"
fi

echo "---------------------------------------------------"
if [ \$SCORE -eq 3 ]; then
    echo "CASE CLOSED. Excellent work, Detective."
else
    echo "Case requires further investigation. (\$SCORE/3 solved)"
fi
EOF

chmod +x verify.sh

echo "=================================================================="
echo "INCIDENT REPORT GENERATED"
echo "=================================================================="
echo "LOCATION: $(pwd)"
echo "MISSION:  A model training run failed. We suspect sabotage."
echo "          Find the 3 pieces of evidence."
echo ""
echo "INSTRUCTIONS:"
echo "1. Explore the folder."
echo "2. Create a file named 'solution.txt' with the following format:"
echo ""
echo "   Evidence 1: filename_of_poisoned_data"
echo "   Evidence 2: filename_of_hidden_miner"
echo "   Evidence 3: name_of_person_who_broke_config"
echo ""
echo "3. Run ./verify.sh to check your work."
echo "=================================================================="