#!/bin/bash
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100% - $8"%"}')
MEM_USED=$(free -h | grep "Mem" | awk '{print ($3/$2)*100"%"}')
MEM_FREE=$(free -h | grep "Mem" | awk '{print ($4/$2)*100"%"}')
DISK_USED=$(df -h --total | grep "total" | awk '{print $5}')
DISK_FREE=$(df -h --total | grep "total" | awk '{print ($3/$2)*100"%"}')
TOP_FIVE_PROC_CPU=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)
TOP_FIVE_PROC_MEM=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)
# Display results
echo "===== System Resource Summary ====="
echo "CPU usage is : $CPU_USAGE"
echo "MEM used is  : $MEM_USED"
echo "MEM free is  : $MEM_FREE"
echo "Disk used is : $DISK_USED"
echo "Disk free is : $DISK_FREE"
echo
echo "Top 5 CPU processes:"
echo -e "$TOP_FIVE_PROC_CPU"
echo
echo "Top 5 MEM processes:"
echo -e "$TOP_FIVE_PROC_MEM"
