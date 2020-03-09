FROM nginx:stable-alpine

RUN apk update \
        && apk upgrade \
        && apk add --no-cache openssl openssh curl wget bind-tools iputils busybox-extras nmap && \
        rm -rf /var/cache/apk/*
