FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        tar \
        gzip \
        lib32gcc-s1 \
        lib32stdc++6 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash steam \
    && mkdir -p /home/steam/steamcmd \
    && chown -R steam:steam /home/steam

USER steam
WORKDIR /home/steam/steamcmd

RUN wget -qO steamcmd_linux.tar.gz \
        https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
    && tar -xzf steamcmd_linux.tar.gz \
    && rm steamcmd_linux.tar.gz

CMD ["sleep", "infinity"]