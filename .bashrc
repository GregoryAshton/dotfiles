# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return 

# History
shopt -s histappend # append to the history file, dont' overwrite it
HISTCONTROL=ignoreboth # ignore duplicated lines
HISTSIZE=500
HISTFILESIZE=500

# Prompt
force_color_prompt=yes
PS1="\W:\[\033[01;31m\] \$\[\033[00m\] "

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Alias
alias ?="git status"
alias gdiff="git diff"
source ~/Dropbox/eyeP/ssh-aliases

set -o vi # Vim style command prompt

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa_github

PYTHONPATH="/home/greg/neutron_star_modelling/"
export PYTHONPATH
