FROM ubuntu:bionic

RUN bash
RUN apt-get update

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable

RUN apt-get update
RUN apt-get install -y pkg-config
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y neovim
RUN apt-get install -y libssl-dev
RUN apt-get install -y openssl

RUN add-apt-repository ppa:x4121/ripgrep
RUN apt-get update
RUN apt-get install -y ripgrep

#add group
RUN addgroup --gid 1024 dev-group

#golang user
RUN useradd --gid 1024 -ms /bin/bash default

#mv config files
ADD . /home/default/Config
ADD init.vim /home/default/.config/nvim/init.vim
ADD coc-settings.json /home/default/.config/nvim/coc-settings.json

ADD bashrc /home/default/.bashrc
ADD profile /home/default/.profile

#permissions
RUN chown -R default /home/default/.config
RUN chown default /home/default/.config/nvim
RUN chmod a+x /home/default/.config/nvim

RUN chown default /home/default/.config/nvim/init.vim
RUN chmod a+x /home/default/.config/nvim/init.vim

RUN chown default /home/default/.config/nvim/coc-settings.json
RUN chmod a+x /home/default/.config/nvim/coc-settings.json

RUN chown default /home/default/.profile
RUN chmod a+x /home/default/.profile

RUN chown default /home/default/.bashrc
RUN chmod a+x /home/default/.bashrc

USER default
WORKDIR /home/default

RUN mkdir /home/default/Applications
RUN mkdir /home/default/.go-packages

#node (needed for nvim plugin)
RUN wget https://nodejs.org/dist/v11.12.0/node-v11.12.0-linux-x64.tar.xz
RUN chmod a+x ./node-v11.12.0-linux-x64.tar.xz
RUN unxz ./node-v11.12.0-linux-x64.tar.xz
RUN tar -xf ./node-v11.12.0-linux-x64.tar
RUN mv ./node-v11.12.0-linux-x64 /home/default/Applications/node
RUN chown default /home/default/Applications/node
RUN chmod u+x+w /home/default/Applications/node/*
RUN rm -rf ./node-v11.12.0-linux-x64.tar

#golang
RUN wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
RUN chmod a+x ./go1.12.1.linux-amd64.tar.gz
RUN tar xvzf ./go1.12.1.linux-amd64.tar.gz
RUN mv ./go /home/default/Applications/go
RUN chown default /home/default/Applications/go
RUN chmod u+x+w /home/default/Applications/go/*
RUN rm -rf ./go1.12.1.linux-amd64.tar.gz

CMD ["bash"]
