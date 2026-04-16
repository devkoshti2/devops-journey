#!/bin/bash

# ==========================================
# Log Cleaner Script
# 7 din se purane logs delete karta hai
# ==========================================

LOG_DIR=~/devops-journey/projects/log-analyzer/logs
REPORT_DIR=~/devops-journey/projects/log-analyzer/reports

echo " Log Cleaner Starting..."
echo "Date: $(date)"
echo ""

# 7 din se purani files count karo
OLD_LOGS=$(find $LOG_DIR -name "*.log" -mtime +7 | wc --lines)
OLD_REPORTS=$(find $REPORT_DIR -name "*.txt" -mtime +7 | wc --lines)

echo "Purani log files (7 din+): $OLD_LOGS"
echo "Purani report files (7 din+): $OLD_REPORTS"

#Delete karo
find $LOG_DIR -name "*.log" -mtime +7 -delete
find $REPORT_DIR -name "*.txt" -mtime +7 -delete

echo ""
echo "Cleaning complete!"
echo "Remaining logs: $(ls $LOG_DIR | wc --lines)"
