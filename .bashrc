#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi
bind '"\C-g":"fg\n"'
 source ~/.alias

# To apply the command to CTRL-T as well
export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude node_modules '
# prepare your environment for haskell
# curl https://raw.githubusercontent.com/haskell/ghcup/master/bootstrap-haskell -sSf | sh
. $HOME/.ghcup/env
