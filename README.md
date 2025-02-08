# dotfiles

## Image
![eadc1e9ab30c9eb9dfea224939974ba1b7388420](/image/dotfiles_eadc1e9.png)

## Usage
`$HOME/.alacritty.yml`をgit管理したい場合

`dotfilesLink.sh`にシンボリックリンクを記述
```sh
ln -sf $HOME/src/dotfiles/.alacritty.yml $HOME/.alacritty.yml
```

本ディレクトリに管理対象のファイルを移動し, `dotfilesLink`を実行
```sh
mv $HOME/.alacritty.yml $HOME/src/dotfiles/.alacritty.yml
./dotfilesLink.sh
```
