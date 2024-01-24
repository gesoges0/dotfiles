# shellcheck disable=SC2148

alias pbcopy='xsel --clipboard --input'

# git
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gb='git branch'
alias cb="git symbolic-ref --short HEAD | tr -d '\n' | pbcopy"
alias tb="git symbolic-ref --short HEAD|tr -d \"\\n\""
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD^ HEAD'
alias gp='git push origin $(tb)'

# diff
alias diff="colordiff -y -W 30" # --suppress-common-lines"

# branch name
export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \[\033[01;31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]\$\[\033[00m\] '

# Go
export PATH=$PATH:/usr/local/go/bin

# Python
alias python="python3"

# format
f(){
   isort "$1"
   black "$1"
}

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
alias c='cat $(lsd | fzf)'

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
