FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y screen
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y xz-utils
RUN apt-get install -y apt-transport-https
RUN apt-get install -y python-dev python-pip python3-dev python3-pip
RUN apt-get install -y neovim

#add group
RUN addgroup --gid 1024 dev-group

#default user
RUN useradd -ms /bin/bash default -G dev-group

#mv config files
ADD . /home/default/Config
ADD vimrc /home/default/.vimrc
ADD init.vim /home/default/.config/nvim/init.vim
ADD bashrc /home/default/.bashrc
ADD profile /home/default/.profile

#permissions
RUN chown -R default /home/default/.config
RUN chown default /home/default/.config/nvim
RUN chmod a+x /home/default/.config/nvim

RUN chown default /home/default/.config/nvim/init.vim
RUN chmod a+x /home/default/.config/nvim/init.vim

RUN chown default /home/default/.profile
RUN chmod a+x /home/default/.profile

RUN chown default /home/default/.bashrc
RUN chmod a+x /home/default/.bashrc

USER default
WORKDIR /home/default

RUN mkdir /home/default/Applications
RUN mkdir /home/default/.go-packages

#rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

#node
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

EXPOSE 80 8080 8888

CMD ["bash"]
