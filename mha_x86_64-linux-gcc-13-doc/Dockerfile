FROM hoertech/docker-buildenv:mha_x86_64-linux-gcc-13
USER root
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install netpbm fig2dev doxygen graphviz texlive nano \
                       texlive-latex-extra texlive-font-utils wget
USER u
