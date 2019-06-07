FROM ubuntu:18.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev \
                       libx11-dev x11proto-video-dev libxv-dev \
                       libcwiid-dev ruby-dev libboost-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system-dev \
                       dpkg-dev lsb-release && \
    dpkg -i /*.deb && \
    rm /*.deb && \
    mkdir -p /etc/mha && \
    apt-get -y purge autoconf automake autotools-dev libtool && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
COPY mhacross_x86_64-linux-gcc-7.tar.gz /
RUN \
    tar xf /mhacross_x86_64-linux-gcc-7.tar.gz -C / --keep-old-files || true; \
    rm /mhacross_x86_64-linux-gcc-7.tar.gz && \
    rm /usr/bin/g++-7 /usr/bin/g++ /usr/bin/gcc-7 /usr/bin/gcc /usr/bin/cpp && \
    ln -s /usr/bin/arm-linux-gnueabihf-g++-7 /usr/bin/g++-7 && \
    ln -s /usr/bin/arm-linux-gnueabihf-g++ /usr/bin/g++ && \
    ln -s /usr/bin/arm-linux-gnueabihf-gcc-7 /usr/bin/gcc-7 && \
    ln -s /usr/bin/arm-linux-gnueabihf-gcc /usr/bin/gcc && \
    ln -s /usr/bin/arm-linux-gnueabihf-cpp /usr/bin/cpp
