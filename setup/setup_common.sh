#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo yum install -y git
sudo yum install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

# Install vim
sudo apt-get install vim
git clone https://github.com/sharkqwy/novim.git
mv ~/novim ~/.vim
ln -sb ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
cd ~

# Init from dot files
ln -sb dev_setup/dotfiles/.bash_profile ~
ln -sb dev_setup/dotfiles/.bashrc ~
ln -sb dev_setup/dotfiles/.bashrc_custom ~
ln -sb dev_setup/dotfiles/.gitconfig ~
ln -sb dev_setup/dotfiles/.jshintrc ~
ln -sb dev_setup/dotfiles/.tmux.conf ~
