#!/bin/bash
echo "Nummer,Name,Datum,EAN"
cat $1 | awk -F";" '{ printf "%d,%s %s,%s,%07d\n", $4,$3,$2,$5,$4}' | unix2dos | iconv --from-code=UTF8 --to-code=ISO-8859-15
# format csv: Bundesland;Nachname;Vorname;Mnr;Datum
