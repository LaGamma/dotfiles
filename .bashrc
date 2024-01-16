# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# record multi-line commands as one entry
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

alias ls='ls --color=auto'
#default: PS1='[\u@\h \W]\$ '
PS1="\[$(tput sgr0)\]"
PS1+="\[$(tput setaf 208; tput bold)\]["
PS1+="\[$(tput setaf 3)\]\u"
PS1+="\[$(tput setaf 154)\]@"
PS1+="\[$(tput setaf 69)\]\h "
PS1+="\[$(tput setaf 36)\]\w"
PS1+="\[$(tput setaf 208)\]]"
PS1+="\[$(tput setaf 30)\]\$ "
PS1+="\[$(tput sgr0)\]"
PS1+="\[$(tput setaf 159)\]"

PS0="$(tput sgr0)"

if command -v tmux &> /dev/null \
    && [ -n "$PS1" ] \
    && [[ ! "$TERM" =~ screen ]] \
    && [[ ! "$TERM" =~ tmux ]] \
    && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s main
fi

. "$HOME/.cargo/env"
