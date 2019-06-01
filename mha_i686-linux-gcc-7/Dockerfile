FROM i386/ubuntu:18.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev octave-signal liblo-dev default-jre-headless \
                       zip libx11-dev x11proto-video-dev libxv-dev \
                       libcwiid-dev ruby-dev libboost-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system-dev netcat \
                       dpkg-dev lsb-release arcanist php-xml gnupg1 && \
    apt-key adv --keyserver keyserver.ubuntu.com \
                --recv-keys B7D6CDF547DA4ABD && \
    echo 'deb http://apt.hoertech.de bionic universe' \
          >>/etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install mhamakedeb && \
    mkdir -p /etc/mha && \
    apt-get -y purge autoconf automake autotools-dev libtool && \
    mv /bin/uname /bin/uname.orig && \
    echo '#!/bin/sh\n/usr/bin/linux32 /bin/uname.orig "$@"' > /bin/uname && \
    chmod +x /bin/uname && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins" && \
    useradd -ms /bin/bash --uid=19453 u
USER u
