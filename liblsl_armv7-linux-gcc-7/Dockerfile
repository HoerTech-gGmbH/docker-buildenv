FROM ubuntu:18.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install git g++ make build-essential \
                       ruby-dev default-jre \
                       dpkg-dev lsb-release \
                       software-properties-common wget \
		       rsync cmake ccache && \
    git config --global user.email "noreply@mha.hoertech.de" && \
    git config --global user.name "Jenkins"
