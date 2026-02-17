#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Mapping: source|destination pairs
links="
$DOTFILES_DIR/zsh/.zshrc|$HOME/.zshrc
$DOTFILES_DIR/alacritty/mac/alacritty.toml|$HOME/.config/alacritty/alacritty.toml
$DOTFILES_DIR/starship/starship.toml|$HOME/.config/starship.toml
$DOTFILES_DIR/tmux/.tmux.conf|$HOME/.tmux.conf
$DOTFILES_DIR/aerospace/.aerospace.toml|$HOME/.aerospace.toml
"

echo "$links" | while IFS='|' read -r src dest; do
  [ -z "$src" ] && continue

  # Create parent directory if needed
  mkdir -p "$(dirname "$dest")"

  # Back up existing regular file (skip if already a symlink)
  if [ -f "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up: $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -sf "$src" "$dest"
  echo "Linked: $dest -> $src"
done
