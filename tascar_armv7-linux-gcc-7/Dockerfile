FROM ubuntu:18.04
# This docker image is built behind a sometimes broken firewall which
# sometimes blocks http traffic.  This has happened often enough to
# try changing apt installation to https.  Change ports.ubuntu.com to
# one of the few ubuntu-ports mirrors offering https and tell apt to
# ignore the certificate because the ca-certificates package is not
# yet installed.
RUN sed -i -e "s,http://ports.ubuntu.com,https://mirrors.ocf.berkeley.edu,"    \
        /etc/apt/sources.list                                               && \
    echo 'Acquire::https::Verify-Peer "false";' >/etc/apt/apt.conf.d/no-ssl && \
    echo 'Acquire::https::Verify-Host "false";'>>/etc/apt/apt.conf.d/no-ssl && \
    \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential libsndfile1-dev \
                       ruby-dev jackd2 portaudio19-dev default-jre-headless \
                       libjack-jackd2-dev dpkg-dev lsb-release \
                       software-properties-common wget libxml++2.6-dev \
                       liblo-dev libltc-dev libasound2-dev \
                       libgtkmm-3.0-dev libcairomm-1.0-dev \
                       libfftw3-dev libfftw3-single3 libfftw3-double3 \
                       libcurl4-openssl-dev libwebkit2gtk-4.0-dev \
                       libgtksourceviewmm-3.0-dev imagemagick libmatio-dev \
                       texlive-latex-recommended vim-common \
                       texlive-latex-extra doxygen \
                       texlive-font-utils graphviz texlive-fonts-recommended \
                       libopencv-dev rsync libboost-all-dev libeigen3-dev \
                       gnupg1 libgsl-dev libsamplerate0-dev libcpprest-dev \
                       nlohmann-json-dev libsoundio-dev libxerces-c-dev \
		       cmake && \
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
    echo 'deb https://apt.hoertech.de bionic universe' \
          >>/etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install liblsl libopenmha-dev openmha mhamakedeb && \
    useradd -ms /bin/bash --uid=19453 u
USER u
