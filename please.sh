#!/bin/bash

dotfiles=(
    .composer/composer.json
    .config/autostart/Swap\ Esc.desktop
    .config/fish/fish_variables
    .config/kitty/kitty.conf
    .config/ranger/rc.conf
    .config/nvim/coc-settings.json
    .config/nvim/ftplugin
    .config/nvim/init.vim
    .config/nvim/ultisnips/
    .config/pgcli/config
    .config/starship.toml 
    .config/tmux/tmux.conf
    .config/xfce4/terminal/terminalrc
    .emacs.d/init.el
    .gitconfig
    .gitignore_global
    .oh-my-zsh/custom/plugins
    .Xmodmap
    .zshenv
    .zshrc
    .myclirc
)

install()
{
    for f in "${dotfiles[@]}"
    do
        d="${f%/*}"
        if [[ $d =~ "/" && ! -d $d ]]; then
            mkdir -p "$d"
        fi
        rsync -av "$f" ~/"$f"
    done
}

retrieve()
{
    for f in "${dotfiles[@]}"
    do
        mkdir -p "${f%/*}"
        rsync -av ~/"$f" "$f"
    done
}

PS3='Please enter your choice: '
options=("retrieve files" "install files" "abort")
select opt in "${options[@]}"
do
    case $opt in
        "retrieve files")
            retrieve
            break
            ;;
        "install files")
            install
            break
            ;;
        "abort")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

