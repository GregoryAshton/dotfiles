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

# Add alias's
source ~/Dropbox/eyeP/ssh-aliases
alias fin="notify-send 'Finished'"
alias ?="git status -uno"
alias gdiff="git diff"
alias serve='bundle exec jekyll serve'
alias long-lines="ls *.tex |xargs style -l 29 | \
                  grep 'equation\|align\|graphics\|section\|subsection\|\
                  subsubsection\|%' -v"
eval `dircolors ~/.dir_colors`
alias ls='ls --color -h --group-directories-first'
alias s='tmux new-session \; split-window -h \;'
alias ligo-proxy='ligo-proxy-init gregory.ashton'
alias atlas7='gsissh -X atlas7.atlas.aei.uni-hannover.de'
alias calc='jupyter qtconsole --no-banner --no-confirm-exit &'
alias spell='aspell --add-tex-command="citep op" --add-tex-command="citet op" --add-tex-command="eqref op" -t -c'
alias dups='checkwriting --no-passive --no-strunk --no-weasel'

# Tab completion
complete -f -X '!*tex' spell
complete -f -X '!*tex' dups
complete -f -X '*.@(pdf|blg|bbl|aux)' vim
complete -f -X '*.@(pdf|blg|bbl|aux)' gvim
complete -f -X '!*.@(tex)' texworks
complete -f -X '!*.@(pdf)' e


# Python path
PYTHONPATH=""
PPDIRS=("/home/greg/neutron_star_modelling"
        "/home/greg/timing-noise/Scripts"
        "/home/greg/timing-noise/AnalysisLyneObservations/EmCeeInvestigation"
        )
for dir in "${PPDIRS[@]}"; do
  PYTHONPATH=$PYTHONPATH:$dir
done
export PYTHONPATH

# Path
PATH=:$PATH:/home/greg/Programs/Academic-Writing-Check
PATH=:$PATH:/home/greg/Programs/batchgit
PATH=:$PATH:/home/greg/Scripts

# Misc
e() { evince "$@" 2> /dev/null & }
set -o vi # Vim style command prompt
export MPLCONFIGDIR=/home/greg/.config/matplotlib

# Add lalapps
. /home/greg/lalsuite-install/etc/lalapps-user-env.sh

# ATNF database
export PSRCAT_FILE='mydir/psrcat/psrcat.db'

# added by Anaconda2 4.1.1 installer
export PATH="/home/greg/anaconda2/bin:$PATH"

