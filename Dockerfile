FROM --platform=linux/amd64 ubuntu:22.04
LABEL com.docker.image.name=ghcr.io/pret/pokeheartgold

RUN apt-get -y update \
 && apt-get -y install \
    ca-certificates \
    software-properties-common \
 && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
 && apt-get -y --allow-downgrades install \
    g++-10-multilib \
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
 && { ppa-purge -y ppa:ubuntu-toolchain-r/test || true; } \
 && dpkg --add-architecture i386 \
 && mkdir -pm755 /etc/apt/keyrings \
 && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
 && add-apt-repository ppa:cybermax-dexter/sdl2-backport \
 && wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources \
 && apt-get update \
 && apt-get install --install-recommends --allow-downgrades -y winehq-stable \
 && hash -r

ENTRYPOINT [ "/bin/bash" ]
