[ -d /usr/share/fzf ] && for f in /usr/share/fzf/*.bash; do
    source ${f}
done
# Fuzzy matching (fzf)
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --no-mouse --info=hidden'

# fuzzy enter git repo in home
fcd-git() {
    cd $(find ~/ -name '*.git' -type d | sed -r 's/\.git//' | fzf)
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
source /usr/share/z/z.sh
# fz
[ -f ~/.config/bash/zfz.sh ] && source ~/.config/bash/zfz.sh
