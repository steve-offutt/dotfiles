#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
#export PS1="\e[37;1m\h:\u[\[\e[33m\]\w\[\e[m\]]:\n\\$\[$(tput sgr0)\]"
export PS1="\e[34;1m\h:\e[37;1m\u[\e[33m\w\e[37;1m]:\n\\$\[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -lGFh'
alias python='python2'
