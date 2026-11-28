FROM ubuntu:26.04
LABEL com.docker.image.name=ghcr.io/pret/pokeheartgold

RUN apt-get -y update \
 && apt-get install -y --no-install-recommends \
    bison \
    ca-certificates \
    flex \
    g++ \
    gcc-arm-none-eabi \
    git \
    libc6-i386 \
    libpng-dev \
    make \
    nasm \
    ninja-build \
    pkg-config \
    python3 \
    wget \
    xz-utils \
 && rm -rf /var/lib/apt/lists/* \
 && hash -r

CMD [ "/bin/bash" ]
