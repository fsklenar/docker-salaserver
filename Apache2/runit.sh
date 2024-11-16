#!/bin/bash
docker run -d --name=Apache2 --rm -p 192.168.0.201:80:80  \
    -e HOSTNAME="apacheerver" \
    -e TZ="Europe/Berlin" \
    apache2
