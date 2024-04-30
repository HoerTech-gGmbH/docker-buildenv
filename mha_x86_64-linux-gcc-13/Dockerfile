# Build stage for retrieving current libtorch
FROM ubuntu:24.04 as libtorch
# install pipx first to install torch with it
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get -y install pipx
# Install torch
RUN pipx install torch --index-url \
        https://download.pytorch.org/whl/cpu
# Extract libtorch from the python package, copy to separate directory
RUN mkdir -p /libtorch/lib /libtorch/include

RUN cp -r /root/.local/share/pipx/venvs/torch/lib/*/*/torch/include/torch \
        /libtorch/include
# rename libraries while copying them to avoid conflicts on user systems
RUN cp /root/.local/share/pipx/venvs/torch/lib/*/*/torch/lib/libtorch_cpu.so \
        /libtorch/lib/libtorch_cpu_openMHA.so
RUN cp /root/.local/share/pipx/venvs/torch/lib/*/*/torch/lib/libc10.so \
        /libtorch/lib/libc10_openMHA.so
# do not rename libgomp which is needed by libtorch and already named uniquely
RUN cp /root/.local/share/pipx/venvs/torch/lib/*/*/torch/lib/libgomp*so* \
        /libtorch/lib/
# Also change the soname of the renamed libraries.
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install patchelf && \
    patchelf --set-soname libtorch_cpu_openMHA.so \
        /libtorch/lib/libtorch_cpu_openMHA.so && \
    patchelf --set-soname libc10_openMHA.so \
        /libtorch/lib/libc10_openMHA.so && \
    patchelf --replace-needed libc10.so libc10_openMHA.so \
        /libtorch/lib/libtorch_cpu_openMHA.so

# Create docker image with MHA build environment for Ubuntu 24.04
FROM ubuntu:24.04

# Install build dependencies from standard Ubuntu apt repository.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev octave-signal \
                       zip libx11-dev x11proto-video-dev libxv-dev libeigen3-dev \
                       ruby-dev libboost-dev \
                       libboost-system-dev netcat-openbsd wget \
                       dpkg-dev lsb-release arcanist php-xml gnupg1 cmake

# Retrieve the signing key for the hoertech apt repositories
RUN wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add - && \
\
# Add main hoertech apt repository to the package manager of this image
    echo 'deb [arch=amd64] https://apt.hoertech.de noble universe' \
          >>/etc/apt/sources.list && \
# Install non-standard build dependencies from our apt repository.
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install liblsl mhamakedeb && \
# Remove GNU autotools, they may get in the way when compiling FFTW
    apt-get -y purge autoconf automake autotools-dev libtool && \
# Create non-root user who should execute the build.
    useradd -ms /bin/bash --uid=19453 u

# Copy libtorch libraries and headers from libtorch stage
COPY --from=libtorch /libtorch/include /usr/local/include
COPY --from=libtorch /libtorch/lib /usr/local/lib
# Run ldconfig to update the library cache,
RUN ldconfig && \
# but remove the symbolic links created by ldconfig, since we want to detect
# the presence of the libraries from this build environment during configure.
    find /usr/local/lib -type l -delete

USER u
