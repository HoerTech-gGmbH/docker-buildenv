FROM ubuntu:16.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential \
                       ruby-dev default-jre \
                       dpkg-dev lsb-release \
                       software-properties-common wget \
		       rsync && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
RUN wget http://www.cmake.org/files/v3.10/cmake-3.10.1.tar.gz
RUN tar -xzf cmake-3.10.1.tar.gz && cd cmake-3.10.1 && ./configure && make && make install
