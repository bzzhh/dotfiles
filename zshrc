export ZSH=$HOME/.oh-my-zsh

TERM='xterm-256color'

ZSH_THEME="robbyrussell"

plugins=(git symfony2)

source $ZSH/oh-my-zsh.sh

alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'

alias vm="ssh vagrant@127.0.0.1 -p 2222"
alias ducks='du -cksh * | sort -hr | head -n 15'

export APP_ENV=dev
