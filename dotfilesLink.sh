#!/bin/sh
# $(pwd)/home
WORK_DIR=$(pwd)/.config
ln -sf $WORK_DIR/.alacritty.yml $HOME/.alacritty.yml
ln -sf $WORK_DIR/.bash_aliases $HOME/.bash_aliases
ln -sf $WORK_DIR/.bash_profile $HOME/.bash_profile
ln -sf $WORK_DIR/.bashrc $HOME/.bashrc
ln -sf $WORK_DIR/Code/User/settings.json $HOME/.config/Code/User/settings.json
ln -sf $WORK_DIR/bat/config $HOME/.config/bat/config
ln -sf $WORK_DIR/lsd/config.yaml $HOME/.config/lsd/config.yaml
ln -sf $WORK_DIR/lsd/icons.yaml $HOME/.config/lsd/icons.yaml
ln -sf $WORK_DIR/lsd/themes.yaml $HOME/.config/lsd/themes.yaml
ln -sf $WORK_DIR/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -sf $WORK_DIR/ranger/scope.sh $HOME/.config/ranger/scope.sh
ln -sf $WORK_DIR/.delta/themes.gitconfig $HOME/.delta/themes.gitconfig
ln -sf $WORK_DIR/.gitconfig $HOME/.gitconfig
ln -sf $WORK_DIR/.tmux.conf $HOME/.tmux.conf
ln -sf $WORK_DIR/.vimrc $HOME/.vimrc
ln -sf $WORK_DIR/.yamllint.yaml $HOME/.yamllint.yaml
ln -sf $WORK_DIR/.serie/.config $HOME/.serie/.config
ln -sf $WORK_DIR/gromit-mpx/gromit-mpx.cfg $HOME/.config/gromit-mpx/gromit-mpx.cfg

# direcotory
[ -L ~/.bin ] || ln -sf $(pwd)/.bin $HOME/.bin
[ -L ~/.config/oh-my-posh ] || ln -sf $WORK_DIR/oh-my-posh $HOME/.config/oh-my-posh
[ -L ~/.config/nvim ] || ln -sf $WORK_DIR/nvim $HOME/.config/nvim
