#!/bin/bash
local_ip="10.192.168.201"
dest_ip="10.14.0.5"
public_server="salauser@linuxadmin.sk"

#params: source_port, dest_port
function do_port_forward {
  local port
  port=`ss -nltp | grep "$local_ip:$1" | cut -d ":" -f 2 | cut -d " " -f 1`
  #do port_forward only when there is still not active port_forward for source port
  if [[ "$port" != "$1" ]]; then
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

##port fowards
logger "RUNALL: port forward at `date`" 
sleep 1
#Munin
do_port_forward "8888" "8888"

logger "RUNALL: finished at `date`" 
