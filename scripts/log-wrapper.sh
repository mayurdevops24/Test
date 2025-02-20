#!/bin/bash
# Log Wrapper: Captures command stdout, stderr, and timing.

LOG_DIR="${LOG_DIR:-logs}"
mkdir -p "$LOG_DIR"

# Input parameters: a label for the log and the command to run
LABEL="$1"
shift

LOG_FILE="$LOG_DIR/${LABEL// /_}.log"

# Log start with timestamp and project info if available
echo "[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] Starting $LABEL (Project: ${PROJECT_ID:-N/A})" | tee -a "$LOG_FILE"

# Record start time
start_time=$(date +%s)

# Run the command, capture both stdout and stderr, and prepend timestamps
"$@" 2>&1 | awk '{ print strftime("[%Y-%m-%d %H:%M:%S]"), $0; fflush(); }' | tee -a "$LOG_FILE"

# Record end time and compute duration
end_time=$(date +%s)
duration=$((end_time - start_time))
echo "[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] Finished $LABEL in ${duration} seconds" | tee -a "$LOG_FILE"
