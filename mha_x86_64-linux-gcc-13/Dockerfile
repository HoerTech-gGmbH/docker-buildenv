# Create docker image with MHA build environment for Ubuntu 22.04
FROM ubuntu:24.04

# Install build dependencies from standard Ubuntu apt repository.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev octave-signal \
                       zip libx11-dev x11proto-video-dev libxv-dev libeigen3-dev \
                       ruby-dev libboost-dev \
                       libboost-system-dev netcat-openbsd wget \
                       dpkg-dev lsb-release arcanist php-xml gnupg1 cmake && \
# Retrieve the signing key for the hoertech apt repositories
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
\
# Add main hoertech apt repository to the package manager of this image
    echo 'deb [arch=amd64] https://apt.hoertech.de noble universe' \
          >>/etc/apt/sources.list && \
# Install non-standard build dependencies from our apt repository.
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install liblsl mhamakedeb && \
# Add libtorch development package. libtorch is not yet available in the ubuntu
# 24.04 package archives. Download the packages from the launchpad librarian
# instead and install them manually.
    wget http://launchpadlibrarian.net/687188629/libtorch-dev_2.0.1+dfsg-4_amd64.deb && \
    wget http://launchpadlibrarian.net/687188642/libtorch2.0_2.0.1+dfsg-4_amd64.deb && \
    wget http://launchpadlibrarian.net/678977482/libdnnl2_2.7.4-1ubuntu1_amd64.deb && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
        ./libtorch2.0_2.0.1+dfsg-4_amd64.deb ./libtorch-dev_2.0.1+dfsg-4_amd64.deb \
        ./libdnnl2_2.7.4-1ubuntu1_amd64.deb && \
    rm -f libtorch2.0_2.0.1+dfsg-4_amd64.deb libtorch-dev_2.0.1+dfsg-4_amd64.deb \
          libdnnl2_2.7.4-1ubuntu1_amd64.deb && \
# Remove GNU autotools, they may get in the way when compiling FFTW
    apt-get -y purge autoconf automake autotools-dev libtool && \
# Create non-root user who should execute the build.
    useradd -ms /bin/bash --uid=19453 u
USER u
