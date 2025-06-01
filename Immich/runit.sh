#!/bin/bash
docker run -it -v /mnt/backup/NAS1/Foto:/import:ro -e \
 IMMICH_INSTANCE_URL=http://192.168.0.202:2283/api \
 -e IMMICH_API_KEY=$IMMICH_API_KEY \
 ghcr.io/immich-app/immich-cli:latest upload -a -c 4 --dry-run "$1"
