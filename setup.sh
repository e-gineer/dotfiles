#!/bin/bash

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dotfiles/vimrc ~/.vimrc

vim +PluginInstall +qall
