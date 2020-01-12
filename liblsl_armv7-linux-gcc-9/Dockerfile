FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential \
                       default-jre-headless \
                       dpkg-dev lsb-release \
                       wget \
		       rsync cmake ccache && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
