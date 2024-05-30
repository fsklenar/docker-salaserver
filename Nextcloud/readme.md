## rescan folder of "user01"

### bash into container
docker exec -it nextcloud-aio-nextcloud bash

### commands in container
cd /var/www/html
sudo -u www-data php occ files:scan  user_01

