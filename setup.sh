#!/bin/bash

############################### SETUP FUNCTIONS ################################

function installVim () {
  [ ! -d "~/.vim/colors" ] && mkdir -p ~/.vim/colors
  [ ! -d "~/.vim/bundle" ] && mkdir -p ~/.vim/bundle
  [ ! -d "~/.vim_backup" ] && mkdir -p ~/.vim_backup

  cd ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
  cd ~

  [ -d ~/.bashrc ] && rm ~/.bashrc
  ln -s ~/dotfiles/.bashrc ~/.bashrc
  [ -d ~/.vimrc ] && rm ~/.vimrc
  ln -s ~/dotfiles/.vimrc ~/.vimrc
  ln -s ~/dotfiles/zenburn.vim ~/.vim/colors/zenburn.vim

  vim +PluginInstall +qall
}

function installPackages () {
  sudo apt-get update
  sudo apt-get install gcc g++ curl tmux opam m4 gnome-tweaks

  git clone https://www.github.com/junegunn/fzf.git ~/fzf
  cd ~/fzf && ./install
  cd ~ && rm -R .fzf
}

function installRust () {
  curl --proto 'https' tlsv1.2 sSf https://sh.rustup.rs | sh
}

function installOcaml () {
  opam init
  opam install -y async core js_of_ocaml js_of_ocaml-ppx merlin utop ocp-indent
}

function installPython () {
  sudo apt-get install python3 python3-pip
}

################################ GET RUN FLAGS #################################

read -p "Symlink dotfiles? (y/N) " FLAG_INSTALL_VIM 
read -p "Install dev linux packages? (y/N) " FLAG_INSTALL_PACKAGES
read -p "Install Rust? (y/N) " FLAG_INSTALL_RUST
read -p "Install Ocaml? (y/N) " FLAG_INSTALL_OCAML
read -p "Install Python/Pip? (y/N) " FLAG_INSTALL_PYTHON

################################# RUN INSTALL ##################################

if [[ "$FLAG_INSTALL_VIM" =~ [yY]{1} ]] then installVim fi
if [[ "$FLAG_INSTALL_PACKAGES" =~ [yY]{1} ]] then installPackages fi
if [[ "$FLAG_INSTALL_RUST" =~ [yY]{1} ]] then installRust fi
if [[ "$FLAG_INSTALL_OCAML" =~ [yY]{1} ]] then installOcaml fi
if [[ "$FLAG_INSTALL_PYTHON" =~ [yY]{1} ]] then installPython fi