SUBDIRS = \
	aptly \
	mha_armv7-linux-gcc-5 \
	mha_armv7-linux-gcc-7 \
	mha_i686-linux-gcc-4.8 \
	mha_i686-linux-gcc-5 \
	mha_i686-linux-gcc-7 \
	mha_x86_64-linux-gcc-4.8 \
	mha_x86_64-linux-gcc-5 \
	mha_x86_64-linux-gcc-7 \
	mha_x86_64-linux-gcc-7-doc

.PHONY: clean

all: $(foreach dir,$(SUBDIRS),$(dir)/.directory)

%/.directory: %/Dockerfile
	echo "docker build -t hoertech/docker-buildenv:$(@D) $(@D)"
	echo "docker push hoertech/docker-buildenv:$(@D)"
	@touch $@

clean:
	@rm -f */.directory
