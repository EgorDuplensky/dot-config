#!/usr/bin/env bash

# fz
unalias z
function z() {
  if [[ -z "$*" ]]; then
      local dir
      dir="$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
      printf 'cd %q' "$dir"
  else
    _last_z_args="$*"
    _z "$*"
  fi
}

function zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")" || return
}

# Bind to Alt-z
# shellcheck disable=SC2016
bind -m emacs-standard '"\ez": " \C-b\C-k \C-u $(z) \e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
