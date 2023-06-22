# .bashrc executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export TERM=xterm-256color
export EDITOR=vim

# History
shopt -s histappend # append to the history file, dont' overwrite it
HISTCONTROL=ignoreboth # ignore duplicated lines

# Prompt
force_color_prompt=yes
parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
     }
 PS1="\A \W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]:\[\033[01;31m\] \$\[\033[00m\] "

eval `dircolors ~/.dir_colors`
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Git setup
alias ?="git status -uno"
alias gdiff="git diff"

# Bash setup
set -o vi # Vim style command prompt
alias ls='ls --color -h --group-directories-first'

# tmux setup
alias s='tmux new-session \; split-window -h \;'

# LDG setup
alias ligo-proxy='ligo-proxy-init gregory.ashton'

source /cvmfs/oasis.opensciencegrid.org/ligo/sw/conda/etc/profile.d/conda.sh
conda activate igwn-py39
