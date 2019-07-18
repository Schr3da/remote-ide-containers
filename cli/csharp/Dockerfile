FROM ubuntu:bionic

ENV TERM=xterm\
    TZ=Europe/Berlin\
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update --fix-missing
RUN apt-get upgrade -y

RUN bash
RUN apt-get update --fix-missing

RUN apt-get install -y build-essential
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y xz-utils
RUN apt-get install -y apt-transport-https
RUN apt-get install -y libssl-dev
RUN apt-get install -y openssl
RUN apt-get install -y tzdata
RUN apt-get install -y python3-pip

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

#nvim
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y neovim
RUN pip3 install --user pynvim
RUN pip3 install --user --upgrade pynvim

#fzf
RUN add-apt-repository ppa:x4121/ripgrep
RUN apt-get update
RUN apt-get install -y ripgrep

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

RUN add-apt-repository ppa:x4121/ripgrep
RUN apt-get update
RUN apt-get install -y ripgrep

#add group
RUN addgroup --gid 1024 dev-group

#csharp user
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

#node
RUN wget https://nodejs.org/dist/v11.12.0/node-v11.12.0-linux-x64.tar.xz
RUN chmod a+x ./node-v11.12.0-linux-x64.tar.xz
RUN unxz ./node-v11.12.0-linux-x64.tar.xz
RUN tar -xf ./node-v11.12.0-linux-x64.tar
RUN mv ./node-v11.12.0-linux-x64 /home/default/Applications/node
RUN chown default /home/default/Applications/node
RUN chmod u+x+w /home/default/Applications/node/*
RUN rm -rf ./node-v11.12.0-linux-x64.tar

CMD ["bash"]
