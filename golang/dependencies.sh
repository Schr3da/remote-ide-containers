#!/bin/bash

source /home/default/.bashrc

npm install -g typescript
npm install -g yarn

#Golang dependencies
go get -u github.com/sourcegraph/go-langserver
go get -u golang.org/x/tools/cmd/gopls
go get -u github.com/go-delve/delve/cmd/dlv

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
