# Delete all merged git branches
alias gclean="git branch --merged | grep -v "\*" | grep -v master | grep -v develop | xargs -n 1 git branch -d"

# Nice git tree
alias gtree="git log --oneline --decorate --all --graph"

# Shorten tmuxinator
alias mux="tmuxinator"

# Access my dotfiles
alias dots="cd /opt/dotfiles"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls -laF ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Always enable colored `grep` output
alias grep='grep --color=auto '

# Enable aliases to be sudo’ed
alias sudo='sudo '

# vhosts
alias hosts='sudo vim /etc/hosts'

# terminal settings
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
export NVM_DIR=/Users/monica/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# SumUp
export SUMUP_CONFIG_DIR="/opt/ze-dashboard"
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
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
