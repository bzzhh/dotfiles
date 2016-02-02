export ZSH=$HOME/.oh-my-zsh

TERM='xterm-256color'

ZSH_THEME="robbyrussell"

plugins=(git symfony2)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'

alias vm="ssh vagrant@127.0.0.1 -p 2222"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:node_modules/.bin
export PATH=$PATH:/opt/pulpo
export PATH=$PATH:~/.local/bin

export SLIM_MODE='development'
#export LARAVEL_ENV='dev'
#export APP_ENV='dev'
export CHROME_BIN="/usr/bin/chromium-browser"

export rvmsudo_secure_path=1

export NVM_DIR="/home/steven/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
