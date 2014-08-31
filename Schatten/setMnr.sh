#!/bin/bash

./sql "UPDATE semkol SET Mitgliedsnummer = $2 WHERE ROWID = $1 AND Mitgliedsnummer = ''"
