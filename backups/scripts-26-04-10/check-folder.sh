#!/bin/bash

FOLDER_NAME="devops-journey"
if [ -d ~/$FOLDER_NAME ]; then
	echo"✅ Folder exist karta hai: $FOLDER_NAME"
else
	echo"❌ Folder nahi mila, bana raha hoon..."
	mkdir ~/$FOLDER_NAME
	echo "✅ Folder ban gaya!"
fi
