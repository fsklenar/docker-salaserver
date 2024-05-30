#!/bin/bash
docker stop nextcloud-aio-apache
docker stop nextcloud-aio-notify-push
docker stop nextcloud-aio-nextcloud
docker stop nextcloud-aio-imaginary
docker stop nextcloud-aio-redis
docker stop nextcloud-aio-database
docker stop nextcloud-aio-talk
docker stop nextcloud-aio-collabora
docker compose down
