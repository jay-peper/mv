#!/bin/bash
FILE=/home/mv/db.sq3
sqlite3 -separator ";" $FILE 'select * from semkol' > semkol_20120203.csv
sqlite3 -separator ";" $FILE 'select * from kreisverbaende' > kreisverbaende.csv
