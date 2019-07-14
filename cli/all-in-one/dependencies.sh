#!/bin/bash

source /home/default/.bashrc

#node global modules
npm install -g typescript
npm install -g yarn
npm install -g neon-cli

#golang dependencies
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/mdempsky/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/zmb3/gogetdoc
go get -u -v golang.org/x/lint/golint
go get -u -v github.com/fatih/gomodifytags
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/cweill/gotests/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/josharian/impl
go get -u -v github.com/haya14busa/goplay/cmd/goplay
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
go get -u -v github.com/alecthomas/gometalinter
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/golangci/golangci-lint/cmd/golangci-lint
go get -u -v github.com/jstemmer/gotags
go get -u -v github.com/kisielk/errcheck
go get -u -v github.com/fatih/motion
go get -u -v github.com/klauspost/asmfmt/cmd/asmfmt
go get -u -v golang.org/x/tools/cmd/gopls
go get -u -v github.com/sourcegraph/go-langserver
go get -u -v github.com/gorilla/websocket

gometalinter --install

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
