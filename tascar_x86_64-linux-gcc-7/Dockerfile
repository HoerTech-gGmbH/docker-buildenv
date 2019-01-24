FROM ubuntu:18.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential libsndfile1-dev \
                       ruby-dev jackd2 portaudio19-dev default-jre \
                       libjack-jackd2-dev dpkg-dev lsb-release \
                       software-properties-common wget libxml++2.6-dev \
                       liblo-dev libltc-dev libasound2-dev libjack-jackd2-dev \
                       libgtkmm-3.0-dev libcairomm-1.0-dev libsndfile1-dev \
                       libfftw3-dev libfftw3-single3 libfftw3-double3 \
                       libcurl4-openssl-dev libwebkit2gtk-4.0-dev \
                       libgtksourceviewmm-3.0-dev imagemagick libmatio-dev \
                       texlive-latex-recommended vim-common \
                       texlive-latex-extra doxygen \
                       texlive-font-utils graphviz texlive-fonts-recommended \
                       libopencv-calib3d-dev libopencv-objdetect-dev && \
    dpkg -i /*.deb && \
    rm /*.deb && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
