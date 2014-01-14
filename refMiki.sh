#!/bin/sh
mikihome=/home/miki
ln -s $mikihome/.hgrc $HOME/.hgrc
ln -s $mikihome/.gitconfig $HOME/.gitconfig
ln -s $mikihome/.zshrc $HOME/.zshrc
ln -s $mikihome/.vimrc $HOME/.vimrc
ln -s $mikihome/.vim $HOME/.vim
ln -s $mikihome/.oh-my-zsh $HOME/.oh-my-zsh
ln -s $mikihome/hg-prompt $HOME/hg-prompt
ln -s $mikihome/mercurial-cli-templates $HOME/mercurial-cli-templates
chsh -s `which zsh`
