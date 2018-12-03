FROM i386/ubuntu:14.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev dpkg-dev \
                       zip libx11-dev x11proto-video-dev libxv-dev \
                       libcwiid-dev ruby libboost1.55-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system1.55-dev netcat \
                       software-properties-common wget stow && \
    add-apt-repository -y ppa:octave/stable && \
    apt-get update && \
    wget \
     https://cdn.azul.com/zulu/bin/zulu8.31.0.1-jdk8.0.181-linux_i686.tar.gz &&\
    tar xf zulu8.31.0.1-jdk8.0.181-linux_i686.tar.gz -C /usr/local/stow && \
    rm -f zulu8.31.0.1-jdk8.0.181-linux_i686.tar.gz && \
    cd /usr/local/stow && rm -rf zulu8.31.0.1-jdk8.0.181-linux_i686/man && \
    stow zulu8.31.0.1-jdk8.0.181-linux_i686 && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install octave-signal && \
    dpkg -i /*.deb && \
    rm /*.deb && \
    mkdir -p /etc/mha
RUN mv /bin/uname /bin/uname.orig && \
  echo '#!/bin/sh\n/usr/bin/linux32 /bin/uname.orig "$@"' > /bin/uname && \
  chmod +x /bin/uname
