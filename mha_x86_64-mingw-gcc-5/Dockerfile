FROM dockcross/windows-shared-x64-posix

ENV DEFAULT_DOCKCROSS_IMAGE hoertech/mha_x86_64-mingw-gcc-5

RUN \
cd /usr/src/mxe && \
make -j$(nproc) libsndfile portaudio boost nsis pe-util && \
useradd -ms /bin/bash --uid=19453 u
USER u
