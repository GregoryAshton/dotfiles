#!/bin/bash

# To be used at initial setup only. If the files already exist a simple warning
# is issued and no action taken. It is up to the user to delete the file and
# rerun this script to properly install

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Setup symlinks - if they already exist just print a warning
if [ -f ~/.bashrc ]; then
    echo "WARNING: ~/.bashrc already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.bashrc" ~
fi

if [ -f ~/.gitconfig ]; then
    echo "WARNING: ~/.gitconfig already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.gitconfig" ~
fi

if [ -f ~/.tmux.conf ]; then
    echo "WARNING: ~/.tmux.conf already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
fi

if [ -f ~/.dir_colors ]; then
    echo "WARNING: ~/.dir_colors already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.dir_colors" ~
fi

if [ -f ~/.batchgitrc ]; then
    echo "WARNING: ~/.batchgitrc already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.batchgitrc" ~
fi



# vim setup
if [ -d ~/.vim ]; then
  echo "WARNING: ~/.vim already exist: no action taken"
else
  ln -sfv "$DOTFILES_DIR/.vim" ~

  # Install Vundle
  echo "Set up vim, Vundle and install plugins"
  cd ~/.vim
  ./InstallVundle
  vim +PluginInstall +qall

  # Install Powerline fonts
  ./InstallPowerlineFonts
fi


# ipython setup
if ! type "$ipython" > /dev/null; then
    ipython profile create default # Generate the file structure (if it doesn't exist)
fi
if [ -f ~/.ipython/profile_default/startup/ipython_imports.py ]; then
    echo "WARNING: .ipython/profile_default/startup/ipython_imports.py already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/ipython_imports.py" ~/.ipython/profile_default/startup/ipython_imports.py
fi


# matplotlib setup
if [ -f ~/.config/matplotlib/stylelib/paper.mplstyle ]; then
    echo "WARNING: .config/matplotlib/stylib/paper.mplstyle already exists: no action taken"
else
    mkdir -p ~/.config/matplotlib/stylelib
    ln -sfv "$DOTFILES_DIR/paper.mplstyle" ~/.config/matplotlib/stylelib/paper.mplstyle
fi

if [ -f ~/.config/matplotlib/stylelib/thesis.mplstyle ]; then
    echo "WARNING: .config/matplotlib/stylib/thesis.mplstyle already exists: no action taken"
else
    mkdir -p ~/.config/matplotlib/stylelib
    ln -sfv "$DOTFILES_DIR/thesis.mplstyle" ~/.config/matplotlib/stylelib/thesis.mplstyle
fi

