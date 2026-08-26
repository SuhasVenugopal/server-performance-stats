#!/bin/bash

echo "============== Server Performance Stats =============="
echo "Generated: $(date)"

echo "============== CPU Usage ================"
cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed 's/.*, *\([0-9.]*\)%* id.*/\1/')
echo "CPU Idle: ${cpu_idle}"
cpu_usage=$(awk "BEGIN{printf \"%.1f\", 100 - $cpu_idle}")
echo "CPU Usage: ${cpu_usage}"

echo "============== Memory Usage ================"

