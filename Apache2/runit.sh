#!/bin/bash
docker run -d --name=Apache2 --rm -p 10.192.168.201:80:80  \
    -e HOSTNAME="apacheerver" \
    -e TZ="Europe/Berlin" \
    apache2 apache2ctl -D FOREGROUND
