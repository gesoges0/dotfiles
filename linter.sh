# /bin/bash

# shファイルと判定が難しいshファイル
shell_file_list=(".bash_aliases" ".bashrc")

while IFS= read -r line; do
  
  # dotfilesLink.shに書いてあるファイル
  src_file=$(echo "$line" | awk '{print $3}')

  if [ -z "$src_file" ]; then
    continue
  fi

  # ~/src/dotfiles/を空文字に置き換える
  src_path=$(echo "$src_file" | sed 's|~/src/dotfiles/||')
  
  if [[ -e $src_path ]]; then

    # 予め定義しておいたshellscriptファイル
    # ~/.bash_aliasesは実行形式でもないしshebangもないためshellファイルであるかの
    # 判定が難しいため手動定義
    if [[ "${shell_file_list[@]}" =~ "$src_path" ]];then
      shellcheck "$src_path"
    fi

    # 拡張子で判定できるものは拡張子をもとにファイルに沿ったリントをかける
    case "${src_path##*/}" in
      *.sh)
        shellcheck "$src_path"
        if [[ $? != 0 ]]; then
          exit 1
        fi
        ;;
      *.yaml | *.yml)
        yamllint "$src_path"
        if [[ $? != 0 ]]; then
          exit 1
        fi
        ;;
    esac
  fi
done < dotfilesLink.sh

