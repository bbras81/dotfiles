# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.config/scripts"
# Tema do ZSH
ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="mocha"
CATPPUCCIN_SHOW_TIME=true

# Ativar cores no ls
export LS_COLORS="$(dircolors -b)"
#alias ls='ls --color=auto'

# Plugins do ZSH
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Carregar Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Carregar aliases personalizados
source ~/.config/scripts/zsh_aliases
eval "$(dircolors -b ~/.dircolors)"
