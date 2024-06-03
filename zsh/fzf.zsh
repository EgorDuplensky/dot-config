#!/usr/bin/env bash

# shellcheck disable=SC1090

[ -d /usr/share/fzf ] && for f in /usr/share/fzf/*.zsh; do
    source "${f}"
done

[ -d /usr/share/doc/fzf/examples ] && for f in /usr/share/doc/fzf/examples/*.zsh; do
    source "${f}"
done

# Fuzzy matching (fzf)
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --no-mouse --info=hidden --prompt=''"
export FZF_ALT_C_OPTS="--preview 'ls -a --color {}' --color='preview-fg:#ffffff' --preview-window=right:70%"

# fuzzy enter git repo in home
fcd-git() {
    cd "$(find ~/ -name '*.git' -type d | sed -r 's/\\.git//' | fzf)"  || exit
}

# complete gdp batch stack print in fzf kill manner
complete -F _fzf_complete_kill -o nospace -o default -o bashdefault gstack-gdb
