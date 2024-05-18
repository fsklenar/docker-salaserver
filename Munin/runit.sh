#!/bin/bash
docker run -d --name=MuninServer --rm -p 10.192.168.201:8888:8888  \
    -e ALLOWED_HOSTS="0/0" \
    -e HOSTNAME="salaserver" \
    -e TZ="Europe/Berlin" \
    -v /srv/data/docker_data/Munin/munin-server/www:/var/cache/munin/www:rw \
    -v /srv/data/docker_data/Munin/munin-server/rrd:/var/lib/munin:rw \
    -v /srv/data/docker/Munin/conf/munin-conf.d:/etc/munin/munin-conf.d:rw \
    -v /:/rootfs:ro \
    -v /sys:/sys:ro munin
