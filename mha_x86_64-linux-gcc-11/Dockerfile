# Create docker image with MHA build environment for Ubuntu 22.04
FROM ubuntu:22.04

# Install build dependencies from standard Ubuntu apt repository.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev octave-signal libtorch-dev \
                       zip libx11-dev x11proto-video-dev libxv-dev libeigen3-dev \
                       libcwiid-dev ruby-dev libboost-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system-dev netcat wget \
                       dpkg-dev lsb-release arcanist php-xml gnupg1 cmake && \
# Retrieve the signing key for the hoertech apt repositories
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
\
# Add main hoertech apt repository to the package manager of this image
    echo 'deb [arch=amd64] https://apt.hoertech.de jammy universe' \
          >>/etc/apt/sources.list && \
# Install non-standard build dependencies from our apt repository.
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install liblsl mhamakedeb && \
# Remove GNU autotools, they may get in the way when compiling FFTW
    apt-get -y purge autoconf automake autotools-dev libtool && \
# Create non-root user who should execute the build.
    useradd -ms /bin/bash --uid=19453 u
USER u
