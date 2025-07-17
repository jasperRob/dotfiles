# ZSH rc file

# ZSH History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# add custom scripts to path
export PATH="/home/jasper/src/jasperRob/scripts:$PATH"

# persist pywal paper on new terminal
# if command -v wal > /dev/null 2>&1 && [ "$TERM" = "alacritty" ]; then
#     wal -Rqe
# fi

# alias maps
alias l="ls -la --color"
alias ls="ls --color"
alias _z="nvim $HOME/.zshrc"
alias _i3config="nvim $HOME/.config/i3/config"
alias _i3blocks="cd $HOME/.config/i3blocks/ && nvim config"
alias gst="git status"
alias gcl="git clone"
alias gl="git pull"
alias gp="git push"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias glg="git log"
alias gco="git checkout"
alias gsta="git stash"
alias gstp="git stash pop"

# keybinds
bindkey "^f" forward-char
bindkey "^b" backward-char
bindkey "^e" end-of-line
bindkey "^a" beginning-of-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# zsh-autocomplete
source $HOME/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# all Tab widgets
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
# all history widgets
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
# ^S
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Git branch for prompt
function git_branch {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n $branch ]] && echo " (%F{cyan}${branch}%f)"
}

# Enable substitution in the prompt.
setopt prompt_subst

# custom prompt
PROMPT='%F{yellow}%n@%m%f %F{red}%~%f$(git_branch) %F{yellow}$%f '

