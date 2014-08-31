#!/bin/bash
FILE=/home/mv/db.sq3

sqlite3 -separator ";" $FILE 'select * from semkol' > dump/dump_$(date "+%Y-%m-%d_%H_%M_%S").csv
cat import.sqlite | sqlite3 $FILE
cat misc.sql | sqlite3 $FILE
