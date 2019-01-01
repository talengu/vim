#!/bin/bash
# basic bash config
# install from https://github.com/talengu/vim

VIM_FOLDER=~/.vim
URL_BASHRC=https://raw.githubusercontent.com/talengu/vim/master/talen.bashrc

if [ -d $VIM_FOLDER ]; then
   echo "Folder $VIM_FOLDER exists."
else
  echo "Folder $VIM_FOLDER exists."
  mkdir $VIM_FOLDER
fi
curl $URL_BASHRC > $VIM_FOLDER/talen.bashrc
echo "source $VIM_FOLDER/talen.bashrc" >> ~/.bashrc
echo "set completion-ignore-case on" >> ~/.inputrc

source $VIM_FOLDER/talen.bashrc
source ~/.bashrc
echo "success"
