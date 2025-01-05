#!/bin/sh
ln -sf ~/src/dotfiles/.alacritty.yml ~/.alacritty.yml
ln -sf ~/src/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/src/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/src/dotfiles/.bashrc ~/.bashrc
ln -sf ~/src/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -sf ~/src/dotfiles/.config/bat/config ~/.config/bat/config
ln -sf ~/src/dotfiles/.config/lsd/config.yaml ~/.config/lsd/config.yaml
ln -sf ~/src/dotfiles/.config/lsd/icons.yaml ~/.config/lsd/icons.yaml
ln -sf ~/src/dotfiles/.config/lsd/themes.yaml ~/.config/lsd/themes.yaml
ln -sf ~/src/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf ~/src/dotfiles/.config/ranger/scope.sh ~/.config/ranger/scope.sh
ln -sf ~/src/dotfiles/.delta/themes.gitconfig ~/.delta/themes.gitconfig
ln -sf ~/src/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/src/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/src/dotfiles/.vimrc ~/.vimrc
ln -sf ~/src/dotfiles/.yamllint.yaml ~/.yamllint.yaml
ln -sf ~/src/dotfiles/.serie/.config ~/.serie/.config

# direcotory
[ -L ~/.bin ] || ln -sf ~/src/dotfiles/.bin ~/.bin
[ -L ~/.config/oh-my-posh ] || ln -sf ~/src/dotfiles/.config/oh-my-posh ~/.config/oh-my-posh
[ -L ~/.config/nvim ] || ln -sf ~/src/dotfiles/.config/nvim ~/.config/nvim
