FROM ubuntu:18.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install default-jre-headless git aptly gnupg1 lftp make \
                       wget rsync jq curl unzip ruby && \
    cp -v /usr/bin/gpg1 /usr/bin/gpg && \
useradd -ms /bin/bash --uid=19453 u
USER u
WORKDIR /home/u
