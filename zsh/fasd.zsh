mkdir -p ~/.cache/fasd
eval "$(fasd --init auto)"
export _FASD_DATA=$HOME/.cache/fasd/.fasd

function fasd_fzf() {
    local dir
    dir="$(fasd -sdlR 2>&1 | fzf +s | sed 's/^[0-9,.]* *//')"
    # printf 'cd %q' "$dir"
    cd "${dir}" || return 1
}

zle -N fasd_fzf{,}

# Bind to Alt-z
# shellcheck disable=SC2016
bindkey '^[z' fasd_fzf
