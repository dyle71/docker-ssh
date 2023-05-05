# ------------------------------------------------------------
# Dockerfile for just running an OpenSSH server.
# ------------------------------------------------------------

FROM alpine:latest

RUN apk add openssh bash
COPY sshd_config /etc/ssh/sshd_config

ARG USER
ARG AUTHORIZED_KEYS

RUN ssh-keygen -A
RUN adduser $USER -D
RUN echo $USER:$(head -c 512 /dev/random | sha256sum | base64 | head -c 32) | chpasswd

RUN mkdir /home/$USER/.ssh
COPY $AUTHORIZED_KEYS /home/dyle/.ssh/authorized_keys
RUN chmod 700 /home/$USER/.ssh
RUN chown -R $USER: /home/$USER/.ssh

COPY run.sh /run.sh

EXPOSE 22
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/run.sh"]
