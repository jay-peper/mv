#!/bin/bash

./sql "UPDATE semkol SET Sperre = 'D' WHERE ROWID = $1 "
