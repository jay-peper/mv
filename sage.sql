drop table from_sage;
create table from_sage (Adresse text,Mandant text,Kategorie text,Matchcode text,Anrede text,Name1 text,Name2 text,LieferZusatz text,LieferStrasse text,LieferLand text,LieferPLZ text,LieferOrt text,PostZusatz text,PostStrasse text,PostLand text,PostPLZ text,PostOrt text,Ansprache text,Telefon text,Telefax text,Mobilfunk text,EMail text,Homepage text,Memo text,Sprache text,Erstkontakt text,Gruppe text,A1Besteuerung text,Auswertungskennzeichen text,Referenz text,Aktiv text,Abladestelle text,Werkschluessel text,Timestamp text,USER_LV text,USER_Bezirk text,USER_Kreis text,USER_Wahlkreis text,USER_Stimmkreis text,USER_Beitrag text,USER_redBeitrag text,USER_Umfragen text,USER_Aktionen text,USER_Newsletter text,USER_AusweisAngefordert text,USER_Ausweisexportiert text,USER_AusweisVersendet text,USER_Track text,USER_Ansprache text,USER_Dankschreiben text,USER_Spendenbescheinigung text,USER_Spendernummer text,USER_Status text,USER_Geburtsdatum text,USER_Stimmberechtigt text,USER_Lastschrift text,USER_Funktion text,USER_Mandat text,USER_Bundesland text,USER_Mitgliedsnummer text,USER_Eintrittsdatum text,USER_Austrittsdatum text,USER_Erstbeitrag text,USER_besondererKontakt text,USER_Quelle text,USER_RefCodeLQFB text,USER_LFOptout text,USER_Batchnummer text,USER_Kommentar text,USER_RefCodezusperren text,USER_Artdersperrung text,USER_Grunddersperrung text,USER_Sperrunguebermittelt text,USER_Sperrungbestaetigt text,USER_RefCodeehem text,USER_RefCodeLS text,USER_RefCode3 text,USER_RefCode4 text,USER_Landkreis text,USER_Gemeinde text,USER_Staatsbuergerschaft text,USER_OV text,USER_Token text,USER_Ruhend text,USER_Batchimportnummer text,USER_Kontonummer text,USER_BLZ text,USER_Kontoinhaber text,USER_Bankname text,USER_firma1 text,USER_firma2);
.separator ";"
.import tmp_BSCrmExportList_10.csv from_sage
