#!/bin/bash
docker run -i -v /mnt/backup/NAS1/Foto:/import:ro -e \
 IMMICH_INSTANCE_URL=https://immich-salaserver.linuxadmin.eu/api \
 -e IMMICH_API_KEY=$IMMICH_API_KEY \
 ghcr.io/immich-app/immich-cli:latest upload -a -c 4 "$1"
