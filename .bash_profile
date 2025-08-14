#
# ~/.bash_profile
#

[ -f ~/.bashrc ] && . ~/.bashrc

# XDG Base Directories
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}

export PATH="$PATH:~/.local/bin" # Created by `pipx` on 2024-06-20 20:58:36
export PATH="$PATH:~/npm-global/bin"
export PATH="$PATH:$XDG_CONFIG_HOME"/spicetify
export PATH="$PATH:$XDG_DOCUMENTS_DIR"/etterna/Etterna-RelWithDebInfo

# Cleaning up $HOME
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PYTHON_HISTORY="$XDG_STATE_HOME"/python_history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export LESSHISTFILE=-
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export XCURSOR_PATH=/usr/share/icons:"$XDG_DATA_HOME"/icons
export W3M_DIR="$XDG_STATE_HOME/w3m"
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export EDITOR=nvim
export HISTSIZE=5000
export PYTHONPATH="/usr/lib/python3.12/site-packages"

#. "$HOME/.cargo/env"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -le 3 ]; then
	# `logout` is not needed since `exec` replaces the shell with the command
	exec startx i3
	#logout
fi
