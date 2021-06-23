FROM ubuntu:20.04
MAINTAINER Xcape, Inc. <support@xcapeinc.com>

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
          libguestfs-tools \
          qemu-utils \
          linux-image-generic

ENV LIBGUESTFS_BACKEND=direct

LABEL org.opencontainers.image.authors='Xcape, Inc. <support@xcapeinc.com>'
LABEL org.opencontainers.image.url='https://github.com/xcape-inc/docker-guestfs'
LABEL org.opencontainers.image.documentation='https://xcape-inc.github.io/docker-guestfs'
LABEL org.opencontainers.image.source='https://github.com/xcape-inc/docker-guestfs.git'
LABEL org.opencontainers.image.vendor='Xcape, Inc.'
#LABEL org.opencontainers.image.licenses=''
LABEL org.opencontainers.image.title='ghcr.io/xcape-inc/docker-guestfs'
LABEL org.opencontainers.image.description='Docker image for running guestfish commands'

ENTRYPOINT ["guestfish"]
