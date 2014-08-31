#!/bin/bash

KV=$1;

if [ "$KV" = "Hannover" ]; then
KV="Region Hannover"
fi

sqlite3 -column -header /home/mv/db.sq3 "select rowid,* from semkol where Kreisverband like '$KV' AND Sperre = ''" \
 | less -S
