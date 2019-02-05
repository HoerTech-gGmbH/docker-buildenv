X86 = \
	aptly \
	mha_i686-linux-gcc-4.8 \
	mha_i686-linux-gcc-5 \
	mha_i686-linux-gcc-7 \
	mha_x86_64-linux-gcc-4.8 \
	mha_x86_64-linux-gcc-5 \
	mha_x86_64-linux-gcc-7 \
	mha_x86_64-linux-gcc-7-doc

ARM = \
	mha_armv7-linux-gcc-5 \
	mha_armv7-linux-gcc-7

.PHONY: clean

x86: $(foreach dir,$(X86),$(dir)/.directory)

arm: $(foreach dir,$(ARM),$(dir)/.directory)

all: $(foreach dir,$(X86),$(dir)/.directory) $(foreach dir,$(ARM),$(dir)/.directory)

%/.directory: %/Dockerfile
	docker build -t hoertech/docker-buildenv:$(@D) $(@D)
	docker push hoertech/docker-buildenv:$(@D)
	@touch $@

%/.build: %/Dockerfile
	docker build -t hoertech/docker-buildenv:$(@D) $(@D)
	@touch $@

clean:
	@rm -f */.directory
