#!/bin/bash
sleep 60
cd /srv/data/docker
Munin/runit.sh

##port fowards
sleep 5
#Munin
ssh -N -R 10.14.0.5:8888:10.192.168.201:8888 salauser@linuxadmin.sk &
