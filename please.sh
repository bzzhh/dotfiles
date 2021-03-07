#!/bin/bash

dotfiles=(
    .composer/composer.json
    .config/lf
    .config/nvim/coc-settings.json
    .config/nvim/ftplugin
    .config/nvim/init.vim
    .config/nvim/ultisnips/
    .config/pgcli/config
    .config/tmux/tmux.conf
    .config/xmobar
    .emacs.d/init.el
    .gitconfig
    .gitignore_global
    .oh-my-zsh/custom/aliases.zsh
    .oh-my-zsh/custom/paths.zsh
    .Xmodmap
    .zshenv
    .zshrc
    .myclirc
    .xinitrc
    .xmonad/xmonad.hs
    .Xresources
)

install()
{
    for f in "${dotfiles[@]}"
    do
        d="${f%/*}"
        [[ $d =~ "/" && ! -d $d ]] && mkdir -p "$d"
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
options=("retrieve files" "install files" "report installed packages" "abort")
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
        "report installed packages")
            pacman -Qqe > pkglist.txt
            break
            ;;
        "abort")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

