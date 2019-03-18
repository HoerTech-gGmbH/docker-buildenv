FROM dockcross/windows-shared-x64-posix

ENV DEFAULT_DOCKCROSS_IMAGE hoertech/mha_x86_64-mingw-gcc-5

RUN \
cd /usr/src/mxe && \
make -j$(nproc) libsndfile portaudio boost nsis
#sed -i '61s/WIN32/_WIN32/' /usr/src/mxe/usr/x86_64-w64-mingw32.shared.posix/include/jack/systemdeps.h
