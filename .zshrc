alias sp="cd /opt/ze-dashboard/app/scripts"
alias spr="cd /opt/ze-dashboard"
alias spt=". ~/tmux/sp-session.sh"
alias gtree="git log --oneline --decorate --all --graph"
alias gclean="git branch --merged | grep -v "\*" | grep -v master | grep -v develop | xargs -n 1 git branch -d"
alias cms-export="cd /opt/contentful && contentful-export --config config.json --include-drafts --max-allowed-limit 200"
alias json="python -m json.tool"
alias ls="gls -laF --group-directories-first --color"
alias tree="git log --oneline --decorate --all --graph"
alias mux="tmuxinator"

export EDITOR='vim'
set -o vi
bindkey -v '^?' backward-delete-char

export TERM=xterm-256color
export PATH=/usr/local/bin:$PATH:/usr/local/opt/go/libexec/bin:/private/var/root/.local/bin
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home/

autoload -U promptinit && promptinit
fpath+=("/usr/local/share/zsh/site-functions")
prompt pure

export NVM_DIR="$HOME/.nvm"
export SUMUP_CONFIG_DIR="/opt/ze-dashboard"
# The next line updates PATH for the Google Cloud SDK.
if [ -f /private/var/root/google-cloud-sdk/path.zsh.inc ]; then
  source '/private/var/root/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
# if [ -f /private/var/root/google-cloud-sdk/completion.zsh.inc ]; then
#  source '/private/var/root/google-cloud-sdk/completion.zsh.inc'
# fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
