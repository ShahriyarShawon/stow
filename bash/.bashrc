export PS1="\[\033[38;5;128m\]\$?\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;28m\]\t\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;33m\]\u\[$(tput sgr0)\]\[\033[38;5;196m\]:\[$(tput sgr0)\]\[\033[38;5;208m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;112m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\n\[$(tput sgr0)\]λ "

# Aliases
alias nv=nvim
alias bashrc="nvim ~/.bashrc"
alias nvrc="nvim ~/.config/nvim/init.lua"
alias rbash="source ~/.bashrc"
alias ls="ls --color"
alias du="du -h"
alias df="df -h"
# Exports

