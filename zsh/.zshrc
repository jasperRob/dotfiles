# Load completion system
autoload -Uz compinit
compinit

# Emacs Mode
bindkey -e

# Load or source configs
load() {
  case "$1" in
    zsh)   source ~/.zshrc ;;
    tmux)  tmux source ~/.tmux.conf ;;
    *)     echo "Usage: load <zsh|tmux>" ;;
  esac
}
# Auto-completion for load
compdef '_values "config types" zsh tmux' load

# Edit configs
edit() {
  case "$1" in
    zsh)        nvim ~/.zshrc ;;
    alacritty)  nvim ~/.config/alacritty/alacritty.toml ;;
    starship)   nvim ~/.config/starship.toml ;;
    tmux)       nvim ~/.tmux.conf ;;
    neovim|nvim) nvim ~/.config/nvim/ ;;
    aerospace) nvim ~/.aerospace.toml ;;
    *)          echo "Usage: edit <zsh|alacritty|starship|tmux|neovim|aerospace>" ;;
  esac
}
# Auto-completion for edit
compdef '_values "config types" zsh tmux alacritty starship neovim aerospace' edit

# Common functions
alias ls="eza -lh --group-directories-first --icons=auto"
alias l="ls -la"
alias grepc="grep --color=always"

# Git
alias gcl="git clone"
alias gst="git status"
alias gd="git diff"
alias gl="git pull"
alias gp="git push"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gcb="git checkout -b"
alias grs="git restore"
alias gpsu="git push --set-upstream origin"
alias gm="git merge"
alias gsta="git stash"
alias gstp="git stash pop"

# Directories
alias _k="cd ~/src/kogan/K3"

# Executables
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Init prompt
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
