FROM ubuntu:18.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev octave-signal liblo-dev default-jdk \
                       zip libx11-dev x11proto-video-dev libxv-dev \
                       libcwiid-dev ruby-dev libboost-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system-dev netcat \
                       dpkg-dev lsb-release arcanist php-xml && \
    dpkg -i /*.deb && \
    rm /*.deb && \
    mkdir -p /etc/mha && \
    apt-get -y purge autoconf automake autotools-dev libtool && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins" && \
    useradd -ms /bin/bash --uid=19453 u
USER u

