#!/usr/bin/env bash

# shellcheck disable=SC1090

# [ -d /usr/share/fzf ] && for f in /usr/share/fzf/*.bash; do
#     source "${f}"
# done

if [[ ! "$PATH" == */home/eduplens/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/eduplens/.fzf/bin"
fi

eval "$(fzf --bash)"

# [ -d /usr/share/doc/fzf/examples ] && for f in /usr/share/doc/fzf/examples/*.bash; do
#     source "${f}"
# done

# [ -d "${HOME}/.fzf" ] && for f in "${HOME}/.fzf/shell/*.bash"; do
#     source "${f}"
# done

# Fuzzy matching (fzf)
export FZF_DEFAULT_OPTS="--no-scrollbar --height 15 --marker='' --pointer='' --scroll-off=5 --layout=reverse --no-mouse --info=hidden --prompt='> ' --border --color='pointer:#3f3f3f,marker:#3f3f3f,border:#dfaf8f,prompt:#9ece9e'"
export FZF_ALT_C_OPTS="--preview 'ls -a --color {}' --color='preview-fg:#ffffff' --preview-window=right:70%"
export FZF_CTRL_R_OPTS="--with-nth 2.."

# fuzzy enter git repo in home
fcd-git() {
    cd "$(find ~/ -name '*.git' -type d | sed -r 's/\\.git//' | fzf)"  || exit
}

# complete gdp batch stack print in fzf kill manner
complete -F _fzf_complete_kill -o nospace -o default -o bashdefault gstack-gdb
