#!/bin/bash

LOG_DIR="/mnt/d/Programowanie/Bash_Linux/01_Bash_Basic/bash-scripting-logs/logs/"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "======================================"
echo "Analysing log Files"
echo "======================================"

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=(find $LOG_DIR -name "*.log" -mtime -1)


echo -e "\nSearching for ERROR logs in application.log file"
grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of ERRORS found:"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL found:"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of CRITICAL found:"
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$APP_LOG_FILE"


echo -e "\nSearching for ERROR logs in system.log"
grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of ERRORS found:"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of Fatal found:"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of CRITICAL found:"
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE"