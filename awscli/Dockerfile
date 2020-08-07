FROM amazon/aws-cli

RUN yum insatll \
        && apk upgrade \
        && apk add --no-cache openssl openssh curl wget bind-tools iputils busybox-extras nmap sftp && \
        rm -rf /var/cache/apk/*
