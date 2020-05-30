[ -d /usr/share/fzf ] && for f in /usr/share/fzf/*.bash; do
    source ${f}
done
# Fuzzy matching (fzf)
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --no-mouse --info=hidden'

# fuzzy enter git repo in home
fcd-git() {
    cd $(find ~/ -name '*.git' -type d | sed -r 's/\.git//' | fzf)
}

# fstart - start systemd unit
fstart() {
  unit=$(systemctl list-unit-files | grep disabled |
    awk '{print $1}' | grep service | fzf)
  [ -n "$unit" ] && sudo systemctl start $unit &&
    journalctl -u $unit --since "10 sec ago" --no-pager
}

# fstop - stop systemd unit
fstop() {
  unit=$(systemctl list-units | grep running |
    awk '{print $1}' | grep service | fzf)
  [ -n "$unit" ] && sudo systemctl stop $unit &&
    journalctl -u $unit --since "10 sec ago" --no-pager
}

# finstall - install new package
finstall() {
  package=$(pacman -Ssq | fzf)
  if [ -n "$package" ]; then
    pacman -Ss "^$package$"
    sudo pacman -S $package
  fi
}

# fdelete - completely uninstall package
fdelete() {
  package=$(pacman -Qqe | fzf)
  [ -n "$package" ] && sudo pacman -Rscn $package
}

# complete gdp batch stack print in fzf kill manner
complete -F _fzf_complete_kill -o nospace -o default -o bashdefault gstack-gdb

#Bash completion with fzf
[ -f ~/.local/opt/fzf-tab-completion/bash/fzf-bash-completion.sh ] && \
    source ~/.local/opt/fzf-tab-completion/bash/fzf-bash-completion.sh

# Shift-Tab fuzzy completion for command arguments
bind -x '"\e[Z": fzf_bash_completion'

# mark directory with 'mark' and enter with 'Ctrl-g'
[ -f ~/.local/opt/fzf-marks/fzf-marks.plugin.bash ] && \
    source ~/.local/opt/fzf-marks/fzf-marks.plugin.bash

# z (most frequently  used direcotries)
[ -f /usr/share/z/z.sh ] && \
    source /usr/share/z/z.sh
# fzf power for z
[ -f ~/.config/bash/z.sh ] && \
    source ~/.config/bash/z.sh
