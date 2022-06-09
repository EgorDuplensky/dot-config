#!/bin/bash

[[ -f ~/.profile ]] && . ~/.profile

alias grep="grep --color=auto"
alias ll='ls -lah --color --group-directories-first'
alias ls='ls --color --group-directories-first'
alias ec='/usr/local/bin/emacsclient --no-wait'
alias et='/usr/local/bin/emacsclient -t'
alias sudoec='SUDO_EDITOR=/usr/local/bin/emacsclient sudoedit'
alias cls='printf "\033c"; stty sane'
alias pronounce='trans -speak -no-translate -j'
alias translate='trans -d -v :ru -j'
alias google-chrome='google-chrome-stable --enable-features=WebUIDarkMode --force-dark-mode'
alias file-explorer='xdg-open /'

# configure keys
# xbindkeys
# ensure multimonitor setup
# xrandr --output Virtual1 --mode 1920x1200 --output Virtual2 --mode 1920x1080 --right-of Virtual1
# set random wallpapers
if command -v rnd-wp > /dev/null; then rnd-wp; fi
# composite manager
if command -v picom > /dev/null; then picom -b; fi
# status bar
if command -v dwmbar > /dev/null; then dwmbar & fi

# Log stderror to a file
dwm 2>> ~/.config/xorg/log
