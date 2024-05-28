#!/bin/bash
cd /srv/data/docker/Nextcloud
docker compose -f docker-compose.yaml up -d $@
