#!/bin/bash
RES_NAME=vim
git clone https://github.com/talengu/vim $RES_NAME
git clone https://github.com/VundleVim/Vundle.vim.git $RES_NAME/bundle/Vundle.vim

echo "#! /bin/sh
vim -c \"Man \$1 \$2\" -c 'silent only'
" > $RES_NAME/viman

echo "set completion-ignore-case on" >> ~/.inputrc

chmod +x $RES_NAME/viman

VIM_FOLDER=~/.vim
if [ -d $VIM_FOLDER ]; then
   echo "File $VIM_FOLDER exists. Please backup old .vim ----
   cp -r $VIM_FOLDER ~/.vim.backup && rm -rf $VIM_FOLDER
   cp -r $RES_NAME $VIM_FOLDER"
else
   echo "File $VIM_FOLDER does not exist."
   cp -r $RES_NAME $VIM_FOLDER
   echo "source $VIM_FOLDER/talen.bashrc" >> ~/.bashrc
   echo "success"
fi
