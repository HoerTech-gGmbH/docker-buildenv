FROM ubuntu:14.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev dpkg-dev \
                       zip libx11-dev x11proto-video-dev libxv-dev \
                       libcwiid-dev ruby libboost1.55-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system1.55-dev netcat \
                       software-properties-common java-common wget && \
    add-apt-repository -y ppa:octave/stable && \
    apt-get update && \
    wget \
      https://cdn.azul.com/zulu/bin/zulu8.31.0.1-jdk8.0.181-linux_amd64.deb && \
    dpkg -i zulu8.31.0.1-jdk8.0.181-linux_amd64.deb /*.deb && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install octave-signal && \
    rm /*.deb && \
    mkdir -p /etc/mha
