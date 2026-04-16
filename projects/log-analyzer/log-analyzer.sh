#!/bin/bash

DATE=$(date +%Y-%m-%d)
LOG_FILE=~/devops-journey/projects/log-analyzer/logs/app-$DATE.log
REPORT_FILE=~/devops-journey/projects/log-analyzer/reports/report-$DATE.txt

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file nahi mili!"
    exit 1
fi

echo "Analyzing logs..."

TOTAL=$(wc --lines < "$LOG_FILE")
ERRORS=$(grep -c "\[ERROR\]" "$LOG_FILE")
WARNINGS=$(grep -c "\[WARNING\]" "$LOG_FILE")
INFO=$(grep -c "\[INFO\]" "$LOG_FILE")

echo "========================================" > $REPORT_FILE
echo "  LOG ANALYSIS REPORT" >> $REPORT_FILE
echo "  Date: $DATE" >> $REPORT_FILE
echo "========================================" >> $REPORT_FILE
echo "" >> $REPORT_FILE
echo "SUMMARY:" >> $REPORT_FILE
echo "  Total Logs  : $TOTAL" >> $REPORT_FILE
echo "  INFO        : $INFO" >> $REPORT_FILE
echo "  WARNINGS    : $WARNINGS" >> $REPORT_FILE
echo "  ERRORS      : $ERRORS" >> $REPORT_FILE
echo "" >> $REPORT_FILE

if [ "$ERRORS" -gt 0 ]; then
    echo "ERROR DETAILS:" >> $REPORT_FILE
    grep "\[ERROR\]" "$LOG_FILE" >> $REPORT_FILE
    echo "" >> $REPORT_FILE
fi

if [ "$WARNINGS" -gt 0 ]; then
    echo "WARNING DETAILS:" >> $REPORT_FILE
    grep "\[WARNING\]" "$LOG_FILE" >> $REPORT_FILE
    echo "" >> $REPORT_FILE
fi

echo "SYSTEM HEALTH:" >> $REPORT_FILE
if [ "$ERRORS" -gt 5 ]; then
    echo "  Status: CRITICAL - Bahut zyada errors!" >> $REPORT_FILE
elif [ "$ERRORS" -gt 2 ]; then
    echo "  Status: WARNING - Kuch errors hain!" >> $REPORT_FILE
else
    echo "  Status: HEALTHY - Sab theek hai!" >> $REPORT_FILE
fi

echo "========================================" >> $REPORT_FILE

cat $REPORT_FILE
echo ""
echo "Report saved: $REPORT_FILE"
