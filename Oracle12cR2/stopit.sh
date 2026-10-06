#!/bin/sh
docker exec -it Oracle12cR2 sqlplus "/as sysdba" @/opt/oracle/shutdown
docker stop --timeout=180 Oracle12cR2

