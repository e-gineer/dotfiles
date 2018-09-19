#!/bin/bash

# Bash
ln -s ~/dotfiles/.bashrc       ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

# Vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
vim +PluginInstall +qall
