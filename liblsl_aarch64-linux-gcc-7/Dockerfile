# The cmake contained in 18.04 is too old to compile liblsl, build from source:
FROM ubuntu:18.04 AS buildcmake
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
    apt-get -y install build-essential wget libssl-dev && \
    wget https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0.tar.gz && \
    tar xf cmake-3.17.0.tar.gz && \
    cd cmake-3.17.0 && ./configure && make -j 4 install && cd .. && \
    rm -rf cmake-* && rm -rvf /usr/local/doc && rm -rvf /usr/local/man

# Create build environment suitable for compiling liblsl
FROM ubuntu:18.04
COPY --from=buildcmake /usr/local /usr/local
RUN test -e /usr/local/bin/cmake && \
    sed -i -e "s,http://ports.ubuntu.com,https://mirrors.ocf.berkeley.edu,"    \
        /etc/apt/sources.list                                               && \
    echo 'Acquire::https::Verify-Peer "false";' >/etc/apt/apt.conf.d/no-ssl && \
    echo 'Acquire::https::Verify-Host "false";'>>/etc/apt/apt.conf.d/no-ssl && \
    \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make dpkg-dev lsb-release
