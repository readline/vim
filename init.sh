#!/bin/bash
rm -rf ~/.vimrc ~/.vim
mv `pwd` ~/.vim
cd ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
git submodule update --init --recursive

