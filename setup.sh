#!/bin/bash

############################### SETUP FUNCTIONS ################################

function installVim () {
  [ ! -d "$HOME/.vim/colors" ] && mkdir -p ~/.vim/colors
  [ ! -d "$HOME/.vim/bundle" ] && mkdir -p ~/.vim/bundle
  [ ! -d "$HOME/.vim_backup" ] && mkdir -p ~/.vim_backup

  cd ~/.vim/bundle || return
  git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
  cd ~ || return

  [ -d ~/.bashrc ] && rm ~/.bashrc
  ln -s ~/dotfiles/.bashrc ~/.bashrc
  [ -d ~/.vimrc ] && rm ~/.vimrc
  ln -s ~/dotfiles/.vimrc ~/.vimrc
  ln -s ~/dotfiles/zenburn.vim ~/.vim/colors/zenburn.vim

  vim +PluginInstall +qall
}

function installPackages () {
  sudo apt-get update
  sudo apt-get install gcc g++ curl tmux opam m4 gnome-tweaks ranger

  git clone https://www.github.com/junegunn/fzf.git ~/fzf
  cd ~/fzf && ./install
  cd ~ && rm -R .fzf
}

function installRust () {
  curl --proto 'https' tlsv1.2 sSf https://sh.rustup.rs | sh
}

function installRustApps () {
  cargo install alacritty csvlens
}

function installOcaml () {
  opam init
  opam install -y async core js_of_ocaml js_of_ocaml-ppx merlin utop ocp-indent
}

function installPython () {
  sudo apt-get install python3 python3-pip
}

################################ GET RUN FLAGS #################################

read -pr "Symlink dotfiles? (y/N) " FLAG_INSTALL_VIM 
read -pr "Install dev linux packages? (y/N) " FLAG_INSTALL_PACKAGES
read -pr "Install Rust? (y/N) " FLAG_INSTALL_RUST
read -pr "Install Rust applications? (y/N) " FLAG_INSTALL_RUST_APPS
read -pr "Install Ocaml? (y/N) " FLAG_INSTALL_OCAML
read -pr "Install Python/Pip? (y/N) " FLAG_INSTALL_PYTHON

################################# RUN INSTALL ##################################

if [[ "$FLAG_INSTALL_VIM" =~ [yY]{1} ]] 
then installVim 
fi

if [[ "$FLAG_INSTALL_PACKAGES" =~ [yY]{1} ]] 
then installPackages 
fi

if [[ "$FLAG_INSTALL_RUST" =~ [yY]{1} ]] 
then installRust 
fi

if [[ "$FLAG_INSTALL_RUST_APPS" =~ [yY]{1} ]] 
then installRustApps 
fi

if [[ "$FLAG_INSTALL_OCAML" =~ [yY]{1} ]] 
then installOcaml 
fi

if [[ "$FLAG_INSTALL_PYTHON" =~ [yY]{1} ]] 
then installPython
fi