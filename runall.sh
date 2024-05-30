#!/bin/bash
local_ip="10.192.168.201"
dest_ip="10.14.0.5"
public_server="salauser@linuxadmin.sk"

#params: source_port, dest_port
function do_port_forward {
  local port
  port_forward_exists=`ps -ef | grep "$dest_ip:$2:$local_ip:$1" | grep -v grep`
  #do port_forward only when there is still not an active port_forward for source port
  if [[ -z "$port_forward_exists" ]]; then
    logger "RUNALL: Port forward for $1 port"
    ssh -N -R $dest_ip:$2:$local_ip:$1 $public_server &
  fi
}

##sleep delay only when running after boot
logger "RUNALL: script started at `date`"
if [ "$(id -u)" -eq "0" ]; then
  sleep 60
  logger "RUNALL: sleep delay finished at `date`" 
fi

#start of containers
cd /srv/data/docker
Munin/runit.sh
Nextcloud/runit.sh
#END containers

logger "RUNALL: port forward at `date`" 
sleep 5
#Munin
do_port_forward "8888" "8888"
#Nextcloud
do_port_forward "11000" "11000"


logger "RUNALL: finished at `date`" 
