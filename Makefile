# We use dockerhub build automation to produce the images instead of this
# Makefile, for all images except for ARM.

ARM = \
	mha_armv7-linux-gcc-5 \
	mha_armv7-linux-gcc-7

.PHONY: clean

arm: $(foreach dir,$(ARM),$(dir)/.directory)

%/.directory: %/Dockerfile
	docker build -t hoertech/docker-buildenv:$(@D) $(@D)
	docker push hoertech/docker-buildenv:$(@D)
	@touch $@

%/.build: %/Dockerfile
	docker build -t hoertech/docker-buildenv:$(@D) $(@D)
	@touch $@

clean:
	@rm -f */.directory
