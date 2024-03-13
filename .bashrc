#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias neo='neofetch --config ~/.config/neofetch/config-neo.conf --ascii_distro arch_small'
alias config='cd ~/.config'
# PS1='[\u@\h \W]\$ '
PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/jcaspit/.spicetify
