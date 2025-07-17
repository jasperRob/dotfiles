#!/bin/bash

icon="" # nf-fa-hdd
used=$(df -h / | awk 'NR==2 {print $3}')
total=$(df -h / | awk 'NR==2 {print $2}')
printf "%s %s/%s\n" "$icon" "$used" "$total"
