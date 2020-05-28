#!/bin/sh
. ~/.profile
# configure keys
xbindkeys
# ensure multimonitor setup
xrandr --auto
# set random wallpapers
rnd-wp
# status bar
slstatus &
# screen locker
light-locker &
# power manager (daemon by default)
xfce4-power-manager
# composite manager
picom -b
# Log stderror to a file
dwm 2> ~/.config/dwm/log

