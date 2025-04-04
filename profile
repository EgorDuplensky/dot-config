[ -d $HOME/.scripts ] && PATH="$PATH:$HOME/.scripts"
[ -d $HOME/.local/bin ] && PATH="$PATH:$HOME/.local/bin"
setxkbmap -layout us,ru -option grp:win_space_toggle -option ctrl:nocaps
