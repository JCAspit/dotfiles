#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

xinput set-prop 11 "libinput Accel Speed" -0.75

xrandr --output DP-2 --primary --mode 1920x1080 --rate 120
xrandr --output DP-4 --mode 1920x1080 --rate 165.00 --right-of DP-2

picom -b --vsync --no-frame-pacing --backend=glx

# turn off display power management service (dpms)
#xset -dpms
#setterm -blank 0 -powerdown 0

# turn off black screensaver
xset s off

systemctl --user import-environment DISPLAY

exec i3
