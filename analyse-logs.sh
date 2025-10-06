#!/bin/bash

LOG_DIR="/mnt/d/Programowanie/Bash_Linux/01_Bash_Basic/bash-scripting-logs/logs/"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "======================================"
echo "Analysing log Files"
echo "======================================"

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)

for FILE in $LOG_FILES; do

    for PATTERN in "${ERROR_PATTERNS[@]}"; do    

        echo -e "\nSearching for $PATTERN logs in $FILE file"
        grep "$PATTERN" "$FILE"

        echo -e "\nNumber of $PATTERN found in $FILE file:"
        grep -c "$PATTERN" "$FILE"

    done

done

echo -e "\nLog analysis completed."