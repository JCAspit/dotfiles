#!/usr/bin/env bash

alias grep='grep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -a'

alias rm='trash-put'
alias cp='cp -i'
alias mv='mv -i'

alias v='nvim .'
alias vi='nvim'
alias vim='nvim'
alias cat='bat'
alias yt='ytfzf'
alias lob='lobster'
alias ani='ani-cli'
alias cfg='git --git-dir $HOME/.cfg --work-tree=$HOME'
alias sudo='sudo '
alias restore='trash-restore --sort date'
alias zath='zathura'
alias open='xdg-open'
alias fix='xrandr --output DP-2 --left-of DP-4'
alias heck='fuck'
alias ff='fastfetch -c none -l arch_small'
function cmkdir() { mkdir -p "$1" && cd "$1"; }

alias mp3='yt-dlp -P ~/Downloads -f mp3'
function mp4() {
	if [[ $1 = "m" ]]; then
		yt-dlp -P ~/Downloads -f "mp4*+ba/best" $2
	else
		yt-dlp -P ~/Downloads -f "bv*+ba/best" $1
	fi
}

alias i3='nvim ~/.config/i3/config'
alias doc='nvim ~/Documents/txt.txt'
alias bashrc='nvim ~/.bashrc'
alias todo='nvim ~/Documents/todo.txt'
alias notes='nvim /media/Storage/Documents/Papers-2023-2024/notepad.txt'
alias vp='nvim /media/Storage/Documents/Papers-2023-2024/vp.txt'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

eval "$(zoxide init bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(thefuck --alias)"
export EDITOR=nvim
export PYTHONPATH="/usr/lib/python3.12/site-packages"
export PATH=$PATH:/home/jackie/.spicetify
