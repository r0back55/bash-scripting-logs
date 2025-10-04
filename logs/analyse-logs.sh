find . -name "*.log" -mtime -1

grep "ERROR" application.log
grep -c "ERROR" application.log
grep -c "FATAL" application.log

grep "ERROR" system.log
grep -c "ERROR" system.log
grep -c "FATAL" system.log
