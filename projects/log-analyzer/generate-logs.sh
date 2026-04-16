#!/bin/bash

# ==========================================
# Log Generator Script
# Fake logs banata hai practice ke liye
# ==========================================

LOG_FILE=~/devops-journey/projects/log-analyzer/logs/app-$(date +%Y-%m-%d).log

echo "Generating logs..."

# 20 fake log entries banao
for i in {1..20}
do
	#random type choose banao
	TYPES=("INFO" "INFO" "INFO" "WARNING" "ERROR")
	TYPE=${TYPES[$RANDOM % 5]}

	MESSAGES_INFO=("User Logged in" "Page Loaded" "Date saved" "Request completed")
	MESSAGE_WARN=("High memory usage" "Slow response time" "Disk space low")
	MESSAGE_ERROR=("Datebase connection failed" "Server timeout" "File not found")

	if [ "$TYPE" == "INFO" ]; then
		MSG=${MESSAGE_INFO[$RANDOM % 4]}
	elif [ "$TYPE" == "WARNING" ]; then
		MSG=${MESSAGE_WARN[$RANDOM % 3]}
	else
		MSG=${MESSAGE_ERROR[$RANDOM % 3]}
	fi

	echo "$(date '+%Y-%m-%d %H:%M:%S') [$TYPE] $MSG" >> $LOG_FILE
	sleep 0.1
done

echo "Log file ready: $LOG_FILE"
cat $LOG_FILE
