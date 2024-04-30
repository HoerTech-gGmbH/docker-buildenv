# Build stage for retrieving current libtorch
FROM ubuntu:20.04 as libtorch
# default python on ubuntu 20.04 is python3.8, but we need python3.9 for torch
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
        apt-get -y install curl python3.9-full
# pip for python3.9 cannot be installed through apt
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.9 get-pip.py
# Install torch
RUN /usr/local/bin/pip install torch --index-url \
        https://download.pytorch.org/whl/cpu
# Extract libtorch from the python package, copy to separate directory
RUN mkdir -p /libtorch/lib /libtorch/include
RUN cp -r /usr/local/lib/python3.9/dist-packages/torch/include/torch \
        /libtorch/include
# rename libraries while copying them to avoid conflicts on user systems
RUN cp /usr/local/lib/python3.9/dist-packages/torch/lib/libtorch_cpu.so \
        /libtorch/lib/libtorch_cpu_openMHA.so
RUN cp /usr/local/lib/python3.9/dist-packages/torch/lib/libc10.so \
        /libtorch/lib/libc10_openMHA.so
# do not rename libgomp which is needed by libtorch and already named uniquely
RUN cp /usr/local/lib/python3.9/dist-packages/torch/lib/libgomp*so* \
        /libtorch/lib/
# Also change the soname of the renamed libraries.
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install patchelf && \
    patchelf --set-soname libtorch_cpu_openMHA.so \
        /libtorch/lib/libtorch_cpu_openMHA.so && \
    patchelf --set-soname libc10_openMHA.so \
        /libtorch/lib/libc10_openMHA.so && \
    patchelf --replace-needed libc10.so libc10_openMHA.so \
        /libtorch/lib/libtorch_cpu_openMHA.so

# Create docker image with MHA build environment for Ubuntu 20.04
FROM ubuntu:20.04

# Install build dependencies from standard ubuntu apt repository.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make libsndfile1-dev jackd2 portaudio19-dev \
                       libjack-jackd2-dev liblo-dev octave-signal \
                       zip libx11-dev x11proto-video-dev libxv-dev libeigen3-dev \
                       libcwiid-dev ruby-dev libboost-dev libgtkmm-3.0-dev \
                       libfreenect-dev swig libboost-system-dev netcat wget \
                       dpkg-dev lsb-release arcanist php-xml gnupg1 cmake && \
# Retrieve the signing key for the hoertech apt repositories
    wget -qO- https://apt.hoertech.de/openmha-packaging.pub | apt-key add -

# Add main hoertech apt repository to the package manager of this image
RUN echo 'deb [arch=amd64] https://apt.hoertech.de focal universe' \
          >>/etc/apt/sources.list && \
# Install non-standard build dependencies from our apt repository.
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install liblsl mhamakedeb && \
# Create directories expected to exist in the image.
    mkdir -p /etc/mha /usr/share/octave/5.2.0/m/java && \
# Fix for Octave on ubuntu 20.04, see https://savannah.gnu.org/bugs/?59310 :
    echo '-Djdk.lang.processReaperUseDefaultStackSize=true' \
         >> /usr/share/octave/5.2.0/m/java/java.opts && \
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
# when to link against special _openMHA installed library versions.
    find /usr/local/lib -type l -delete

USER u
