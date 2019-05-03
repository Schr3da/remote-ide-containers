#!/bin/bash

source /home/default/.bashrc

npm install -g typescript
npm install -g yarn

#Rust stable dependencies
rustup component add rls rust-analysis rust-src
rustup component add rust-src
rustup target add wasm32-unknown-unknown

#Rust nightly dependencies
rustup default nightly
rustup component add rls rust-analysis rust-src
rustup component add rust-src
rustup target add wasm32-unknown-unknown

#Additional tools for Rust
cargo install wasm-pack
cargo install cargo-watch
cargo install racer

#Golang dependencies
go get -u github.com/sourcegraph/go-langserver
go get -u golang.org/x/tools/cmd/gopls

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
