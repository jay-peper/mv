#!/bin/bash

echo "Nummer,Name,Datum,EAN" > MA2.csv
DATE=$(date "+%Y-%m-%d_%H-%M")

sql 'select Mitgliedsnummer,Vorname,Nachname,eintritts_datum,Kreisverband from ungesperrte where "ma angefordert" = "04.11.2012" AND Beitrag like "2012" AND Mitgliedsnummer not like "" order by Kreisverband' \
 | awk -F";" '{ printf "%d,%s %s,%s,%07d,%s\n", $1,$2,$3,$4,$1,$5}' >> MA2.csv

unix2dos MA2.csv

iconv --from-code=UTF8 --to-code=ISO-8859-15 MA2.csv > MA_${DATE}.csv

# echo sqlite -separator ";" db.sq3 "UPDATE semkol set 'ma angefordert' = \"$DATE\" where 'ma angefordert' like '' AND Beitrag like '2012' AND Mitgliedsnummer not like '';"

sql 'UPDATE semkol set "ma angefordert" = (select strftime("%d.%m.%Y")) where "ma angefordert" like "" AND Beitrag like "2012" AND Mitgliedsnummer not like "";'
