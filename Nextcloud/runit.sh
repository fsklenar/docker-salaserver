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
