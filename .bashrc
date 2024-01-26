# shellcheck disable=SC2148

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# export PATH=$PATH:/home/gesogeso/src/tohoho-typescript-tutorial/sample/node_modules/.bin

# Prompt
# export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \[\033[01;31m\]$(__git_ps1 "(%s)") \[\033[01;34m\]\$\[\033[00m\] '

# poetry
export PATH="/home/gesogeso/.local/bin:$PATH"
. "$HOME/.cargo/env"

# zoxide
# https://github.com/ajeetdsouza/zoxide
# 3022cf3686b85288e6fbecb2bd23ad113fd83f3b
# z: 以前のディレクトリに移動
# zi: ディレクトリの検索 & 移動
eval "$(zoxide init bash)"

# Go Excutable 
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Go
export PATH=$PATH:/usr/local/go/bin

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# duckdb
export PATH="${HOME}/src/tmp/duckdb/build/release:$PATH"

# imgcat (tmuxで新規ペインを開いたときに実行されるように)
imgcat "${HOME}/squidgirl.gif"

# Airflow
# https://airflow.apache.org/docs/apache-airflow/stable/start.html
export AIRFLOW_HOME=~/airflow
 
# ~/.bin/*.sh
export PATH="${HOME}/.bin:$PATH"

# oh-my-posh
# [default]
#   https://ohmyposh.dev/docs/installation/linux
# export PATH="${HOME}/.oh-my-posh:$PATH"
# [my development]
#   ghq get https://github.com/gesoges0/oh-my-posh@0f4003a61299bf5e936bd7269f5ac5da0f1673e8
#   cd ~/ghq/github.com/gesoges0/oh-my-posh/src
#   gvm use go1.21
#   go build -o oh-my-posh
#   mkdir ~/.oh-my-posh-mine
#   mv ~/.oh-my-posh-mine/oh-my-posh
export PATH="${HOME}/.oh-my-posh-mine:$PATH"

# eval "$(oh-my-posh init bash)"
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/unicorn.mine.json)"

# bash-completion
# download http://mirrors.kernel.org/ubuntu/pool/main/b/bash-completion/bash-completion_2.11-5ubuntu1_all.deb
# dpkg -i xxx.deb
# https://github.com/scop/bash-completion?tab=readme-ov-file
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

source /home/gesogeso/.config/broot/launcher/bash/br

# globe (v.0.2.0)
# ghq clone git@github.com:adamsky/globe.git
# cargo run --release
PATH="${HOME}/ghq/github.com/adamsky/globe/target/release:$PATH"

# gvm
# 下記Issueを反映
# https://github.com/moovweb/gvm/issues/455
[[ -s "/home/gesogeso/.gvm/scripts/gvm" ]] && source "/home/gesogeso/.gvm/scripts/gvm"

# mcfly
# https://github.com/cantino/mcfly?tab=readme-ov-file
# https://github.com/cantino/mcfly/releases
# mcfly-v0.8.4-x86_64-unknown-linux-musl.tar.gz
# Ctrl-r で候補表示
eval "$(mcfly init bash)"
if [[ "$(defaults read -g AppleInterfaceStyle 2&>/dev/null)" != "Dark" ]]; then
    export MCFLY_LIGHT=TRUE  # 画面遷移せず同画面で候補を表示
    export MCFLY_KEY_SCHEME=vim  # key-bindをvimに
    export MCFLY_FUZZY=2  # fuzzy-searching
    export MCFLY_RESULTS=50  # 結果件数
    export MCFLY_PROMPT="❯"  # prompt
fi
