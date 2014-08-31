#!/bin/bash

sql "select rowid,Mitgliedsnummer,beitrag,Vorname,Nachname,Straße_1,PLZ,Ort,* from semkol where Nachname like '$1' AND Sperre = ''" \
 | less -S
