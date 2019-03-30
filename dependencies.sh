#!/bin/bash

source /home/default/.bashrc

npm install -g typescript

rustup component add rls rust-analysis rust-src
rustup default nightly
rustup component add rls rust-analysis rust-src
cargo install cargo-watch
cargo install racer

curl -fLo /home/default/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
