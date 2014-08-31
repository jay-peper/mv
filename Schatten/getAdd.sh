#!/bin/bash

echo 'Mitgliedsnummer;Anrede;Vorname;Zusatz;Nachname;Straße;Land;PLZ;Ort;Telefon;Telefax;E-Mail;Aufnahmedatum;LV (als Abkürzung);BzV;KV;OV;Wahlkreis;Stimmkreis;Landkreis;Gemeinde;Bundesland (als Abkürzung);Erstbetrag;reduzierter Betrag (0 für nein, -1 für ja);Staatsbürgerschaft;Geb-Datum;Ausweis angefordert;Ausweis exportiert;Ausweis versendet;Umfrage  (0 für nein, -1 für ja);Aktionen  (0 für nein, -1 für ja);Newsletter  (0 für nein, -1 für ja);Token;RefCode LQFB;RefCode LS;RefCode;RefCode4;LF-Optout  (0 für nein, -1 für ja);Batchnummer;RefCode zu sperren  (0 für nein, -1 für ja);Art der Sperrung;Grund der Sperrung;Sperrung übermittelt;Sperrung bestätigt;ehemalige Refcodes;Mobilfunknummer;Kontoinhaber;Bankleitzahl;Kontonummer;Kreditinstitut;Eintrittsdatum;Austrittsdatum;Stimmberechtigt (0 für nein, -1 für ja)'

sql 'select Mitgliedsnummer ,Anrede ,Vorname ,Titel ,Nachname ,Straße_1 ,Land ,PLZ ,Ort ,Telefon_1 ,"Fax 1", eMail_1 ,start_date, "NI" ,"",Kreisverband ,"",Wahlkreis ,Lwahlkreis ,Landkreis ,"", "NI" ,"" ,"" ,"StaBü", "geburts_datum_TT.MM.JJJJ" ,"ma angefordert","" ,"ma versendet","" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"" ,"eintritts_datum" ,"" , ""  from ungesperrte where upper("Updated") == "A";' \
 | sed -e "s/Niedersachsen/NI/g" \
 | sed -e "s/Deutschland/DE/g" \
 | sed -e "s/DE-NI/NI/g"
