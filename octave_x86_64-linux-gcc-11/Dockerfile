FROM ubuntu:22.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git swig liboctave-dev wget gnupg1 lsb-release && \
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
    echo 'deb https://apt.hoertech.de jammy universe' \
          >>/etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install mhamakedeb && \
    useradd -ms /bin/bash --uid=19453 u
USER u
