#!/usr/bin/env bash

# shellcheck disable=SC1090

[ -f ~/.config/fzf/fzf.bash ] && source ~/.config/fzf/fzf.bash

[ -d /usr/share/fzf ] && for f in /usr/share/fzf/*.bash; do
    source "${f}"
done

[ -d /usr/share/doc/fzf/examples ] && for f in /usr/share/doc/fzf/examples/*.bash; do
    source "${f}"
done

# Fuzzy matching (fzf)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --no-mouse --info=hidden --color='fg+:#ffffff,fg:#A5A6A5,hl:#ffffff,hl+:#ffffff,pointer:#ffffff,prompt:#ffffff,gutter:#3f3f3f' --prompt=''"
export FZF_ALT_C_OPTS="--preview 'ls -a --color {}' --color='preview-fg:#ffffff' --preview-window=right:70%"

# fuzzy enter git repo in home
fcd-git() {
    cd "$(find ~/ -name '*.git' -type d | sed -r 's/\\.git//' | fzf)"  || exit
}

fsystemctl() {
  local unit
  unit=$(systemctl list-unit-files |
    awk '{print $1}' |
    grep service |
    fzf --preview 'PAGER=cat systemctl --user status {}' \
        --bind "ctrl-s:execute(systemctl --user start {})" \
        --bind "ctrl-k:execute(systemctl --user stop {})" \
        --bind "ctrl-u:reload($(systemctl --user list-unit-files | awk '{print $1}' | grep service)")
  [ -n "$unit" ] && sudo systemctl --user stop "$unit" &&
      journalctl -u "$unit" --since "10 sec ago" --no-pager
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

# fzf power for z
[ -f ~/.config/bash/z.sh ] && \
    source ~/.config/bash/z.sh

