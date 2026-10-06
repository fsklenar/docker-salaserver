#!/bin/sh
docker run --rm -d --name Oracle12cR2 --shm-size=35G -e "TZ=Europe/Bratislava" \
                -p 192.168.0.201:1521:1521 \
                -e ORACLE_SID=g3orcl \
                -v /srv/data/docker_data/Oracle12cR2/oradata:/opt/oracle/oradata \
                -v /srv/data/docker_data/Oracle12cR2/backup_hdd/zaloha/db:/opt/oracle/oradata/import \
                oracle/database:12.2.0.1-ee
