# dotfiles

## Examples
`~/.alacritty.yml`をgit管理したい場合

`dotfilesLink.sh`にシンボリックリンクを記述
```sh
ln -sf ~/src/dotfiles/.alacritty.yml ~/.alacritty.yml
```

本ディレクトリに管理対象のファイルを移動し, `dotfilesLink`を実行
```sh
mv ~/.alacritty.yml ~/src/dotfiles/.alacritty.yml
./dotfilesLink.sh
```
