#!/bin/bash

echo "============== Server Performance Stats =============="
echo "Generated: $(date)"

echo "============== CPU Usage ================"
cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed 's/.*, *\([0-9.]*\)%* id.*/\1/')
echo "CPU Idle: ${cpu_idle}"
cpu_usage=$(awk "BEGIN{printf \"%.1f\", 100 - $cpu_idle}")
echo "CPU Usage: ${cpu_usage}%"

echo "============== Memory Usage ================"
free -m | awk 'NR==2 {printf "Used: %s MB / Total: %s MB (%.1f%%)\nFree: %s MB\n", $3, $2, $3*100/$2, $4}'

echo "============== Disk Usage =================="
df -h / | awk 'NR==2 {printf "Used: %s / Total: %s (%s used)\nFree: %s\n", $3, $2, $5, $4}'

echo "======= Top 5 Processes by CPU Usage ======="
ps aux --sort=%cpu | head -6

echo "======= Top 5 Processes by Mem Usage ======="
ps aux --sort=%mem | head -6
