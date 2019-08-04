FROM ubuntu:bionic

ENV TERM=xterm\
    TZ=Europe/Berlin\
    DEBIAN_FRONTEND=noninteractive

RUN bash
RUN apt-get update --fix-missing
RUN apt-get install -y software-properties-common
RUN apt-get upgrade -y

RUN apt-get install -y lldb
RUN apt-get install -y clang
RUN apt-get install -y build-essential
RUN apt-get install -y pkg-config
RUN apt-get install -y xz-utils
RUN apt-get install -y apt-transport-https
RUN apt-get install -y libssl-dev
RUN apt-get install -y openssl
RUN apt-get install -y tzdata
RUN apt-get install -y python3-pip
RUN apt-get install -y net-tools htop wget curl git

#mono
RUN apt-get install -y gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update -y
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

#golang user
RUN useradd --gid 1024 -ms /bin/bash default

#mv config files
ADD . /home/default/Config

ADD bashrc /home/default/.bashrc
ADD profile /home/default/.profile

#permissions
RUN chown default /home/default/.profile
RUN chmod a+x /home/default/.profile

RUN chown default /home/default/.bashrc
RUN chmod a+x /home/default/.bashrc

USER default
WORKDIR /home/default

RUN mkdir /home/default/Applications
RUN mkdir /home/default/.go-packages

#code-server
RUN wget -q https://github.com/cdr/code-server/releases/download/1.1156-vsc1.33.1/code-server1.1156-vsc1.33.1-linux-x64.tar.gz
RUN tar xvzf ./code-server1.1156-vsc1.33.1-linux-x64.tar.gz
RUN mv ./code-server1.1156-vsc1.33.1-linux-x64 /home/default/Applications/code-server
RUN chown default /home/default/Applications/code-server
RUN chmod u+x+w /home/default/Applications/code-server/*
RUN rm -rf ./code-server1.1156-vsc1.33.1-linux-x64.tar.gz

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
