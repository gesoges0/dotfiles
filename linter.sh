# /bin/bash
shell_file_list=("~/.bash_aliases" "~/.bashrc")

while IFS= read -r line; do
  src_file=$(echo "$line" | awk '{print $3}')

  if [ -z "$src_file" ]; then
    continue
  fi

  echo "check $src_path"

  src_path="${src_file/#\~/$HOME}"
  if [ -e $src_path ]; then
    
    # 予め定義しておいたshellscriptファイル
    # ~/.bash_aliasesは実行形式でもないしshebangもないためshellファイルであるかの判定が難しいため手動定義
    if [[ "${shell_file_list[@]}" =~ "$src_file" ]];then
      shellcheck "$src_path"
    fi

    # 拡張子で判定できるものは拡張子をもとにファイルに沿ったリントをかける
    case "${src_path##*/}" in
      *.sh)
        shellcheck "$src_path"
        ;;
      *.yaml | *.yml)
        yamllint "$src_path"
        ;;
    esac
  fi
done < dotfilesLink.sh

