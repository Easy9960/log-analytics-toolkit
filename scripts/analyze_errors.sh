#!/bin/bash

LOG_FILE="../logs/app.log"

echo "===== ERROR SUMMARY ====="
grep "ERROR" $LOG_FILE | awk '{print $2}' | sort | uniq -c | sort -nr

echo ""
echo "Total ERROR count:"
grep -c "ERROR" $LOG_FILE