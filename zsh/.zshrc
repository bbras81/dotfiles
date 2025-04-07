# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

 plug "zap-zsh/fzf"

###############
### Aliases ###
###############

# Compiling
alias ccw='cc -Wall -Wextra -Werror -g'

# Neovim
alias v='nvim'
alias sv='sudo -E nvim'

# git
alias ga='git add'
alias gap='git add -p'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias com='auto_commit.sh'
alias pul='source pull_source.sh'

# System
alias v='nvim'
alias prog='cd && cd Documents/development'
alias ls='ls -la'
alias l='ls -laht'
alias c='clear'

# Load and initialise completion system
autoload -Uz compinit
compinit
