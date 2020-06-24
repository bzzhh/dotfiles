.PHONY: help install

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Installs dotfiles into current environment
	@$(MAKE) DOTFILE=.config/autostart/Swap\ Esc.desktop install_file
	@$(MAKE) DOTFILE=.config/nvim/coc-settings.json install_file
	@$(MAKE) DOTFILE=.config/nvim/init.vim install_file
	@$(MAKE) DOTFILE=.config/xfce4/terminal/terminalrc install_file
	@$(MAKE) DOTFILE=.gitconfig install_file
	@$(MAKE) DOTFILE=.gitignore_global install_file
	@$(MAKE) DOTFILE=.tmux/.tmux.conf install_file
	@$(MAKE) DOTFILE=.Xmodmap install_file
	@$(MAKE) DOTFILE=.zshenv install_file
	@$(MAKE) DOTFILE=.zshrc install_file

install_file:
	@if [ ! -f ${HOME}/${DOTFILE} ]; then \
		echo ✔ Installing file: ${HOME}/${DOTFILE}; \
		cp ${DOTFILE} ${HOME}/${DOTFILE}; \
	else \
		echo ✖ File already exists: ${HOME}/${DOTFILE}; \
	fi \

retrieve-files: ## Synchronize files from local host to git repository
	cp ~/.config/autostart/Swap\ Esc.desktop .config/autostart/Swap\ Esc.desktop
	cp ~/.config/nvim/coc-settings.json .config/nvim/coc-settings.json
	cp ~/.config/nvim/init.vim .config/nvim/init.vim
	cp ~/.config/xfce4/terminal/terminalrc .config/xfce4/terminal/terminalrc
	cp ~/.gitconfig .gitconfig
	cp ~/.gitignore_global .gitignore_global
	cp ~/.tmux/.tmux.conf .tmux/.tmux.conf
	cp ~/.Xmodmap .Xmodmap
	cp ~/.zshenv .zshenv
	cp ~/.zshrc .zshrc
