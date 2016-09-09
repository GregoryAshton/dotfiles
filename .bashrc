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
PS1="\W:\[\033[01;31m\] \$\[\033[00m\] "

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

# Alias
alias fin="notify-send 'Finished'"
alias ?="git status -uno"
alias gdiff="git diff"
alias serve='bundle exec jekyll serve'
alias long-lines="ls *.tex |xargs style -l 29 | \
                  grep 'equation\|align\|graphics\|section\|subsection\|\
                  subsubsection\|%' -v"
eval `dircolors ~/.dir_colors`
alias ls='ls --color -h --group-directories-first'
e() { evince "$@" 2> /dev/null & }
source ~/Dropbox/eyeP/ssh-aliases

alias spell='aspell --add-tex-command="citep op" --add-tex-command="citet op" --add-tex-command="eqref op" -t -c'
complete -f -X '!*tex' spell
alias dups='checkwriting --no-passive --no-strunk --no-weasel'
complete -f -X '!*tex' dups

set -o vi # Vim style command prompt
complete -f -X '*.@(pdf|blg|bbl|aux)' vim 
complete -f -X '*.@(pdf|blg|bbl|aux)' gvim
complete -f -X '!*.@(tex)' texworks
complete -f -X '!*.@(pdf)' e

# alias to start tmux with two pans
alias s='tmux new-session \; split-window -h \;'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ----------- PYTHON PATH --------------
PYTHONPATH=""
PPDIRS=("/home/greg/neutron_star_modelling"
        "/home/greg/timing-noise/Scripts"
        "/home/greg/timing-noise/GlitchSearch"
        "/home/greg/timing-noise/AnalysisLyneObservations/EmCeeInvestigation"
        )
for dir in "${PPDIRS[@]}"; do
  PYTHONPATH=$PYTHONPATH:$dir
done
export PYTHONPATH

# ----------- PATH ---------------------
PATH=:$PATH:/home/greg/Programs/Academic-Writing-Check
PATH=:$PATH:/home/greg/Programs/batchgit
PATH=:$PATH:/home/greg/Scripts

# Add lalapps
. /home/greg/lalsuite-install/etc/lalapps-user-env.sh

# ATNF database
export PSRCAT_FILE='mydir/psrcat/psrcat.db'

# Turn of askpass on fedora
unset SSH_ASKPASS

# Manually add ssh key on fedora
#eval `ssh-agent -s`
#ssh-add ~/.ssh/id_rsa_github

# added by Miniconda2 3.19.0 installer
export PATH="/home/greg/Programs/miniconda2/bin:$PATH"

# added by Miniconda2 4.0.5 installer
export PATH="/home/greg/miniconda2/bin:$PATH"

# added by Anaconda2 4.1.1 installer
export PATH="/home/greg/anaconda2/bin:$PATH"
