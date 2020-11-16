#!/bin/sh
. ~/.profile
# configure keys
xbindkeys
# ensure multimonitor setup
xrandr --auto
# set random wallpapers
rnd-wp
# screen locker
light-locker &
# power manager (daemon by default)
xfce4-power-manager
# composite manager
picom -b
# vboxclipboard
if [ $(hostnamectl | sed -n -r 's#\s+Chassis: (\w)#\1#p') == 'vm' ]; then
    VBoxClient-all &
fi
# Log stderror to a file
dwm 2> ~/.config/dwm/log

