#!/bin/bash
dd if=/dev/zero of=/var/www/html/zerofile bs=10M count=1000
apache2ctl -D FOREGROUND
