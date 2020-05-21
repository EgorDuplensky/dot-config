#!/bin/sh
. ~/.profile
# set random wallpapers
rnd-wp
# status bar
slstatus &
# composite manager
picom -b
# Log stderror to a file
dwm 2> ~/.dwm.d/dwm.log

