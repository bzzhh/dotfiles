export ZDOTDIR=$HOME/.config/zsh
source "$HOME/.profile"
source "$HOME/.config/zsh/.zshrc"

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
