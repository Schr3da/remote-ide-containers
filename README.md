# Quick start

The repository contains a docker definition, several configuration and script files.
Following runtimes and programming languages are supported:

- Rust
- Golang
- Typescript
- C#

- Dotnet core
- Node 

## Instructions

Please note that a Linux distribution (Ubuntu) is used. Depending on your
operating system the commands might differ.

1. Get Docker for your operating system 

```
    sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
```

2. Change to the repository directory

```
    cd /Path/to/repository/
```

```
    cd /home/default/downloads/dev-env-dockerized/
```

3. Build the docker image

```
    sudo docker build .
```

4. Run the docker container

```
    sudo docker run -e USER=default -it IMAGE_NAME
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
