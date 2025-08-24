FROM mcr.microsoft.com/devcontainers/javascript-node:0-18
RUN apt-get update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt-get -y --allow-downgrades install \
    ca-certificates \
    software-properties-common \
    g++-10-multilib \
    linux-libc-dev \
    binutils-arm-none-eabi \
    p7zip-full \
    pkg-config \
    libpugixml-dev \
    wget \
    lsb-release \
    make \
    git \
    build-essential \
    python3 \
    libpng-dev \
 && dpkg --add-architecture i386 \
 && mkdir -pm755 /etc/apt/keyrings \
 && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
 && wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources \
 && apt-get update \
 && apt-get install --install-recommends --allow-downgrades -y winehq-stable \
 && hash -r
