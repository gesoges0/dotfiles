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

# alias gdhhhhh="git diff HEAD~5 HEAD~4"
gitdiff() {
    local num_hs=${#1}
    local start_commit="HEAD~$((num_hs + 1))"
    local end_commit="HEAD~${num_hs}"

    # commit hash
    local start_hash=$(git rev-parse $start_commit)
    local end_hash=$(git rev-parse $end_commit)

    # git diff コマンドの実行
    echo "git diff ${start_commit} ${end_commit}"
    echo "git diff ${start_hash} ${end_hash}"
    git diff "${start_commit}" "${end_commit}"
}

# エイリアスの設定
for i in $(seq 1 20); do
    alias gd$(printf 'h%.0s' $(seq 1 $i))="gitdiff $(printf 'h%.0s' $(seq 1 $i))"
done
