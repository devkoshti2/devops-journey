#!/bin/bash

echo "Devops Daily Setup Script"
echo "aaj ki date: $(date)"
echo "---------------------------"

# Din number lo user se
echo "aaj konsa din hai? (Example: 3)"
read DAY_NUM

# folder banao
FOLDER=~/devops-journey/day-0$DAY_NUM
mkdir -p $FOLDER
echo "Folder ban gaya: $FOLDER"

# Notes file banao
touch $FOLDER/notes.txt
echo "aaj ka din: Day $DAY_NUM" >> $FOLDER/notes.txt
echo "Date: $(date)" >> $FOLDER/notes.txt
echo "Notes file ready!"

echo "----------------------------"
echo "All done! padhai shuru karo!"
