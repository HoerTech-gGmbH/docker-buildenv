FROM ubuntu:18.04
# This docker image is built behind a sometimes broken firewall which
# sometimes blocks http traffic.  This has happened often enough to
# change apt installation to https.  Change ports.ubuntu.com to
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
    apt-get -y install gnupg1 wget && \
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
    echo 'deb https://apt.hoertech.de bionic universe' \
          >>/etc/apt/sources.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install liblsl mhamakedeb git g++ make libsndfile1-dev \
                       jackd2 portaudio19-dev libjack-jackd2-dev octave-signal \
                       liblo-dev default-jre-headless zip libx11-dev \
                       x11proto-video-dev libxv-dev libeigen3-dev libcwiid-dev \
                       ruby-dev libboost-dev libgtkmm-3.0-dev libfreenect-dev \
                       swig libboost-system-dev netcat dpkg-dev lsb-release \
                       arcanist php-xml ccache cmake && \
    mkdir -p /etc/mha && \
    apt-get -y purge autoconf automake autotools-dev libtool && \
    useradd -ms /bin/bash --uid=19453 u
USER u
