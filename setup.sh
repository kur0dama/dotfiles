#!/bin/bash

# create folders
[ ! -d "~/.vim" ] && mkdir ~/.vim
[ ! -d "~/.vim/colors" ] && mkdir ~/.vim/colors
[ ! -d "~/.vim/bundle" ] && mkdir ~/.vim/bundle
[ ! -d "~/.vim_backup" ] && mkdir ~/.vim_backup

# download vundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

# generate symlinks
cd ~
[[ -d ~/.bashrc ]] && rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/zenburn.vim ~/.vim/colors/zenburn.vim

# install vim plugins
vim +PluginInstall +qall

# download linux packages
sudo apt-get install gcc g++ curl tmux opam m4

# install Rust
curl --proto 'https' tlsv1.2 sSf https://sh.rustup.rs | sh

# install Ocaml
opam init
opam install -y async core js_of_ocaml js_of_ocaml-ppx merlin utop ocp-indent
