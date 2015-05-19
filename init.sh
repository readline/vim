#!/bin/bash
ln -s `pwd`/vimrc ~/.vimrc
git submodule update --init --recursive

echo "# colorscheme" >> ~/.bashrc
echo "export TERM=xterm-256color" >> ~/.bashrc
