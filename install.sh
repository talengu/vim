#!/bin/bash
RES_NAME=/tmp/talen_vim
VIM_FOLDER=~/.vim

if [ -d $VIM_FOLDER ]; then
   echo "Folder $VIM_FOLDER exists.
Update RUN:
   git pull
Backup old.vim RUN:
   cp -r $VIM_FOLDER ~/.vim.backup && rm -rf $VIM_FOLDER
   sh install.sh"
else
  git clone https://github.com/talengu/vim $RES_NAME
  git clone https://github.com/VundleVim/Vundle.vim.git $RES_NAME/plugins/Vundle.vim

  echo "#! /bin/sh
  vim -c \"Man \$1 \$2\" -c 'silent only'
  " > $RES_NAME/viman

  chmod +x $RES_NAME/viman

  echo "Copy $RES_NAME to $VIM_FOLDER ."
  cp -r $RES_NAME $VIM_FOLDER
  echo "source $VIM_FOLDER/bashrc" >> ~/.bashrc
  echo "set completion-ignore-case on" >> ~/.inputrc
  echo "source-file ~/.vim/tmux.conf" >> ~/.tmux.conf
  echo "success"
fi
