# Load completion system
autoload -Uz compinit
compinit

# Append commands immediately to history file
setopt INC_APPEND_HISTORY
# Don't share history between active sessions
unsetopt SHARE_HISTORY
# Read history file on shell startup
setopt APPEND_HISTORY
# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Vim Mode
bindkey -v

# Allow backspace to delete past the point where insert mode was entered
bindkey -M viins '^?' backward-delete-char

# Yank to system clipboard (yy in normal mode)
function vi-yank-whole-line-clip {
    zle vi-yank-whole-line
    echo -n "$CUTBUFFER" | pbcopy
}
zle -N vi-yank-whole-line-clip
bindkey -M vicmd 'yy' vi-yank-whole-line-clip

# Yank to system clipboard (y in visual mode)
function vi-yank-clip {
    zle vi-yank
    echo -n "$CUTBUFFER" | pbcopy
}
zle -N vi-yank-clip
bindkey -M visual 'y' vi-yank-clip

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
  local file_path
  case "$1" in
    zsh)        file_path=~/.zshrc ;;
    alacritty)  file_path=~/.config/alacritty/alacritty.toml ;;
    starship)   file_path=~/.config/starship.toml ;;
    tmux)       file_path=~/.tmux.conf ;;
    neovim|nvim) file_path=~/.config/nvim/init.lua ;;
    aerospace)  file_path=~/.aerospace.toml ;;
    *)          echo "Usage: edit <zsh|alacritty|starship|tmux|neovim|aerospace>" && return 1 ;;
  esac
  
  # cd to directory and open file
  cd "$(dirname "$file_path")" && nvim "$(basename "$file_path")"
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
alias glg="git log"
alias gl="git pull"
alias gp="git push"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gcb="git checkout -b"
alias grs="git restore"
alias gpsu='git push --set-upstream origin $(git branch --show-current)'
alias gm="git merge"
alias gsta="git stash"
alias gstp="git stash pop"

# Directories
alias _k="cd ~/src/kogan/K3"
alias _j="cd ~/src/jasperRob"

# Nvim configs
alias nvim-lazyvim="NVIM_APPNAME=nvim-lazyvim nvim"

# Executables
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Secrets
if [ -f ~/.config/secrets/env ]; then
    source ~/.config/secrets/env
fi

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Init prompt
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jasper.robison/.lmstudio/bin"
# End of LM Studio CLI section

# Amp CLI
export PATH="/Users/jasper.robison/.amp/bin:$PATH"

# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jasper.robison/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jasper.robison/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jasper.robison/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jasper.robison/google-cloud-sdk/completion.zsh.inc'; fi
