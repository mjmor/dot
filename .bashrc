# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
        ORANGE=$(tput setaf 203)
        GREY=$(tput setaf 1)
        YELLOW=$(tput setaf 10)
        RESET=$(tput sgr0)
        BOLD=$(tput bold)
    else
        color_prompt=
    fi
fi

# old color prompt
# \[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$

source ~/scripts/git_prompt_utils.sh
if [ "$color_prompt" = yes ]; then
    PS1='\[${GREY}${BOLD}\]\u@\h \[${RESET}\]| \[${GREY}${BOLD}\]\D{%m.%e %I:%M %Z} \[${RESET}\]| \[${GREY}${BOLD}\]\w\n\[${RESET}\]|__\[${ORANGE}${BOLD}\]($(parse_git_branch)$(render_git_stash))\[${RESET}\]--> '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -e ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# completion scripts
if [ -e ~/.bash_completion ]; then
    . ~/.bash_completion
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export VISUAL=vim
export EDITOR="$VISUAL"
export RANGER_LOAD_DEFAULT_RC=false

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

if [ `which javac` ]; then
    export CLASSPATH=~/.java_class/:.
fi

# specific if go lang is installed
if [ `which go` ]; then
    export GOPATH=~/go/
    export PATH=$PATH:~/go/bin/
fi

# if scripts directory is there, add to path
if [ -d ~/scripts ]; then
    export PATH=$PATH:~/scripts/
fi

# if matlab is installed, then add to path
if [ -f ~/matlab/bin/matlab ]; then
    export PATH=$PATH:~/matlab/bin/
fi

if [ -d ~/.class_vars/ ]; then
    for f in ~/.class_vars/*; do
        . $f;
    done
fi
