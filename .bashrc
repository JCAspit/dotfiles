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
alias lob='lobster'
alias ani='ani-cli'
alias cfg='git --git-dir $HOME/.cfg --work-tree=$HOME'
alias sudo='doas '
alias restore='trash-restore --sort date'
alias zath='zathura'
alias open='xdg-open'
alias heck='fuck'
function cmkdir() { mkdir -p "$1" && cd "$1"; }
alias mp3='yt-dlp -P ~/Downloads -f "ba" -o "%(title)s [%(id)s].mp3"'
alias mp4='yt-dlp -P ~/Downloads -f "bv*+ba/best" --merge-output-format "mp4"'
alias ts="/opt/scripts/tmux-sessionizer"
alias sk="screenkey -p fixed -g 20%x5%+80%+95% &> /dev/null"
function cwd_spawn() { nohup /proc/$(cat /proc/$(echo $$)/stat | cut -d ' ' -f 4)/exe > /dev/null 2>&1 & disown; }
alias cwd="cwd_spawn"
alias virsh='virsh -c qemu:///system'
function ocr() {
	if [ -e /tmp/ocr.png ]; then
		rm /tmp/ocr.png
	fi

	flameshot gui --path /tmp/ocr.png &> /dev/null
	tesseract -c debug_file=/dev/null /tmp/ocr.png stdout | xclip -selection clipboard
}
alias xeph='xinit $HOME/Documents/xephyr-xinitrc -- /usr/bin/Xephyr :1 -screen 1200x900 -resizeable &'
alias tr='trans -shell -brief'
alias fix='xrandr --output DP-2 --primary --mode 1920x1080 --rate 120; xrandr --output DP-4 --mode 1920x1080 --rate 165.00 --right-of DP-2'

# https://github.com/AleDenshi/Scripts
function screencapture() {
	FILENAME=$1
	[ -z $1 ] && FILENAME=$(date "+%Y%m%d%H%M").mkv
	ffmpeg -hide_banner -loglevel error -stats -video_size 1920x1080 -framerate 60 -f x11grab -i :0.0 -f pulse -ac 1 -i default -b:a 256k "$FILENAME"
}
alias webcam='ffplay -hide_banner -loglevel error -stats -window_title Webcam -fflags +nobuffer -fast /dev/video0'

# Courtesy of Chris Titus
alias vmpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'
alias pacf="pacman -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro doas pacman -S"
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
#bind '"\C-f":"zi\n"'

alias doc='nvim ~/Documents/txt.txt'
alias todo='nvim ~/Documents/todo.txt'
alias notes='nvim /media/Storage/Documents/Papers-2023-2024/notepad.txt'
alias vp='nvim /media/Storage/Documents/Papers-2023-2024/vp.txt'
alias home='nvim /media/Storage/Documents/Papers-2024-2025/home-server.txt'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

complete -cf doas

eval "$(zoxide init bash)"
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(thefuck --alias)"
