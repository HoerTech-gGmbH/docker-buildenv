FROM ubuntu:22.04

# Install build dependencies from standard Ubuntu apt repository.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential libsndfile1-dev \
                       jackd2 portaudio19-dev default-jre-headless \
                       libjack-jackd2-dev dpkg-dev lsb-release wget \
                       liblo-dev libltc-dev libasound2-dev \
                       libgtkmm-3.0-dev libcairomm-1.0-dev \
                       libfftw3-dev libfftw3-single3 libfftw3-double3 \
                       libcurl4-openssl-dev libwebkit2gtk-4.0-dev \
                       libgtksourceviewmm-3.0-dev imagemagick libmatio-dev \
                       texlive-latex-recommended vim-common \
                       texlive-latex-extra doxygen \
                       texlive-font-utils graphviz texlive-fonts-recommended \
                       libopencv-dev rsync libboost-all-dev libeigen3-dev \
                       gnupg1 libgsl-dev libsamplerate0-dev \
                       nlohmann-json3-dev libsoundio-dev libxerces-c-dev libcunit1-dev \
                       cmake && \
\
# Retrieve the signing key for the hoertech apt repositories
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
\
# Add main hoertech apt repository to the package manager of this image
    echo 'deb https://apt.hoertech.de jammy universe' \
          >>/etc/apt/sources.list && \
\
# Install non-standard build dependencies from our apt repository.
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install liblsl mhamakedeb && \
\
# Create non-root user who should execute the build.
    useradd -ms /bin/bash --uid=19453 u
USER u
