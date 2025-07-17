#!/bin/bash

ACPI_OUT=$(acpi -b)
BAT=$(echo "$ACPI_OUT" | grep -oP '\d{1,3}%' | tr -d '%')
STATUS=$(echo "$ACPI_OUT" | grep -o "Not charging\|Charging\|Discharging\|Full")

if [[ "$STATUS" == "Charging" ]]; then
  if [ $BAT -gt 90 ]; then
    ICON="󰂅"
  elif [ $BAT -gt 30 ]; then
    ICON="󰢝"
  else
    ICON="󰢜"
  fi
elif [[ "$STATUS" == "Discharging" || "$STATUS" == "Not charging" ]]; then
  if [ $BAT -gt 90 ]; then
    ICON="󰁹"
  elif [ $BAT -gt 30 ]; then
    ICON="󰁾"
  else
    ICON="󰁺"
  fi
elif [[ "$STATUS" == "Full" ]]; then
  ICON="󰁹"
else
  ICON="󱉝"
fi

echo "$ICON $BAT%"

# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
