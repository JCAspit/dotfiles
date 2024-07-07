#!/usr/bin/env bash

alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'

alias rm='trash-put'
alias cp='cp -i'
alias mv='mv -i'

alias vi='nvim'
alias vim='nvim'
alias cat='bat'
alias yt='ytfzf'
alias lob='lobster'
alias ani='ani-cli'
alias cfg='git --git-dir $HOME/.cfg --work-tree=$HOME'
alias sudo='sudo '
alias restore='trash-restore --sort date'

alias i3='vim ~/.config/i3/config'
alias doc='vim ~/Documents/txt.txt'
alias bashrc='vim ~/.bashrc'
alias todo='vim ~/Documents/todo.txt'
alias notes='vim /media/Storage/Documents/Papers-2023-2024/notepad.txt'
alias vp='vim /media/Storage/Documents/Papers-2023-2024/vp.txt'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ff='fastfetch -c none -l arch_small'
alias fff='pyfiglet -s -f small_slant Arch Linux | lolcat && echo && fastfetch -c none -l none | pv -qL 200'
alias ffff='fortune | cowsay -f dragon -W 30 > ~/Documents/dragon.txt && fastfetch -c none -l ~/Documents/dragon.txt | lolcat -ats 60'

eval "$(zoxide init bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$PATH:/home/jackie/.local/bin"
export EDITOR=nvim
