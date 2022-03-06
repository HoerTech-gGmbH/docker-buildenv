# Create build environment suitable for compiling liblsl
FROM debian:bullseye
RUN sed -i -e "s/http:/https:/" /etc/apt/sources.list                       && \
    echo 'Acquire::https::Verify-Peer "false";' >/etc/apt/apt.conf.d/no-ssl && \
    echo 'Acquire::https::Verify-Host "false";'>>/etc/apt/apt.conf.d/no-ssl && \
    \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make dpkg-dev lsb-release cmake
