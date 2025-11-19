# shellcheck disable=SC2148

alias pbcopy='xsel --clipboard --input'

# git
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gb='git checkout $(git branch | fzf)'
alias cb="git symbolic-ref --short HEAD | tr -d '\n' | pbcopy"
alias tb="git symbolic-ref --short HEAD|tr -d \"\\n\""
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD^ HEAD'
alias gp='git push origin $(tb)'
alias gh-clone='ghq get'
alias crr='cd $(git rev-parse --show-toplevel)'  # cd repository root

# diff
alias diff="colordiff -y -W 30" # --suppress-common-lines"

# Python
alias python="python3"

# format
# ~/.bin/python-format
alias f="python-format"

# lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# ghq
alias g='cd $(ghq list -p | fzf)'

# python local server
alias file-server='python -m http.server 8383'

# fzf
alias v='vim $(lsd | fzf)'
alias b='bat $(lsd | fzf)'

# ranger
alias r='ranger'

# https://github.com/thoughtbot/dotfiles/blob/main/aliases
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# https://github.com/mathiasbynens/dotfiles/blob/main/.aliases
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec \$SHELL -l"

# Get week number
alias week='date +%V'

# deactivate venv
alias da='deactivate'

# broot
# cargo install broot
alias b='broot -sdp'
alias bg='broot -g'
alias bws='broot --whale-spotting'

# tokei
# cargo install tokei
alias t='tokei'

alias c='clear'

# vim -> nvim
alias vim='nvim'

# git
alias gg='git grep'
alias ghb='git browse .'

# alias gdhhhhh="git diff HEAD~5 HEAD~4"
gitdiff() {
    local num_hs=${#1}
    local start_commit="HEAD~${num_hs}"
    local end_commit="HEAD~$((num_hs - 1))"

    # commit hash
    local start_hash=$(git rev-parse $start_commit)
    local end_hash=$(git rev-parse $end_commit)

    # remote repository
    local remote_url=$(git config --get remote.origin.url)
    # convert https format
    if [[ $remote_url == git@github.com:* ]]; then
        local base_url="https://github.com/$(echo $remote_url | sed -e 's/git@github.com://;s/.git$//')"
    else
        local base_url=${remote_url%.git}
    fi

    # git diff
    echo "git diff ${start_commit} ${end_commit}"
    echo "git diff ${start_hash} ${end_hash}"
    echo "${base_url}/commit/${end_hash}"
    git diff "${start_commit}" "${end_commit}"
}

for i in $(seq 1 20); do
    alias gd$(printf 'h%.0s' $(seq 1 $i))="gitdiff $(printf 'h%.0s' $(seq 1 $i))"
done

# git-squash: squash HEAD to HEAD^
gitsquash() {
    local head_message=$(git log -1 --pretty=%B)
    local head_parent_message=$(git log -1 HEAD^ --pretty=%B)
    git reset --soft HEAD^ && git commit --amend --no-edit -m "${head_parent_message}" -m "${head_message}"
}

alias git-squash="gitsquash"

# git-fixup: fixup HEAD to HEAD^
alias git-fixup='git reset --soft HEAD^ && git commit --amend --no-edit'


# gg and open with nvim
ggv() {
    # git grep を実行して結果を変数に保存
    local results=$(git grep --color=always --line-number "$@")

    # 結果が空の場合は終了
    if [ -z "${results}" ]; then
        echo "No matches found."
        return 1
    fi

    # 結果の行数をカウント
    local count=$(echo "${results}" | wc -l)

    # 結果が1行だけの場合はそのまま開く
    if [ $count -eq 1 ]; then
        local result="${results}"
    else
        # 行番号取得
        local numbered_results=$(echo "${results}" | nl -w2 -s' ')

        # 複数行の場合は fzf で選択
        local result=$(echo "${numbered_results}" | fzf --ansi)

        # 選択結果がない場合は終了
        if [ -z "${result}" ]; then
            echo "No selection made."
            return 1
        fi
    fi

    # 結果を解析してファイル名と行番号を抽出
    local file=$(echo "$result" | sed 's/^[ \t]*[0-9]*[ \t]*//' | cut -d':' -f1)
    local line=$(echo "$result" | sed 's/^[ \t]*[0-9]*[ \t]*//' | cut -d':' -f2)

    # nvim で指定の行を開く
    nvim +$line $file
}

alias ggn='ggv'
