FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git swig liboctave-dev wget gnupg1 lsb-release && \
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
    echo 'deb http://apt.hoertech.de bionic universe' \
          >>/etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install mhamakedeb && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins" && \
    useradd -ms /bin/bash --uid=19453 u
USER u
