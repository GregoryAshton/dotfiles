#!/bin/bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# symlinks for standard files
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~

# vim setup
if [ -d ~/.vim ]; then
  echo "~/.vim already exist - ignoring vim setup"
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


