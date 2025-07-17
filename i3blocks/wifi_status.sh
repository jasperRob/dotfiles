#!/bin/bash

ICON_CONNECTED=""
ICON_DISCONNECTED="󰖪"

SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
SIGNAL=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d':' -f2)

if [ -n "$SSID" ]; then
  echo "$ICON_CONNECTED  $SIGNAL%"
else
  echo "$ICON_DISCONNECTED  Down"
  exit 33 # Set urgent flag if SSID not found
fi

exit 0
