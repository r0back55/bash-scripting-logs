#!/bin/bash

LOG_DIR="/mnt/d/Programowanie/Bash_Linux/01_Bash_Basic/bash-scripting-logs/logs/"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
LOG_ANALYSIS_REPORT="$LOG_DIR/log_analysis_report.txt"

echo "Analysing log Files" > $LOG_ANALYSIS_REPORT
echo "===================" >> $LOG_ANALYSIS_REPORT

echo -e "\nList of log files updated in last 24 hours" >> $LOG_ANALYSIS_REPORT
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1) >> $LOG_ANALYSIS_REPORT

for FILE in $LOG_FILES; do

    for PATTERN in "${ERROR_PATTERNS[@]}"; do    

        echo -e "\nSearching for $PATTERN logs in $FILE file" >> $LOG_ANALYSIS_REPORT
        grep "$PATTERN" "$FILE" >> $LOG_ANALYSIS_REPORT

        echo -e "\nNumber of $PATTERN found in $FILE file:" >> $LOG_ANALYSIS_REPORT

        ERROR_COUNT=$(grep -c "$PATTERN" "$FILE")
        echo $ERROR_COUNT >> $LOG_ANALYSIS_REPORT

        if [ $ERROR_COUNT -gt 10 ]; then
            echo -e "\n"
            echo -e "n\Warning: Action Required -> Too many $PATTERN errors found in $FILE!"
            echo -e "\n"
        fi

    done

done

echo -e "\nLog analysis completed." >> $LOG_ANALYSIS_REPORT