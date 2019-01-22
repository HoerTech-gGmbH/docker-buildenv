FROM ubuntu:14.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev java-common \
                       zip libx11-dev x11proto-video-dev libxv-dev \
                       libcwiid-dev ruby-dev libboost1.55-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system1.55-dev netcat \
                       dpkg-dev lsb-release software-properties-common wget libxml++2.6-dev \
		       liblo-dev libltc-dev libasound2-dev libjack-jackd2-dev \
		       libgtkmm-3.0-dev libcairomm-1.0-dev libsndfile1-dev \
		       libfftw3-dev libfftw3-single3 libfftw3-double3 \
		       libcurl4-openssl-dev libwebkit2gtk-4.0 \
		       libgtksourceviewmm-3.0-dev imagemagick && \
    add-apt-repository -y ppa:octave/stable && \
    apt-get update && \
    wget \
      https://cdn.azul.com/zulu/bin/zulu8.31.0.1-jdk8.0.181-linux_amd64.deb && \
    dpkg -i zulu8.31.0.1-jdk8.0.181-linux_amd64.deb /*.deb && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install octave-signal && \
    rm /*.deb && \
    mkdir -p /etc/mha && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
