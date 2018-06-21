# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Just to be sure:
export HOME="/home/Djurre.deJong"
export PATH="$HOME/bin:/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:."

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000
# efficient history searching without <ctrl-R>
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
bind 'set match-hidden-files off'


# don't let me logout using ctrl-D
set -o ignoreeof
set bell-style none

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_nedap ]; then
    . ~/.bash_nedap
fi
if [ -f ~/.bash_secrets ]; then
    . ~/.bash_secrets
fi
if [ -f ~/.bash_git ]; then
    . ~/.bash_git
fi

# new path for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#Calculate
=(){ awk "BEGIN{ print $* }" ;}

export EDITOR="vi"
export BUNDLER_EDITOR="subl"
 
export CAP_USER=djurre.dejong
export CAP_KEY_PATH=$HOME/.ssh/nedap_rsa

### pars for fun: install | remove | rollback
function apt-history(){

      case "$1" in
        install)
              grep 'install ' /var/log/dpkg.log
              ;;
        upgrade|remove)
              grep $1 /var/log/dpkg.log
              ;;
        rollback)
              grep upgrade /var/log/dpkg.log | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

# add ssh identy for every session, Ddj feb 2018
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_ed25519
ssh-add ~/.ssh/nedap_rsa
