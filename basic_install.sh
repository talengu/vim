#!/bin/bash
# basic bash config
# install from https://github.com/talengu/vim

VIM_FOLDER=~/.vim

if [ -d $VIM_FOLDER ]; then
   echo "Folder $VIM_FOLDER exists."
else
  echo "Folder $VIM_FOLDER exists."
  mkdir $VIM_FOLDER
fi
curl https://github.com/talengu/vim/blob/master/talen.bashrc > $VIM_FOLDER/talen.bashrc
echo "source $VIM_FOLDER/talen.bashrc" >> ~/.bashrc
echo "set completion-ignore-case on" >> ~/.inputrc

source ~/.bashrc
echo "success"
