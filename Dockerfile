FROM ubuntu:26.04
LABEL com.docker.image.name=ghcr.io/pret/pokeheartgold

RUN apt-get -y update \
 && apt-get -y install \
    ca-certificates \
    software-properties-common \
 && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
 && apt-get -y --allow-downgrades install \
    g++-multilib \
    linux-libc-dev \
    binutils-arm-none-eabi \
    p7zip-full \
    pkg-config \
    libpugixml-dev \
    ppa-purge \
    wget \
    lsb-release \
    make \
    git \
    build-essential \
    python3 \
    libpng-dev \
    flex \
    bison \
 && { ppa-purge -y ppa:ubuntu-toolchain-r/test || true; } \
 && dpkg --add-architecture i386 \
 && apt-get update \
 && apt-get install --no-install-recommends -y gcc-arm-none-eabi \
 && hash -r

ENTRYPOINT [ "/bin/bash" ]
