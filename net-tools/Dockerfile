FROM alpine

RUN apk update \
        && apk upgrade \
        && apk add --no-cache openssl openssh curl wget bind-tools iputils busybox-extras nmap sftp && \
        rm -rf /var/cache/apk/*
