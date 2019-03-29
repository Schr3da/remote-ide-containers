FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y screen
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y xz-utils
RUN apt-get install -y apt-transport-https

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update -y
RUN apt-get install -y dotnet-sdk-2.2
RUN apt-get install -y libuv1-dev


RUN useradd -ms /bin/bash default

ADD . /home/default/Config
ADD vimrc /home/default/.vimrc
ADD bashrc /home/default/.bashrc
ADD profile /home/default/.profile

RUN chown default /home/default/.vimrc
RUN chmod a+x /home/default/.vimrc

RUN chown default /home/default/.profile
RUN chmod a+x /home/default/.profile

RUN chown default /home/default/.bashrc
RUN chmod a+x /home/default/.bashrc

USER default
WORKDIR /home/default

RUN mkdir /home/default/Applications
RUN mkdir /home/default/.go-packages

#download node and unpack
RUN wget https://nodejs.org/dist/v11.12.0/node-v11.12.0-linux-x64.tar.xz
RUN chmod a+x ./node-v11.12.0-linux-x64.tar.xz
RUN unxz ./node-v11.12.0-linux-x64.tar.xz
RUN tar -xf ./node-v11.12.0-linux-x64.tar

#move node to default user
RUN mv ./node-v11.12.0-linux-x64 /home/default/Applications/node
RUN chown default /home/default/Applications/node
RUN chmod u+x+w /home/default/Applications/node/*
RUN rm -rf ./node-v11.12.0-linux-x64.tar

#download golang and unpack
RUN wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
RUN chmod a+x ./go1.12.1.linux-amd64.tar.gz
RUN tar xvzf ./go1.12.1.linux-amd64.tar.gz

#move golang to default user
RUN mv ./go /home/default/Applications/go
RUN chown default /home/default/Applications/go
RUN chmod u+x+w /home/default/Applications/go/*
RUN rm -rf ./go1.12.1.linux-amd64.tar.gz

RUN curl -fLo /home/default/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#RUN vim +'PlugInstall --sync' +qa

CMD ["bash"]
