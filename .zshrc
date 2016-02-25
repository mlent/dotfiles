alias ls="gls -laF --group-directories-first"
alias sp="cd /opt/ze-dashboard/app/scripts"
alias spr="cd /opt/ze-dashboard"
alias spt=". ~/tmux/sp-session.sh"
alias tree="git log --oneline --decorate --all --graph"

export EDITOR='vim'

set -o vi
bindkey -v '^?' backward-delete-char

autoload -U promptinit && promptinit
fpath+=("/usr/local/share/zsh/site-functions")
prompt pure
