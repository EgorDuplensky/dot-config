#!/usr/bin/env bash
function show_git_info {
    local dir_format='%-70s'
    local git_info
    local git_branch

    local git_root="$(git -C $1 rev-parse --show-toplevel 2> /dev/null)"

    if [ -n "$git_root" ]; then
        git_info=$(git --git-dir=$git_root/.git log --color -1 --oneline --format="%C(auto) %B" 2> /dev/null | head -1)
        git_branch=$(git --git-dir=$git_root/.git rev-parse --abbrev-ref HEAD 2> /dev/null)
    fi

    printf "$dir_format \e[1;32m%-20s\e[m \e[0;37m%s\e[m\n" "$1" "$git_branch" "$git_info"
}

export -f show_git_info

mkdir -p ~/.cache/fasd
eval "$(fasd --init auto)"
export _FASD_DATA=$HOME/.cache/fasd/.fasd

function fasd_fzf() {
    local dir
    dir="$(fasd -sdR 2>&1 | fzf +s | sed 's/^[0-9,.]* *//')"
    printf 'cd %q' "$dir"
}

# Bind to Alt-z
# shellcheck disable=SC2016
bind -m emacs-standard '"\ez": " \C-b\C-k \C-u $(fasd_fzf) \e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
