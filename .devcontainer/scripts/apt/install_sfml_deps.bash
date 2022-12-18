#!/bin/bash
clear
set -ex

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
# autoconf

apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        autoconf \
        automake \
        autotools-dev \
        libtool \
        libudev-dev \
        libx11-dev \
        libxrandr-dev \
        libopengl-dev \
    && rm -rf /var/lib/apt/lists/*
