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

if [ -f ~/.screenrc ]; then
    echo "WARNING: ~/.screenrc already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.screenrc" ~
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

# jupyter setup
if [ -f ~/.jupyter/jupyter_config.py ]; then
    echo "WARNING: .jupyter/jupyter_config.py already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/jupyter_config.py" ~/.jupyter/jupyter_config.py
fi

if [ -f ~/.jupyter/profile_default/jupyter_nbconvert_config.py ]; then
    echo "WARNING: .jupyter/profile_default/jupyter_nbconvert_config.py already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/jupyter_nbconvert_config.py" ~/.jupyter/jupyter_nbconvert_config.py
fi
if [ -f ~/.jupyter/hidecode.tplx ]; then
    echo "WARNING: .jupyter/hidecode.tplx already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/hidecode.tplx" ~/.jupyte/hidecode.tplx
fi
