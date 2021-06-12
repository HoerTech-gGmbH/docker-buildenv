# The cmake contained in 18.04 is too old to compile liblsl, build from source:
FROM ubuntu:18.04 AS buildcmake
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install build-essential wget libssl-dev && \
    wget https://github.com/Kitware/CMake/releases/download/v3.17.0/cmake-3.17.0.tar.gz && \
    tar xf cmake-3.17.0.tar.gz && \
    cd cmake-3.17.0 && ./configure && make install && cd .. && \
    rm -rf cmake-* && rm -rvf /usr/local/doc && rm -rvf /usr/local/man

FROM ubuntu:18.04
COPY --from=buildcmake /usr/local /usr/local
RUN test -e /usr/local/bin/cmake && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make default-jre-headless \
                       dpkg-dev lsb-release wget rsync ccache && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
