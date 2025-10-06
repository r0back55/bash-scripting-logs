# Log Analyzer Script

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A simple Bash script designed to analyze log files in a specified directory. It identifies recently updated log files, searches for critical error patterns (ERROR, FATAL, CRITICAL), counts their occurrences, and generates a comprehensive report. If a file contains more than 10 instances of an error pattern, it issues a warning for immediate action.

This script is ideal for basic log monitoring in Linux/Unix environments, helping system administrators quickly spot potential issues.

## Features

- **Automated Log Discovery**: Finds all `.log` files updated within the last 24 hours using `find`.
- **Pattern Matching**: Searches for common error keywords: `ERROR`, `FATAL`, and `CRITICAL`.
- **Error Counting**: Uses `grep -c` to tally occurrences of each pattern per file.
- **Threshold Alerts**: Warns (via console output) if any pattern exceeds 10 matches in a file.
- **Report Generation**: Outputs a detailed analysis to `log_analysis_report.txt` for easy review.

## Prerequisites

- Bash shell (tested on Bash 4+).
- Standard Unix tools: `find`, `grep`.
- Write access to the log directory (default: `/mnt/d/Programowanie/Bash_Linux/01_Bash_Basic/bash-scripting-logs/logs/`).

No additional dependencies required.

## Installation

1. Clone or download this repository.
2. Make the script executable:
   ```bash
   chmod +x log_analyzer.sh
   ```
3. (Optional) Edit the script to customize:
   - `LOG_DIR`: Path to your log directory.
   - `ERROR_PATTERNS`: Array of error keywords to search.
   - `LOG_ANALYSIS_REPORT`: Output report file path.

## Usage

Run the script directly from the command line:

```bash
./log_analyzer.sh
```

- **Input**: Scans logs in `$LOG_DIR`.
- **Output**:
  - Console warnings for high error counts (e.g., "Warning: Action Required -> Too many ERROR errors found in example.log!").
  - A generated report file (`log_analysis_report.txt`) in `$LOG_DIR` with sections for:
    - List of recent log files.
    - Search results and counts per pattern per file.
    - Summary: "Log analysis completed."

### Example Output (Console Warning)
```
Warning: Action Required -> Too many ERROR errors found in /path/to/app.log!
```

### Example Report Snippet
```
Analysing log Files
===================

List of log files updated in last 24 hours
/path/to/app.log
/path/to/system.log

Searching for ERROR logs in /path/to/app.log file
[ERROR] Database connection failed at 2025-10-05 14:30:00
[FATAL] Service crashed unexpectedly

Number of ERROR found in /path/to/app.log file:
5

Searching for FATAL logs in /path/to/app.log file
[FATAL] Service crashed unexpectedly

Number of FATAL found in /path/to/app.log file:
1

Log analysis completed.
```

## How It Works

1. **Initialization**: Sets up the log directory, error patterns array, and report file.
2. **File Discovery**: Uses `find` to locate `.log` files modified in the last 24 hours (`-mtime -1`) and lists them in the report.
3. **Pattern Analysis Loop**:
   - For each recent log file.
   - For each error pattern.
     - Greps the file for matches and appends results to the report.
     - Counts matches with `grep -c`.
     - Appends the count to the report.
     - If count > 10, prints a warning to stdout.
4. **Completion**: Appends a final summary to the report.

The script is stateful in its report generation but runs idempotently (overwrites the report each time).

## Potential Improvements

- Add email notifications for warnings.
- Support custom date ranges or file filters.
- Integrate with cron for scheduled runs.
- Handle large logs with pagination or streaming.

## Troubleshooting

- **No files found**: Ensure `$LOG_DIR` exists and contains `.log` files updated recently. Test with `find $LOG_DIR -name "*.log" -mtime -1`.
- **Permission denied**: Run with `sudo` if accessing system logs.
- **Empty report**: Verify grep patterns match your log format (case-sensitive by default).

## Acknowledgments

- Built as a basic Bash scripting exercise.
- Thanks to the GNU Coreutils team for `find` and `grep`.

---

*Last updated: October 06, 2025*
