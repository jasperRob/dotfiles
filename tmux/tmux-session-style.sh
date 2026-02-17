#!/bin/bash
# Customize based on session name or other details
set -eou pipefail

# get the name of the current session
name="$(tmux display-message -p '#S')"

if [ "$name" == "dev" ]; then
  tmux set status-bg colour4
  tmux set status-fg colour0
elif [ "$name" == "notes" ]; then
  tmux set status-bg colour5
  tmux set status-fg colour0
elif [ "$name" == "config" ]; then
  tmux set status-bg colour8
  tmux set status-fg colour7
elif [ "$name" == "misc" ]; then
  tmux set status-bg colour2
  tmux set status-fg colour0
fi
