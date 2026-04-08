# dotfiles

Personal dotfiles for macOS and Linux. Managed via symlinks created by
`install.sh`.

## Structure

```
dotfiles/
├── install.sh          # Symlink installer
├── zsh/
│   └── .zshrc
├── tmux/
│   └── .tmux.conf
├── starship/
│   └── starship.toml
├── alacritty/
│   ├── mac/
│   │   ├── alacritty.toml
│   │   └── themes/nord.toml
│   └── linux/
│       ├── alacritty.toml
│       └── catppuccin-frappe.toml
├── aerospace/
│   └── .aerospace.toml
├── git/
│   └── config
├── wt/
│   └── wt.toml
├── i3/                 # Linux only
│   └── config
├── i3blocks/           # Linux only
│   ├── config
│   └── *.sh            # Status bar scripts
├── rofi/               # Linux only
│   └── config.rasi
└── dunst/              # Linux only
    └── dunstrc
```

## Installation

```bash
git clone https://github.com/jasperRob/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The script creates symlinks for macOS configs. Existing files are backed up with
a `.bak` suffix. Already-correct symlinks are skipped.

**Installed symlinks:**

| Source                         | Target                               |
| ------------------------------ | ------------------------------------ |
| `zsh/.zshrc`                   | `~/.zshrc`                           |
| `tmux/.tmux.conf`              | `~/.tmux.conf`                       |
| `starship/starship.toml`       | `~/.config/starship.toml`            |
| `alacritty/mac/alacritty.toml` | `~/.config/alacritty/alacritty.toml` |
| `aerospace/.aerospace.toml`    | `~/.aerospace.toml`                  |
| `wt/wt.toml`                   | `~/.config/wt.toml`                  |

Linux configs (i3, rofi, dunst) must be symlinked manually.

## Dependencies

**Core:**

- zsh
- [tmux](https://github.com/tmux/tmux) +
  [tpm](https://github.com/tmux-plugins/tpm)
- [Starship](https://starship.rs)
- [Alacritty](https://alacritty.org)
- [Neovim](https://neovim.io)

**macOS:**

- [AeroSpace](https://github.com/nikitabobko/AeroSpace) (tiling WM)
- CaskaydiaMono Nerd Font

**Linux (X11):**

- i3, i3blocks, rofi, dunst
- feh, xss-lock, i3lock, nm-applet
- pactl, brightnessctl, playerctl, acpi
- JetBrainsMono Nerd Font

**Dev tools:**

- nvm, terraform, Google Cloud SDK

## Configuration Details

### Zsh

Vim keybindings (`bindkey -v`) throughout. Notable features:

- **Clipboard integration:** `yy` (normal mode) and `y` (visual mode) copy to
  system clipboard
- **History:** 10,000 entries, no cross-session sharing
- **`load`** — reload zsh or tmux config: `load zsh` / `load tmux`
- **`edit`** — open a config in nvim:
  `edit zsh|alacritty|starship|tmux|neovim|aerospace|worktrunk`

Git aliases: `gst`, `gd`, `glg`, `gl`, `gp`, `ga`, `gc`, `gco`, `gcb`, `grs`,
`gm`, `gsta`, `gstp`, and more.

### Tmux

Prefix: `Ctrl-Space`

| Key            | Action                      |
| -------------- | --------------------------- |
| `Ctrl-h/j/k/l` | Navigate panes (no prefix)  |
| `Alt-h/l`      | Next/prev window            |
| `Alt-j/k`      | Next/prev session           |
| `v`            | Begin selection (copy mode) |
| `y`            | Copy selection to clipboard |

Plugins: `tpm`, `tmux-sensible`, `vim-tmux-navigator`, `minimal-tmux-status`

### Starship

Minimal prompt: directory → git branch → git status → `$` character.

- Directory truncated to 6 chars
- Git status uses Nerd Font icons (ahead `⇡`, behind `⇣`, modified, staged,
  etc.)
- Prompt char: cyan `$` on success, cyan `✗` on error

### Alacritty

- **Font:** CaskaydiaMono Nerd Font, size 12
- **macOS theme:** Nord
- **Linux theme:** Catppuccin Frappe
- **TERM:** `xterm-256color`
- No window decorations, live config reload enabled

### AeroSpace (macOS)

Modifier: `Alt`

| Key                | Action                                   |
| ------------------ | ---------------------------------------- |
| `Alt-1..9,0`       | Switch workspace                         |
| `Alt-Shift-1..9,0` | Move window to workspace                 |
| `Alt-Tab`          | Toggle last workspace                    |
| `Alt-/`            | Cycle layout (tiles/horizontal/vertical) |
| `Alt-,`            | Toggle accordion layout                  |
| `Alt--` / `Alt-=`  | Smart resize                             |
| `Alt-Shift-;`      | Enter service mode                       |

Gaps: 0px. Mouse follows focus on monitor change.

### i3 (Linux)

Modifier: `Super`

- Vi-key navigation (h/j/k/l) for focus and move
- 10 workspaces
- Color scheme: Catppuccin Mocha
- Status bar: i3blocks (top)
- Wallpaper: feh

i3blocks displays: CPU, memory, disk, WiFi, volume, mic mute, battery,
date/time.

### Git

```
user.name  = Jasper Robison
user.email = jasper.robison22@gmail.com
```

### WorkTrunk (wt)

Post-create and post-start hooks run:

```bash
./dev_setup.sh full && ./dev_setup.sh service_up
```

