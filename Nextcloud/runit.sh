#!/bin/bash
cd /srv/data/docker/Nextcloud
docker volume create --driver local \
    --opt device=/srv/data/docker_data/Nextcloud/database \
    --opt o=bind \
    --opt type=none \
    nextcloud_aio_database

docker volume create --driver local \
    --opt device=/srv/data/docker_data/Nextcloud/database_dump \
    --opt o=bind \
    --opt type=none \
    nextcloud_aio_database_dump

docker volume create --driver local \
    --opt device=/srv/data/docker_data/Nextcloud/nextcloud \
    --opt o=bind \
    --opt type=none \
    nextcloud_aio_nextcloud

docker compose -f docker-compose.yaml up -d $@
docker start nextcloud-aio-apache
docker start nextcloud-aio-notify-push
docker start nextcloud-aio-nextcloud
docker start nextcloud-aio-imaginary
docker start nextcloud-aio-redis
docker start nextcloud-aio-database
#docker stop nextcloud-aio-talk
#docker stop nextcloud-aio-collabora
