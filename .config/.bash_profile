
. "$HOME/.cargo/env"

source /home/gesogeso/.config/broot/launcher/bash/br

function share_history {
  history -a
  tac ~/.bash_history | awk '!a[$0]++' | tac > ~/.bash_history.tmp
  [ -f ~/.bash_history.tmp ] &&
    mv ~/.bash_history{.tmp,} &&
    history -c &&
    history -r
}
PROMPT_COMMAND="share_history"
shopt -u histappend
