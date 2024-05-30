#!/bin/bash
cd /srv/data/docker/Nextcloud
#- doplnit vsetky volumes
#https://github.com/nextcloud/all-in-one#how-to-change-the-default-location-of-nextclouds-datadir

#local     nextcloud_aio_apache
#local     nextcloud_aio_database
#local     nextcloud_aio_database_dump
#local     nextcloud_aio_mastercontainer
#local     nextcloud_aio_nextcloud
#local     nextcloud_aio_nextcloud_datadir
#local     nextcloud_aio_redis

#docker create volume 

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
