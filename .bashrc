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
alias atlas8='gsissh -X atlas8.atlas.aei.uni-hannover.de'
alias atlas9='gsissh -X atlas9.atlas.aei.uni-hannover.de'
alias CIT_submit='gsissh -X ldas-grid.ligo.caltech.edu'
alias pcdev1='gsissh -X ldas-pcdev1.ligo.caltech.edu'
alias pcdev2='gsissh -X ldas-pcdev2.ligo.caltech.edu'
alias pcdev3='gsissh -X ldas-pcdev3.ligo.caltech.edu'
alias ozstar='ssh gashton@ozstar.swin.edu.au'
alias calc='jupyter qtconsole --no-banner --no-confirm-exit &'
alias spell='aspell --add-tex-command="citep op" --add-tex-command="citet op" --add-tex-command="eqref op" -t -c'
alias dups='checkwriting --no-passive --no-strunk --no-weasel'
alias pissh='ssh pi@`nmap -sn 192.168.0.0/24 | grep "raspberrypi" | sed "s/^.*(//;s/)$//"`'
alias reset_screen='xrandr -s 0'
alias turn_on_monitor='xrandr --output DP3-3 --left-of eDP1'
alias AEI_VPN='sudo openvpn --config ~/grasht@ahgate1.aei.uni-hannover.de.ovpn'
alias ecp_shortcut='ecp-cookie-init LIGO.ORG https://versions.ligo.org/git gregory.ashton'

copy_from_atlas() {
    gsiscp atlas7.atlas.aei.uni-hannover.de:/home/gregory.ashton/$1 $2
    }

copy_to_atlas() {
    gsiscp $1 atlas7.atlas.aei.uni-hannover.de:/home/gregory.ashton/
    }

# Tab completion
complete -f -X '!*tex' spell
complete -f -X '!*tex' dups
complete -f -X '*.@(pdf|blg|bbl|aux)' vim
complete -f -X '*.@(pdf|blg|bbl|aux)' gvim
complete -f -X '!*.@(tex)' texworks
complete -f -X '!*.@(pdf)' e


# Python path
PYTHONPATH=""
PPDIRS=("${HOME}/neutron_star_modelling"
        "${HOME}/Scripts"
        "${HOME}/timing-noise/Scripts"
        "${HOME}/timing-noise/AnalysisLyneObservations/EmCeeInvestigation"
        )
for dir in "${PPDIRS[@]}"; do
  PYTHONPATH=$PYTHONPATH:$dir
done
export PYTHONPATH

# Path
PATH=:$PATH:${HOME}/Programs/Academic-Writing-Check
PATH=:$PATH:${HOME}/Programs/batchgit
PATH=:$PATH:${HOME}/Scripts

# Misc
e() { evince "$@" 2> /dev/null & }
set -o vi # Vim style command prompt
export MPLCONFIGDIR=${HOME}/.config/matplotlib

# Add lalapps
#. ${HOME}/lalsuite-install/etc/lalapps-user-env.sh

# ATNF database
export PSRCAT_FILE='mydir/psrcat/psrcat.db'

export PATH="${HOME}/anaconda2/bin:$PATH"

function SFThist {
lalapps_dumpSFT -H -i $1 | grep "epoch" | sed 's%^epoch:%%' | tr -d '[]' | sed -e 's/, 0//g' | hist -b 80
}
export -f SFThist

# . ${HOME}/octapps/octapps-user-env.sh
