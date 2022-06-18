#!/bin/bash

# create folders
[ ! -d "~/.vim/colors" ] && mkdir -p ~/.vim/colors
[ ! -d "~/.vim/bundle" ] && mkdir -p ~/.vim/bundle
[ ! -d "~/.vim_backup" ] && mkdir -p ~/.vim_backup

# download vundle
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
cd ~

# generate symlinks
[ -d ~/.bashrc ] && rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
[ -d ~/.vimrc ] && rm ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/zenburn.vim ~/.vim/colors/zenburn.vim

# install vim plugins
vim +PluginInstall +qall

# download linux packages
sudo apt-get update
sudo apt-get install gcc g++ curl tmux opam m4

# install fzf
git clone https://www.github.com/junegunn/fzf.git ~/fzf
cd ~/fzf && ./install
cd ~ && rm -R .fzf

# install Rust
curl --proto 'https' tlsv1.2 sSf https://sh.rustup.rs | sh

# install Ocaml
opam init
opam install -y async core js_of_ocaml js_of_ocaml-ppx merlin utop ocp-indent

# setup Python
sudo apt-get install python3 python3-pip
