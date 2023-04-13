# .bashrc executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export TERM=xterm-256color
export EDITOR=vim

# History
shopt -s histappend # append to the history file, dont' overwrite it
HISTCONTROL=ignoreboth # ignore duplicated lines
HISTSIZE=500
HISTFILESIZE=500

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

# Latex setup
alias long-lines="ls *.tex |xargs style -l 29 | \
                  grep 'equation\|align\|graphics\|section\|subsection\|\
                  subsubsection\|%' -v"
alias spell='aspell --add-tex-command="citep op" --add-tex-command="citet op" --add-tex-command="eqref op" -t -c'
alias dups='checkwriting --no-passive --no-strunk --no-weasel'

# Bash setup
set -o vi # Vim style command prompt
alias ls='ls --color -h --group-directories-first'

# tmux setup
alias s='tmux new-session \; split-window -h \;'

# LDG setup
alias ligo-proxy='ligo-proxy-init gregory.ashton'
alias ecp_shortcut='ecp-cookie-init LIGO.ORG https://versions.ligo.org/git gregory.ashton'

function pcdev(){
    gsissh ldas-pcdev$1.ligo.caltech.edu
}

copy_from_cit() {
    gsiscp ldas-pcdev3.ligo.caltech.edu:/home/gregory.ashton/$1 $2
    }


# OzStar
alias ozstar="ssh -X gashton@ozstar.swin.edu.au"


function ozcp(){
    scp gashton@ozstar.swin.edu.au:/fred/oz006/gashton/$1 .
    }

function ozcpto(){
    scp $1 gashton@ozstar.swin.edu.au:/fred/oz006/gashton/
    }


# Tab completion
complete -f -X '!*tex' spell
complete -f -X '!*tex' dups
complete -f -X '*.@(pdf|blg|bbl|aux)' vim
complete -f -X '*.@(pdf|blg|bbl|aux)' gvim
complete -f -X '!*.@(tex)' texworks
complete -f -X '!*.@(pdf)' e


# Python path
PYTHONPATH="${HOME}/Scripts"
export PYTHONPATH

# Path
PATH=:$PATH:${HOME}/Programs/Academic-Writing-Check
PATH=:$PATH:${HOME}/Programs/batchgit
PATH=:$PATH:${HOME}/Scripts

# Misc
e() { evince "$@" 2> /dev/null & }
export MPLCONFIGDIR=${HOME}/.config/matplotlib

function SFThist {
lalapps_dumpSFT -H -i $1 | grep "epoch" | sed 's%^epoch:%%' | tr -d '[]' | sed -e 's/, 0//g' | hist -b 80
}
export -f SFThist

# . ${HOME}/octapps/octapps-user-env.sh

# Py MultiNest setup
export MKL_THREADING_LAYER=GNU
export LD_LIBRARY_PATH=$HOME/Programs/MultiNest/lib

# added by Miniconda3 installer
export PATH="/home/user1/miniconda3/bin:$PATH"
