# Workflow
alias gtree="git log --oneline --decorate --all --graph"
alias gclean="git branch --merged | grep -v "\*" | grep -v master | grep -v develop | xargs -n 1 git branch -d"
# alias ls="gls -laF --group-directories-first --color"
alias tree="git log --oneline --decorate --all --graph"
alias mux="tmuxinator"
alias dots="cd /opt/dotfiles"

export PATH=/usr/local/opt/python/libexec/bin:/usr/local/bin:$PATH:/usr/local/opt/go/libexec/bin:/private/var/root/.local/bin
export TERM=xterm-256color
export EDITOR='vim'

set -o vi
bindkey -v '^?' backward-delete-char

# Golang utils
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

# Java utils
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home/

# Javascript utils
export NVM_DIR="$HOME/.nvm"
export SUMUP_CONFIG_DIR="/opt/ze-dashboard"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# SumUp
alias sp="cd /opt/ze-dashboard/app/scripts"
alias spr="cd /opt/ze-dashboard"
export SCANNER_BRANCH=master
export SCANNER_INDEX_REPOSITORY=git@github.com:sumup/theseus-index.git

# Google cloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f /private/var/root/google-cloud-sdk/path.zsh.inc ]; then
  source '/private/var/root/google-cloud-sdk/path.zsh.inc'
fi

# Zsh configs
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

autoload -U promptinit && promptinit
fpath+=("/usr/local/share/zsh/site-functions")
prompt pure
