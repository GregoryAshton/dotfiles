export TERM=xterm-256color
export EDITOR=vim

# Prompt
#force_color_prompt=yes
#parse_git_branch() {
         #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
     #}
 #PS1="\A \W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]:\[\033[01;31m\] \$\[\033[00m\] "
 #
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

# Git setup
alias gstatus='git status -uno'
alias gdiff='git diff'

# Set vim style
set -o vi # Vim style command prompt

# tmux setup
alias s='tmux new-session \; split-window -h \;'

# Enable colors
export CLICOLOR=1
