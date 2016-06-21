alias ls="gls -laF --group-directories-first --color=auto"
alias sp="cd /opt/ze-dashboard/app/scripts"
alias spr="cd /opt/ze-dashboard"
alias spt=". ~/tmux/sp-session.sh"
alias gtree="git log --oneline --decorate --all --graph"
alias gclean="git branch --merged | grep -v "\*" | grep -v master | grep -v develop | xargs -n 1 git branch -d"

export EDITOR='vim'
set -o vi
bindkey -v '^?' backward-delete-char

export TERM=xterm-256color
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

autoload -U promptinit && promptinit
fpath+=("/usr/local/share/zsh/site-functions")
prompt pure
