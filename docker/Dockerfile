# A docker build file for building a docker image that can be used for
# creating docker containers that can build other docker images and
# push them to docker hub.

# A container created from the image built here needs access to the host's
# docker socket: Add e.g. -v /var/run/docker.sock:/var/run/docker.sock to
# docker run to bind-mount the host's docker socket.

# The user executing a container created from the image built here needs read
# and write permissions to the docker socket at /var/run/docker.sock. Set the
# user's uid and/or gid as required, this will depend on the host where the
# container executes.

# Example work flow based on this Dockerfile on the command line,
# to be automated with Jenkins:
# - Create native image from this Dockerfile e.g.
#     docker build -t hoertech/docker-buildenv:docker_x86_64 .
# - Create cross image from this Dockerfile e.g.
#     docker build --platform=arm -t hoertech/docker-buildenv:docker_armv7 .
# - Log in to docker hub to push new image to docker hub.
#     docker login # May ask for credentials
# - Push newly created image(s) to docker hub.
#     docker push hoertech/docker-buildenv:docker_x86_64
# - Run container created from image on a build machine.
#     docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock \
#                --user u:$(stat -c%g /var/run/docker.sock) \
#                hoertech/docker-buildenv:docker_x86_64 bash
# - Use git, make, and docker inside container as needed to build images.


# Using ubuntu 18.04 as base image is somewhat arbitrary.  The docker
# command line utility in this image must be able to talk to the
# docker server on the host.  Update this when versions become
# incompatible.
FROM ubuntu:18.04

# Most of the image building executed in a single step for image efficiency.
RUN \
\
# Create database of available ubuntu packages
 apt-get update && \
\
# Install software without asking for confirmations or decisions
 DEBIAN_FRONTEND=noninteractive apt-get -y install \
\
# make is installed to execute docker builds and uploads via Makefile,
# docker.io is only needed for its docker command line tools,
# git is needed to clone the repository, the jre is for Jenkins.
    make docker.io git default-jre-headless && \
\
# Add a user "u" to avoid running container processes as root
 useradd -ms /bin/bash --uid=19453 u

# Default user for starting containers from the new image is "u".  The
# user executing the container must still be specified on container
# startup because they need read and write access to the host docker
# socket at /var/run/docker.sock.  With user u available, it can be
# specified as --user u:<gid> where <gid> is the numeric group id of
# /var/run/docker.sock.
USER u
