#!/bin/bash

icon="" # nf-fa-memory
used=$(free -h | awk '/Mem:/ {print $3}')
total=$(free -h | awk '/Mem:/ {print $2}')
printf "%s %s/%s\n" "$icon" "$used" "$total"
