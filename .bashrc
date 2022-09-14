#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /home/ephos/.config/broot/launcher/bash/br
alias config='/usr/bin/git --git-dir=/home/ephos/.cfg/ --work-tree=/home/ephos'
