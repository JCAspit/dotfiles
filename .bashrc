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
alias mp4='yt-dlp -P ~/Downloads -f "bv*+ba/best" --merge-output-format "mp4"'
alias ts="/opt/scripts/tmux-sessionizer"
alias sk="screenkey -p fixed -g 20%x5%+80%+95% &> /dev/null"
function cwd_spawn() { nohup /proc/$(cat /proc/$(echo $$)/stat | cut -d ' ' -f 4)/exe > /dev/null 2>&1 & disown; }
alias cwd="cwd_spawn"

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
