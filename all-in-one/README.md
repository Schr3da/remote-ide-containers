# Quick start

The repository contains a docker definition, several configuration and script files.
Following runtimes and programming languages are supported:

- Rust
- Golang
- Typescript
- Node

## Instructions

Please note that a Linux distribution (Ubuntu) is used. Depending on your
operating system the commands might differ.

1. Get Docker for your operating system

```
    sudo apt-get update
    
    sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    
    sudo apt-key fingerprint 0EBFCD88
    
    sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
    
    sudo apt-get update
    
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    
```

2. Change to the all-in-one folder located in the repository directory

```
    cd /Path/to/repository/all-in-one
```

```
    cd /home/default/downloads/dev-env-dockerized/
```

3. Build the docker image

```
    sudo docker build .
```

4. Run the docker container

4.1 Without shared folder

```
    sudo docker run -e USER=default -it IMAGE_NAME
```

4.2 With shared folder

Modify the shared folder ownership and permission

```
    chown :1024 /PATH_TO/FOLDER
    chmod 775 /PATH_TO/FOLDER
    chmod g+s /PATH_TO/FOLDER
```

Modify the docker file and add the group

```
    RUN addgroup --gid 1024 dev-group
    RUN adduser --ingroup 1024 dev-group
```

Run the docker container

```
    sudo docker run -e USER=default -v /PATH_TO/FOLDER:/home/default/FOLDER -it IMAGE_NAME
```

5. Install the required dependencies

```
    /home/default/Config/dependencies.sh
```

6. Start nvim (neovim)

```
    nvim .
```

7. Install nvim plugins

```
    :PlugInstall
```

8. Install Conquer of Completion plugins

```
    :CocInstall coc-rls
    :CocInstall coc-tsserver
    :CocInstall coc-json
    :CocInstall coc-gocode
```

## Start/Attach & Exit a container

Once you have successfully started a container following the instrution section. You can anytime exit the container by entering

```
    exit
```

To start again the container where you have left it use the following command

```
    sudo docker start CONTAINER ID && sudo docker attach CONTAINER ID
```
