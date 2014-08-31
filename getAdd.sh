#!/bin/bash

sqlite -separator ";" db.sq3 'select Mitgliedsnummer ,Anrede ,Vorname ,Titel ,Nachname ,Straße_1 ,Land ,PLZ ,Ort ,Telefon_1 ,"Fax 1", eMail_1 ,start_date, "NI" ,"",Kreisverband ,"",Wahlkreis ,Lwahlkreis ,Landkreis ,"", "NI" ,"" ,"" ,"StaBü", "geburts_datum_TT.MM.JJJJ" ,"ma angefordert","" ,"ma versendet","" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"eintritts_datum" ,"" , ""  from ungesperrte where "Updated" == "A";' \
 | sed -e "s/Niedersachsen/NI/g" \
 | sed -e "s/DE-NI/NI/g"
