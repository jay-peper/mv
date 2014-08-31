#!/bin/bash

sqlite3 -separator ";" db.sq3 'select * from semkol' > dump/dump_$(date "+%Y-%m-%d_%H_%M_%S").csv
cat import.sqlite | sqlite3 db.sq3
cat misc.sql | sqlite3 db.sq3
