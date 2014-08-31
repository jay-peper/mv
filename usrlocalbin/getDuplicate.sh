#!/bin/bash

sql 'select Vorname,Nachname,Straße_1,Ort 
     from semkol 
     where Sperre="" 
     group by trim(Vorname),trim(Nachname),trim(Straße_1) 
     HAVING COUNT(*) > 1
     ;
'

## ./sql 'select Vorname,Nachname,straße_1 from semkol where Sperre == ""' | sed -e "s/ //g" | sort | uniq -d 
## ./sql 'select Vorname,Nachname,straße_1 from semkol' | sed -e "s/ //" | sort | uniq -D 

#sql 'select rowid,Vorname,Nachname,Straße_1,Ort from semkol as Duplicates where Sperre = "" AND rowid in
#    (
#        select rowid from semkol as First
#        where    First.Vorname = Duplicates.Vorname
#        and    First.Nachname = Duplicates.Nachname
#        and    First.Straße_1 = Duplicates.Straße_1
#	and Sperre = ""
#    )'
