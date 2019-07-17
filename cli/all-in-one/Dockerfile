FROM ubuntu:bionic

ENV TERM=xterm\
    TZ=Europe/Berlin\
    DEBIAN_FRONTEND=noninteractive

RUN bash

RUN apt-get update --fix-missing

RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential
RUN apt-get install -y pkg-config
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y xz-utils
RUN apt-get install -y apt-transport-https
RUN apt-get install -y libssl-dev
RUN apt-get install -y openssl
RUN apt-get install -y tzdata
RUN apt-get install -y python3-pip
RUN apt-get install -y python-dev python-pip python3-dev python3-pip

RUN add-apt-repository ppa:neovim-ppa/stable
RUN add-apt-repository ppa:x4121/ripgrep

RUN apt-get update
RUN apt-get install -y ripgrep
RUN apt-get install -y neovim

#tensorflow
RUN pip install --no-cache-dir tensorflow==2.0.0-alpha0 

#mono
RUN apt-get install -y gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN apt-get install -y mono-devel

#dotnet core
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update -y
RUN apt-get install -y dotnet-sdk-2.2
RUN apt-get install -y libuv1-dev

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

#add group
RUN addgroup --gid 1024 dev-group

#add user
RUN useradd --gid 1024 -ms /bin/bash default

#mv config files
ADD . /home/default/Config
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

#rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

CMD ["bash"]
