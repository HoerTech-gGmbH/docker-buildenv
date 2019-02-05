FROM ubuntu:14.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential \
                       ruby-dev java-common libasound2-dev \
                       dpkg-dev lsb-release libgtkmm-3.0-dev \
                       software-properties-common wget \
                       rsync && \
    apt-get update && \
    wget \
      https://cdn.azul.com/zulu/bin/zulu8.31.0.1-jdk8.0.181-linux_amd64.deb && \
    dpkg -i zulu8.31.0.1-jdk8.0.181-linux_amd64.deb /*.deb && \
    rm /*.deb && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
RUN wget http://www.cmake.org/files/v3.10/cmake-3.10.1.tar.gz
RUN tar -xzf cmake-3.10.1.tar.gz && cd cmake-3.10.1 && ./configure && make && make install
