export TERM=xterm-256color
export EDITOR=vim

# Prompt
#force_color_prompt=yes
#parse_git_branch() {
         #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
     #}
 #PS1="\A \W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]:\[\033[01;31m\] \$\[\033[00m\] "
 #

# Determines prompt modifier if and when a conda environment is active
precmd_conda_info() {
  if [[ -n $CONDA_DEFAULT_ENV ]]; then
    CONDA_ENV="($CONDA_DEFAULT_ENV) "
  # When no conda environment is active, don't show anything
  else
    CONDA_ENV=""
  fi
}

# Run the previously defined function before each prompt
precmd_functions+=( precmd_conda_info )

# Allow substitutions and expansions in the prompt
setopt prompt_subst

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ %F{cyan}$CONDA_ENV${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '

# Git setup
alias gstatus='git status -uno'
alias gdiff='git diff'

# Set vim style
set -o vi # Vim style command prompt

# tmux setup
alias s='tmux new-session \; split-window -h \;'

# Enable colors
export CLICOLOR=1
