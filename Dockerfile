FROM alpine:3.2

MAINTAINER Fabio Napoleoni <f.napoleoni@gmail.com>

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    apk add --update bash alpine-sdk 

# SDK installed, now do other stuff

RUN apk add nano

# See http://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package

# Add a sudo enabled user for dev. Password is dev
RUN echo -e "dev\ndev" | adduser fabn -s /bin/bash
RUN echo -e "\n# Developer user\nfabn ALL=(ALL) ALL" >> /etc/sudoers
RUN addgroup fabn abuild
RUN echo 'PACKAGER="Fabio Napoleoni <f.napoleoni@gmail.com>"' >> /etc/abuild.conf

WORKDIR /home/fabn/google-authenticator
USER fabn

# Create a private key used to sign packages
RUN abuild-keygen -an

CMD bash