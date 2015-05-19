#!/bin/bash
ln -s `pwd`/vimrc ~/.vimrc
git submodule update --init --recursive
