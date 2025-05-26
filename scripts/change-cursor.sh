#!/bin/sh

RED="\033[91m"
YELLOW="\033[93m"
RESET="\033[m"

warn() {
	echo -e "${YELLOW}$1${RESET}"
}

error() {
	echo -e "${RED}$1${RESET}"
	exit 0
}

INSTALLED_THEMES=$(dirname $(find ~/.icons ~/.local/share/icons/ /usr/share/icons/ -type d -name 'cursors'))

# To-do: Make this an optional dependency? fzf?
CURSOR_THEME=$(gum choose $INSTALLED_THEMES)

# To-do: Preview of cursor sprites

if [ -z $CURSOR_THEME ]; then
	error "No cursor theme selected. Exiting."
fi

if [ ! -d $CURSOR_THEME ]; then
	error "$CURSORTHEME icon directory does not exist. Exiting."
fi

CURSOR_THEME=$(basename $CURSOR_THEME)

echo "Changing default cursor theme to $CURSOR_THEME..."
if [ -d ~/.icons/default ]; then
	echo -e "[Icon Theme]\nName=Default\nComment=Default Cursor Theme\nInherits=$CURSOR_THEME" > ~/.icons/default/index.theme
else
	warn "'~/.icon/default' does not exist. Skipping."
fi

if [ -d ~/.local/share/icons/default ]; then
	echo -e "[Icon Theme]\nInherits=$CURSOR_THEME" > ~/.local/share/icons/default/index.theme
else
	warn "'~/.local/share/icons/default' does not exist. Skipping."
fi

if [ -d /usr/share/icons/default ]; then
	echo -e "[Icon Theme]\nInherits=$CURSOR_THEME" > /usr/share/icons/default/index.theme
else
	warn "'/usr/share/icons/default' does not exist. Skipping."
fi

# To-do: ? -> `sed -i "s/Inherits=.*/Inherits=default/" ~/.icons/default/index.theme ~/.local/share/icons/default/index.theme /usr/share/icons/default/index.theme`
#sed -i "s/Inherits=.*/Inherits=default/" ~/.icons/default/index.theme
#sed -i "s/Inherits=.*/Inherits=default/" ~/.local/share/icons/default/index.theme
#sed -i "s/Inherits=.*/Inherits=default/" /usr/share/icons/default/index.theme

# To-do: GTK 1

echo "Changing GTK 2 cursor theme to $CURSOR_THEME..."
if [ -e ~/.gtkrc-2.0 ]; then
	#sed -i "s/gtk-cursor-theme-name=\".*\"/gtk-cursor-theme-name=\"default\"/" ~/.gtkrc-2.0
	sed -i "s/gtk-cursor-theme-name=\".*\"/gtk-cursor-theme-name=\"$CURSOR_THEME\"/" ~/.gtkrc-2.0
fi
if [ -e ~/.config/gtk-2.0/gtkfilechooser.ini ]; then
	#sed -i "s/gtk-cursor-theme-name=\".*\"/gtk-cursor-theme-name=\"default\"/" ~/.config/gtkrc-2.0
	sed -i "s/gtk-cursor-theme-name=\".*\"/gtk-cursor-theme-name=\"$CURSOR_THEME\"/" ~/.config/gtkrc-2.0
else
	echo -e "${YELLOW}No GTK 2 config present. Skipping.${RESET}"
fi

if [ -n $(command -v gsettings) ]; then
	echo "Changing GTK 3/4 cursor theme to $CURSOR_THEME..."

	gsettings set org.gnome.desktop.interface cursor-theme $CURSOR_THEME
	#gsettings set org.mate.peripherals-mouse cursor-theme $CURSOR_THEME
	#xfconf-query --channel xsettings --property /Gtk/CursorThemeName --set $CURSOR_THEME

	# To-do: Check if line exists.
	if [ -e ~/.config/gtk-3.0/ ]; then
		#sed -i "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=default/" ~/.config/gtk-3.0/settings.ini
		sed -i "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$CURSOR_THEME/" ~/.config/gtk-3.0/settings.ini
	else
		warn "No GTK 3 config present. Skipping."
	fi

	if [ -e ~/.config/gtk-4.0/ ]; then
		#sed -i "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=default/" ~/.config/gtk-4.0/settings.ini
		sed -i "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$CURSOR_THEME/" ~/.config/gtk-4.0/settings.ini
	else
		warn "No GTK 4 config present. Skipping."
	fi
else

	warn "GTK 3/4 not installed. Skipping."
fi

echo "Done setting cursor theme."
echo "Restart X or log out and back in again to finish applying."
