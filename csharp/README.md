# Quick start

The folder contains a docker definition and several configuration files.
This container contains a dev environment for the programming language Golang using vim.
vim uses additional plugins which can be found in the init.vim file to enable a IDE like experience.

- C# (dotnet core)

## Instructions

Please note that a Linux distribution (Ubuntu) is used. Depending on your
operating system the commands might differ.

1. Get Docker for your operating system

```
    sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

2. Change to the repository directory

```
    cd /Path/to/repository/golang
```

```
    cd /home/default/downloads/dev-env-dockerized/golang/
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

6. Start vim

```
    vim .
```

7. Install vim plugins

```
    :PlugInstall
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
