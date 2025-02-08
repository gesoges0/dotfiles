#!/bin/sh
ln -sf $HOME/src/dotfiles/.alacritty.yml $HOME/.alacritty.yml
ln -sf $HOME/src/dotfiles/.bash_aliases $HOME/.bash_aliases
ln -sf $HOME/src/dotfiles/.bash_profile $HOME/.bash_profile
ln -sf $HOME/src/dotfiles/.bashrc $HOME/.bashrc
ln -sf $HOME/src/dotfiles/.config/Code/User/settings.json $HOME/.config/Code/User/settings.json
ln -sf $HOME/src/dotfiles/.config/bat/config $HOME/.config/bat/config
ln -sf $HOME/src/dotfiles/.config/lsd/config.yaml $HOME/.config/lsd/config.yaml
ln -sf $HOME/src/dotfiles/.config/lsd/icons.yaml $HOME/.config/lsd/icons.yaml
ln -sf $HOME/src/dotfiles/.config/lsd/themes.yaml $HOME/.config/lsd/themes.yaml
ln -sf $HOME/src/dotfiles/.config/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -sf $HOME/src/dotfiles/.config/ranger/scope.sh $HOME/.config/ranger/scope.sh
ln -sf $HOME/src/dotfiles/.delta/themes.gitconfig $HOME/.delta/themes.gitconfig
ln -sf $HOME/src/dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/src/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/src/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/src/dotfiles/.yamllint.yaml $HOME/.yamllint.yaml
ln -sf $HOME/src/dotfiles/.serie/.config $HOME/.serie/.config

# direcotory
[ -L ~/.bin ] || ln -sf $HOME/src/dotfiles/.bin $HOME/.bin
[ -L ~/.config/oh-my-posh ] || ln -sf $HOME/src/dotfiles/.config/oh-my-posh $HOME/.config/oh-my-posh
[ -L ~/.config/nvim ] || ln -sf $HOME/src/dotfiles/.config/nvim $HOME/.config/nvim
