#!/bin/bash

dotfiles=(
    .config/autostart/Swap\ Esc.desktop
    .config/ranger/rc.conf
    .config/nvim/init.vim
    .config/nvim/ultisnips/
    .config/xfce4/terminal/terminalrc
    .gitconfig
    .gitignore_global
    .oh-my-zsh/custom/plugins
    .tmux/.tmux.conf
    .Xmodmap
    .zshenv
    .zshrc
    .config/pgcli/config
    .myclirc
)

install()
{
    for f in "${dotfiles[@]}"
    do
        mkdir -p "${f%/*}"
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

