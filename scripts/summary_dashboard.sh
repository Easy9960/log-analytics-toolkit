#!/bin/bash

REPORT="../reports/daily_report.txt"

echo "Generating Daily Report..."

{
echo "===== DAILY LOG SUMMARY ====="
date
echo ""

echo "Total App Errors:"
grep -c "ERROR" ../logs/app.log
echo ""

echo "Top 3 Error Times:"
grep "ERROR" ../logs/app.log | awk '{print $2}' | sort | uniq -c | sort -nr | head -3
echo ""

echo "Suspicious IPs:"
grep ' 401 ' ../logs/nginx.log | awk '{print $1}' | sort | uniq -c | awk '$1 > 5'
echo ""

echo "Average Latency:"
awk '{sum += $NF; count++} END { if(count > 0) print sum/count }' ../logs/nginx.log

} > $REPORT

echo "Report generated at $REPORT"