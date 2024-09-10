#!/bin/bash

# To be used at initial setup only. If the files already exist a simple warning
# is issued and no action taken. It is up to the user to delete the file and
# rerun this script to properly install

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup symlinks - if they already exist just print a warning
if [ -f ~/.profile ]; then
    echo "WARNING: ~/.profile already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/profile" ~/.profile
fi

if [ -f ~/.gitconfig ]; then
    echo "WARNING: ~/.gitconfig already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/gitconfig" ~/.gitconfig
fi

if [ -f ~/.tmux.conf ]; then
    echo "WARNING: ~/.tmux.conf already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
fi

if [ -f ~/.dir_colors ]; then
    echo "WARNING: ~/.dir_colors already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/dir_colors" ~/.dir_colors
fi

# vim setup
if [ -d ~/.vim ]; then
  echo "WARNING: ~/.vim already exist: no action taken"
else
  ln -sfv "$DOTFILES_DIR/vim" ~/.vim

  # Install Vundle
  echo "Set up vim, Vundle and install plugins"
  cd ~/.vim
  ./InstallVundle
  vim +PluginInstall +qall

  # Install Powerline fonts
  ./InstallPowerlineFonts
fi
