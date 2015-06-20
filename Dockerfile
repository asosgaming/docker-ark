FROM ubuntu:latest

MAINTAINER Phantium

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y install lib32gcc1 wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && mkdir -p /data/ark/backup \
    && useradd -d /data/ark -s /bin/bash --uid 1000 ark \
    && chown -R ark: /data/ark

EXPOSE 27015/udp 7778/udp

ADD ark.sh /usr/local/bin/ark

USER ark
VOLUME /data/ark
WORKDIR /data/ark
CMD ["ark"]