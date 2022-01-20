export ZDOTDIR=$HOME/.config/zsh
source "$HOME/.profile"
source "$HOME/.config/zsh/.zshrc"

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# BEGIN SNIPPET: Platform.sh CLI configuration
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

case "$(uname -s)" in

Darwin)
  export PATH="/usr/local/opt/libpq/bin:$PATH"
	;;

Linux)
	;;
esac

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
