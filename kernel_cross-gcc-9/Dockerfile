# Builds an x86_64 image with a cross compiler to armv7 with enough dependencies
# to cross-compile a kernel for armv7 and package it in a debian package.

FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
    build-essential git ncurses-dev gcc-arm-linux-gnueabihf bc kmod \
    bison flex python-all-dev dh-systemd default-jre-headless gnupg1 && \
    apt-key adv --keyserver keyserver.ubuntu.com \
                --recv-keys B7D6CDF547DA4ABD && \
    echo 'deb http://apt.hoertech.de bionic universe' \
          >>/etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install mhamakedeb dpkg-dev lsb-release arcanist php-xml && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins" && \
    useradd -ms /bin/bash --uid=19453 u
USER u
