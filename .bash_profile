#
# ~/.bash_profile
#

[ -f ~/.bashrc ] && . ~/.bashrc

#. "$HOME/.cargo/env"

# Created by `pipx` on 2024-06-20 20:58:36
export PATH="$PATH:~/.local/bin"

export PATH="$PATH:~/npm-global/bin"
export PATH="$PATH:~/.spicetify"

export EDITOR=nvim
export PYTHONPATH="/usr/lib/python3.12/site-packages"
export __GL_SHADER_DISK_CACHE_PATH="~/.cache/.nv"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -le 3 ]; then
	# `logout` is not needed with since `exec` replaces the current shell with the command
	exec startx
	#logout
fi
