
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH=$PATH:~/.composer/vendor/bin

export PATH=$PATH:$HOME/bin

export PATH=$PATH:/usr/local/share/npm/bin

export PATH=$PATH:node_modules/.bin

export PATH=$PATH:/opt/pulpo

export PATH=$PATH:~/.local/bin

export PATH=$PATH:/opt/VSCode-linux-x64

export PATH=$PATH:/home/steven/gocode/bin

export SLIM_MODE='development'
#export LARAVEL_ENV='dev'
#export APP_ENV='dev'

export CHROME_BIN="/usr/bin/chromium-browser"

export rvmsudo_secure_path=1

export NVM_DIR="/home/steven/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export GOPATH=/home/steven/gocode
export PHPBREW_SET_PROMPT=1
source /home/steven/.phpbrew/bashrc

source "$HOME/.console/console.rc" 2>/dev/null

