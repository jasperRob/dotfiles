#!/bin/bash

icon="" # nf-oct-cpu
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
printf "%s %.1f%%\n" "$icon" "$cpu_usage"
