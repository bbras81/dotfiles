#!/bin/bash

# CPU Usage
cpu_usage() {
  read cpu user nice system idle iowait irq softirq steal guest guest_nice </proc/stat
  total=$((user + nice + system + idle + iowait + irq + softirq + steal))
  used=$((user + system + nice))
  sleep 1
  read cpu2 user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 guest2 guest_nice2 </proc/stat
  total2=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))
  used2=$((user2 + system2 + nice2))
  cpu_percent=$((100 * (used2 - used) / (total2 - total)))
  echo -n " ${cpu_percent}% "
}

# Memory Usage (in percentage)
memory_usage() {
  mem_info=$(free | awk '/Mem:/ {print $3, $2}')
  mem_used=$(echo $mem_info | cut -d' ' -f1)
  mem_total=$(echo $mem_info | cut -d' ' -f2)
  mem_percent=$((100 * mem_used / mem_total))
  echo " ${mem_percent}%"
}

# Output CPU and Memory
cpu_usage
memory_usage
