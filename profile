[ -d $HOME/.scripts ] && PATH="$PATH:$HOME/.scripts"
[ -d $HOME/.local/bin ] && PATH="$PATH:$HOME/.local/bin"
# Claude code
export ENABLE_LSP_TOOL=1
setxkbmap -layout us,ru -option grp:win_space_toggle -option ctrl:nocaps
