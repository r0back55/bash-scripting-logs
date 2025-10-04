#!/bin/bash

echo "Analysing log Files"
echo "==================="

echo -e "\nList of log files updated in last 24 hours"
find . -name "*.log" -mtime -1

echo -e "\nSearching for ERROR logs in application.log file"
grep "ERROR" application.log

echo -e "\nNumber of ERRORS found:"
grep -c "ERROR" application.log

echo -e "\nNumber of FATAL found:"
grep -c "FATAL" application.log

echo -e "\nSearching for ERROR logs in system.log"
grep "ERROR" system.log

echo -e "\nNumber of ERRORS found:"
grep -c "ERROR" system.log

echo -e "\nNumber of Fatal found:"
grep -c "FATAL" system.log
