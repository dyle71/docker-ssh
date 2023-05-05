# docker-ssh

Create a small SSH only docker instance based on Alpine Linux. The sshd only 
accepts public keys.

This is a small container to do a port-forwarding behind a reverse proxy.

## Create container

Copy the `authorized_keys` file into the current Docker build folder.

```bash
cp $HOME/.ssh/id_rsa.pub authorized_keys
```

Define the user to create and the path to the authorized_keys file when
building the container image:

```bash
docker build --tag docker-sshd --build-arg USER=${USER} --build-arg AUTHORIZED_KEYS=authorized_keys .
```

## Run container

Run the container with

```bash
docker run --name docker-sshd -p 2222:22 -p 2280:80 -p 2643:443 docker-sshd:latest 
```

This will then listen on ports 2222, 2280 and 2643.

## Notable guidelines

* How (not) to write git commit messages: https://www.codelord.net/2015/03/16/bad-commit-messages-hall-of-shame/
* How to version your software: https://semver.org/
* How to write a clever "Changes" file: https://keepachangelog.com/en/1.0.0/
* Folder Convention: https://github.com/KriaSoft/Folder-Structure-Conventions

---  

(C) Copyright 2023  
headcode.space e.U., https://www.headcode.space
