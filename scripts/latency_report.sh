#!/bin/bash

LOG_FILE="../logs/nginx.log"

echo "===== Latency Report ====="

awk '{sum += $NF; count++} END { 
    if(count > 0) 
        print "Average Response Time:", sum/count, "seconds"
}' $LOG_FILE