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

# Git
alias ga='git add'
alias gap='git add -p'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias com='/home/brunmigu/.config/scripts/auto_commit.sh'
alias pul='/home/brunmigu/.config/scripts/source/pull_source.sh'

# System
alias prog='cd && cd Documents/development'
alias ls='ls -l'
alias l='ls -laht'
alias c='clear'
alias update='sudo apt update && sudo apt upgrade -y'

# Load and initialise completion system
autoload -Uz compinit
compinit

###############################
### SSH Agent Auto-Startup ###
###############################
# Iniciar o ssh-agent e carregar chave se não estiver ativo
if [ -z "$SSH_AUTH_SOCK" ] || ! ps -p "$SSH_AGENT_PID" > /dev/null 2>&1; then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi


alias francinette=/home/brunmigu/francinette/tester.sh

alias paco=/home/brunmigu/francinette/tester.sh
