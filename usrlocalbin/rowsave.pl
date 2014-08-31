#!/usr/bin/perl

use DBI;
use v5.10.1;

my $dbargs = {AutoCommit => 0, PrintError => 1};
my $dbh = DBI->connect("dbi:SQLite:dbname=/home/mv/db.sq3", "", "", $dbargs);

open(DATEI, "<", $ARGV[0]);
	my @datei = <DATEI>;
close(DATEI);

$_ = shift @datei;

$i=0;
chomp ();
$firstline = $_;
@columnNames = split/;/;

foreach(@columnNames) { # searching the correct column number
	$Numbers{$_} = $i;
	$i++;
}

if ($Numbers{'rowId'} eq "") {
  say "no rowId no work";
  exit 1;
}

foreach(@datei) {
  chomp ();
  @line = split/;/;
	  $line[scalar @columnNames - 1] = "" if($line[scalar @columnNames - 1] eq "");#some absurd construct to guarantee the right number of columns
  foreach (keys %Numbers) {
    say "key is >$_<";
    if ($_ =~ /rowId/) {

    } else {
      say "$line[$Numbers{'rowId'}] - $_ = $line[$Numbers{$_}]";
      $sql = "UPDATE semkol set \"".$_."\" = \"".$line[$Numbers{$_}]."\" where rowid = ".$line[$Numbers{'rowId'}].";";
      $sth = $dbh->prepare($sql);
      $rv = $sth->execute;
      if ($dbh->err()) { die "$DBI::errstr\n"; }
      say " result: ". $sth->rows. " changed";
    }
  }
}

$dbh->commit();
