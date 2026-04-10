#!/bin/bash

# ===========================================================
# System Health Monitor
# Author : Dev Koshti
# Description : Monitors system health automatically
# ===========================================================

DATE=$(date '+%Y-%m-%d %H:%M:%S')
REPORT_FILE=~/devops-journey/projects/system-health-monitor/reports/report-$(date +%Y-%m-%d).txt
ALERT_FILE=~/devops-journey/projects/system-health-monitor/alerts.log

# Reports folder
mkdir -p ~/devops-journey/projects/system-health-monitor/reports

echo "====================================" >> $REPORT_FILE
echo "  SYSTEM HEALTH REPORT" >> $REPORT_FILE
echo "  Generated: $DATE" >> $REPORT_FILE
echo "====================================" >> $REPORT_FILE

# ----- 1. CPU Usage -----
CPU=$(top -bn1 | grep "CPU" | head -1 | awk '{print $2+$4}')

echo "" >> $REPORT_FILE
echo " CPU Usage: ${CPU}%" >> $REPORT_FILE

if (( ${CPU%.*} > 80 )); then
	echo "ALERT: CPU Usage HIGH!" >> $ALERT_FILE
	echo "CPU HIGH at $DATE: ${CPU}%" >> $ALERT_FILE
fi

# ----- 2. RAM Usage -----
RAM_TOTAL=$(free -m | awk 'NR==2{print $2}')
RAM_USED=$(free -m | awk 'NR==2{print $3}')
RAM_PERCENT=$(awk "BEGIN {printf \"%.0f\", $RAM_USED*100/$RAM_TOTAL}")
echo "RAM Usage: ${RAM_USED}MB / ${RAM_TOTAL}MB (${RAM_PERCENT}%)" >> $REPORT_FILE

# ----- 3. Disk Usage -----
DISK=$(df -h ~ | awk 'NR==2{print $5}')
DISK_FREE=$(df -h ~ | awk 'NR==2{print $4}')
echo "Disk Usage: ${DISK} used | ${DISK_FREE} free" >> $REPORT_FILE

# ----- 4. Internet Check -----
if ping -c 1 google.com &> /dev/null; then
	echo "Internet: Connected" >> $REPORT_FILE
else
	echo "Internet: NOT Connected" >> $REPORT_FILE
	echo "INTERNET DOWN at $DATE" >> $ALERT_FILE
fi

# ----- 5. System Uptime -----
UPTIME=$(uptime -p)
echo "Uptime: $UPTIME" >> $REPORT_FILE

echo "" >> $REPORT_FILE
echo "======================================" >> $REPORT_FILE

# Terminal pe bhi dikhao
cat $REPORT_FILE
echo ""
echo "Report saved: $REPORT_FILE"
