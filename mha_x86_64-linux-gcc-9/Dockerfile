FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev octave liblo-dev default-jdk \
                       zip libx11-dev x11proto-video-dev libxv-dev libeigen3-dev \
                       libcwiid-dev ruby-dev libboost-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system-dev netcat \
                       dpkg-dev lsb-release arcanist php-xml gnupg1 cmake && \
    apt-key adv --keyserver keyserver.ubuntu.com \
                --recv-keys B7D6CDF547DA4ABD && \
    true
RUN echo 'deb [arch=amd64] http://apt.hoertech.de focal universe' \
          >>/etc/apt/sources.list && \
    echo 'deb [arch=amd64] http://aptdev.hoertech.de focal universe' \
          >>/etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install lsl-liblsl mhamakedeb && \
    mkdir -p /etc/mha && \
    apt-get -y purge autoconf automake autotools-dev libtool && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins" && \
    true
# package octave-signal is not yet in ubuntu 20.04 but in debian testing
RUN echo 'deb http://ftp.de.debian.org/debian/ testing main non-free contrib' >/etc/apt/sources.list.d/debian.list && \
    apt-key adv --keyserver keyserver.ubuntu.com \
                --recv-keys 04EE7237B7D453EC && \
    apt-key adv --keyserver keyserver.ubuntu.com \
                --recv-keys 648ACFD622F3D138 && \
    apt-get update && \
    apt-get -y install octave-signal && \
    rm -f /etc/apt/sources.list.d/debian.list && \
    apt-get update && \
    useradd -ms /bin/bash --uid=19453 u
USER u
