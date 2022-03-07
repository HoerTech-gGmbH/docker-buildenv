# Create build environment suitable for compiling liblsl
FROM ubuntu:22.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make dpkg-dev lsb-release cmake libpugixml-dev \
                       python3-pip ninja-build file sudo curl
