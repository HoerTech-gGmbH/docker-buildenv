# Create docker image with MHA build environment for Ubuntu 24.04
FROM ubuntu:24.04

# Install build dependencies from standard Ubuntu apt repository.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev octave-signal patchelf \
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
    useradd -ms /bin/bash --uid=19453 u && \
\
# Download libtorch libraries directly from pytorch download page.
    libtorchzip="libtorch-cxx11-abi-shared-with-deps-2.3.0%2Bcpu.zip" && \
    wget "https://download.pytorch.org/libtorch/cpu/$libtorchzip" && \
# Check the sha512 checksum of the downloaded file, then unpack.
    chk_a=0d6fb6a58874f0a3099def817a080e6af4afa19adaf6f54c36ffbb3e9f99abd6 && \
    chk_b=2983bca8f74c28e5064444bfba950d3c135d9708282c88d3f70228b4f4c0fe7c && \
    echo "$chk_a$chk_b" libtorch*.zip | sha512sum -c && \
    unzip libtorch*.zip && \
    rm -f libtorch*.zip && \
\
# Copy libtorch headers.
    cp -r libtorch/include /usr/local && \
# Rename libraries while copying them to avoid conflicts on user systems.
    cp libtorch/lib/libtorch_cpu.so /usr/local/lib/libtorch_cpu_openMHA.so && \
    cp libtorch/lib/libc10.so       /usr/local/lib/libc10_openMHA.so && \
    cp libtorch/lib/libgomp-98b21ff3.so.1 /usr/local/lib/libgomp_openMHA.so &&\
    rm -rf libtorch && \
\
# Also change the soname of the renamed libraries.
    patchelf --set-soname libtorch_cpu_openMHA.so \
        /usr/local/lib/libtorch_cpu_openMHA.so && \
    patchelf --set-soname libc10_openMHA.so \
        /usr/local/lib/libc10_openMHA.so && \
    patchelf --set-soname libgomp_openMHA.so \
        /usr/local/lib/libgomp_openMHA.so && \
    patchelf --replace-needed libc10.so libc10_openMHA.so \
        /usr/local/lib/libtorch_cpu_openMHA.so && \
    patchelf --replace-needed libgomp-98b21ff3.so.1 libgomp_openMHA.so \
        /usr/local/lib/libtorch_cpu_openMHA.so && \
\
# Update the library cache.
    ldconfig 

USER u
