# dotfiles

## Examples
`~/.alacritty.yaml`をgit管理したい場合

`dotfilesLink.sh`にシンボリックリンクを記述
```sh
ln -sf ~/src/dotfiles/.alacritty ~/.alacritty
```

本ディレクトリに管理対象のファイルを移動し, `dotfilesLink`を実行
```sh
mv ~/.alacritty.yaml ~/src/dotfiles/.alacritty.yaml
./dotfilesLink.sh
```
