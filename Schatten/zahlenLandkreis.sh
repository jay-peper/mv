#!/bin/bash

SQL="sql"

oldIFS=$IFS

IFS="
"

LKS="Ammerland
Aurich
Celle
Cloppenburg
Cuxhaven
Diepholz
Emsland
Friesland
Gifhorn
Goslar
Göttingen
Grafschaft Bentheim
Harburg
Hameln-Pyrmont
Heidekreis
Helmstedt
Hildesheim
Holzminden
Leer
Lüchow-Dannenberg
Lüneburg
Nienburg (Weser)
Northeim
Oldenburg
Osnabrück
Osterholz
Osterode am Harz
Peine
Region Hannover
Rotenburg (Wümme)
Schaumburg
Stade
Stadt Braunschweig
Stadt Delmenhorst
Stadt Emden
Stadt Oldenburg
Stadt Osnabrück
Stadt Salzgitter
Stadt Wilhelmshaven
Stadt Wolfsburg
Uelzen
Vechta
Verden
Wesermarsch
Wittmund
Wolfenbüttel"

for LK in $LKS ; do
  IFS=$oldIFS
  LKout=$(echo $LK | sed -e "s/ /_/g")
  STIMMB=$($SQL \
    "select count(*) from ungesperrte where Kreisverband like \"${LK}\" AND Beitrag = '2012';")
  GESAMT=$(${SQL} \
    "select count(*) from ungesperrte where Kreisverband like \"${LK}\";")
  echo "| ${LKout}_stimmb = ${STIMMB}"
  echo "| ${LKout}_gesamt = ${GESAMT}"

done

