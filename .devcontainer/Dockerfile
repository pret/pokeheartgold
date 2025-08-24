FROM mcr.microsoft.com/devcontainers/javascript-node:0-18
ARG WINEMONO_VER=9.4.0
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
 && wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/$(lsb_release -is | sed 's/.*/\L&/')/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources \
 && apt-get update \
 && apt-get install --install-recommends --allow-downgrades -y winehq-stable
ADD https://dl.winehq.org/wine/wine-mono/${WINEMONO_VER}/wine-mono-${WINEMONO_VER}-x86.tar.xz /opt/wine/mono/wine-mono-${WINEMONO_VER}-x86.tar.xz
WORKDIR /opt/wine/mono/
RUN tar xvf wine-mono-${WINEMONO_VER}-x86.tar.xz && rm wine-mono-${WINEMONO_VER}-x86.tar.xz && wineboot -i
WORKDIR /
RUN hash -r
