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
function cmkdir() { mkdir -p "$1" && cd "$1"; }
alias open='xdg-open'
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
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias fix='xrandr --output DP-2 --left-of DP-4'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ff='fastfetch -c none -l arch_small'
alias fff='pyfiglet -s -f small_slant Arch Linux | lolcat && echo && fastfetch -c none -l none | pv -qL 200'
alias ffff='fortune | cowsay -f dragon -W 30 > ~/Documents/dragon.txt && fastfetch -c none -l ~/Documents/dragon.txt | lolcat -ats 60'

#export PS1="\033[38;5;208m┌─  ⚞ \033[38;5;202mUwU \033[38;5;208m⚟ \n└─╼\033[0m "

eval "$(zoxide init bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export EDITOR=nvim
export PYTHONPATH="/usr/lib/python3.12/site-packages"
