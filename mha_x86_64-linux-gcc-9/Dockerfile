FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev openjdk-8-jdk-headless \
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
    useradd -ms /bin/bash --uid=19453 u
# octave + java11 gives errors, java8 works with symlinks to find libjvm.so
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install --no-install-recommends octave-signal gettext-base && \
    ln -s java-8-openjdk-amd64/ /usr/lib/jvm/default-java && \
    ln -s ../jre/lib/amd64/server/ /usr/lib/jvm/java-8-openjdk-amd64/lib/server
USER u
