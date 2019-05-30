FROM ubuntu:18.04
COPY *.deb /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential \
                       ruby-dev default-jre \
                       dpkg-dev lsb-release \
                       software-properties-common wget \
		       rsync cmake ccache && \
    dpkg -i /*.deb && \
    rm /*.deb && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
