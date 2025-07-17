#!/bin/bash

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "yes"; then
  echo " Muted"
  exit 33 # Set urgent flag muted
fi
echo " Active"
exit 0
