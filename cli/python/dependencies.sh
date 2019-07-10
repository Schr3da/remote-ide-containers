#!/bin/bash

source /home/default/.bashrc

npm install -g typescript
npm install -g yarn

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
