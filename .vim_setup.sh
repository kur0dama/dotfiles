#!/bin/bash

# create folders
[ ! -d "~/.vim" ] && mkdir ~/.vim
[ ! -d "~/.vim/colors" ] && mkdir ~/.vim/colors
[ ! -d "~/.vim/bundle" ] && mkdir ~/.vim/bundle
[ ! -d "~/.vim_backup" ] && mkdir ~/.vim_backup

# download vundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

# NOTE: .vimrc must be in ~/ for :PluginInstall to work
# NOTE: color scheme will not show unless zenburn.vim is in:
# ~/.vim/colors