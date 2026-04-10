#!/bin/bash

# Auto backup script
DATE=$(date +%y-%m-%d)
BACKUP_DIR=~/devops-journey/backups

# backup folder banao
mkdir -p $BACKUP_DIR

#Scripts folder ka backup lo
cp -r ~/devops-journey/scripts $BACKUP_DIR/scripts-$DATE

echo "Backup complete: $DATE" >> ~/devops-journey/backup.log
echo "Backup saved to: $BACKUP_DIR/scripts-$DATE"
