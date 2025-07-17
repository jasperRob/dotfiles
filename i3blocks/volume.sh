#!/bin/bash

# Grab the fifth element from the pactl output using awk
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume:/ {print $5; exit}')

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
  echo "󰝟  Muted"
  exit 33 # Set urgent flag muted
fi

echo "  $VOLUME"
exit 0
