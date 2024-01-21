# /bin/bash

# -e: エラーが出た時点で落とす
# -u: 未設定変数を参照したら落とす
# -o pipefail: pipeの連鎖で1つでもエラーとなったら落とす
set -euo pipefail

# 
process_file(){
  path="$1"
  if [[ -e $path ]]; then

    echo "check $path"

    # 予め定義しておいたshellscriptファイル
    # ~/.bash_aliasesは実行形式でもないしshebangもないためshellファイルであるかの
    # 判定が難しいため手動定義
    if [[ "${shell_file_list[@]}" =~ "$path" ]];then
      shellcheck "$path"
    fi

    # 拡張子で判定できるものは拡張子をもとにファイルに沿ったリントをかける
    case "${path##*/}" in
      *.sh)
        shellcheck "$path"
        ;;
      *.yaml | *.yml)
        yamllint "$path"
        ;;
    esac
  fi
}

# shファイルと判定が難しいshファイル
shell_file_list=(".bash_aliases")

while IFS= read -r line; do
 
  # dotfilesLink.shに書いてあるファイル
  # Ignore lines starting with '#'
  if [[ $line == \#* ]]; then
    continue
  fi

  # Get the first character of the line
  first_char="${line:0:1}"

  case $first_char in
    "#")
      # Ignore comments
      ;;
    "[")
      src_file=$(echo "$line" | awk '{print $8}')
      ;;
    "l")
      src_file=$(echo "$line" | awk '{print $3}')
      ;;
  esac

  if [ -z "$src_file" ]; then
    continue
  fi

  # ~/src/dotfiles/を空文字に置き換える
  src_path=$(echo "$src_file" | sed 's|~/src/dotfiles/||')

  # 関数をサブシェルで利用可能にする
  export -f process_file

  # src/file_pathに対して階層的にイテレートして末端のファイルのみに注目する
  find "$src_path" -type f -exec bash -c 'process_file "{}"' \;

done < dotfilesLink.sh

