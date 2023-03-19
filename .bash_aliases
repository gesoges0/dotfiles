alias pbcopy='xsel --clipboard --input'

alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gb='git branch'
alias cb="git symbolic-ref --short HEAD | tr -d '\n' | pbcopy"
alias gd='git diff'
alias gdh='git diff HEAD^ HEAD'


alias diff="colordiff -y -W 30" # --suppress-common-lines"

# branch name
export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \[\033[01;31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]\$\[\033[00m\] '

