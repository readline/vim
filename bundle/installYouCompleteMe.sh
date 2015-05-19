#!/bin/bash
git submodule git@github.com:Valloric/YouCompleteMe.git
cd YouCompleteMe/
git submodule update --init --recursive
./install.sh

