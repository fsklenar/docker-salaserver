FROM ubuntu:noble

ENV HOSTNAME="salaserver" TZ="Europe/Berlin"

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2  && \
    apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

EXPOSE 80
