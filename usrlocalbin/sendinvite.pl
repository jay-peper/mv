#!/usr/bin/perl

$version = "1.0.6";

use v5.10.1;
use Encode;
use POSIX;

if ($#ARGV < 1) {
	say "error, not enough arguments.";
	say "USAGE: $0 mail.txt Mitglieder.csv ";
	say;
	say "mail.txt must contain subject line followed by an empty line";
	say "mitglieds.csv must contain \"Vorname;Email_1\"";
	exit(2);
}

$mailfile = $ARGV[0];
$mitgliederfile = $ARGV[1];
$outfile = $mailfile ."_out.csv";

$mailfrom = 'mv@piraten-nds.de';
$mailrcpt = 'jason.peper@piraten-nds.de';
$mailurl  = 'smtps://mail.piraten-nds.de:465';

open(fh, "<", $mitgliederfile);
	my @mitglieder = <fh>;#read whole file at once, each list entry is one line
close(fh);

open (out, ">>", $outfile);

mkdir "out";

$i=0;
foreach (@mitglieder) {
  $code = $_;
  chomp $code;
  chomp $mitglieder[$i];
  $mitglieder[$i] =~ s/"//g;
  @line = split/;/,$mitglieder[$i];
  $mail = $line[1];
  $i++;

  my $text = "";  
  open (ANSCHREIBEN, "<", $mailfile);
  while (<ANSCHREIBEN>) {
    $text .= $_;
  }
  #$line[1] =~ s/"//g;  
  #$line[0] =~ s/"//g;
  # $vname = encode("iso-8859-1", $line[0]);
  $vname = $line[0];
  $nname = $line[2];
  $refcode = $line[3];
  $text =~ s/VORNAME/$vname/g;
  $text =~ s/NACHNAME/$nname/g;
  $text =~ s/REFCODE/$refcode/g;

  say out "sending mail for $mail $vname $nname";
  say "$i  sending mail for $mail $vname $nname";

  open (LOG, ">", "out/" . $i . "_"  . $mail . ".out" );
  say LOG $vname;
  say LOG $mail;
  say LOG "-------------";
  say LOG $text;
  close LOG;

  my %month_name;
  @month_name{ 0 .. 11 } = qw(Jan Feb Mar Apr May Jun Jul Aug Sept Oct Nov Dec);
  my %wday_name;
  @wday_name{ 0 .. 6 } = qw(Sun Mon Tue Wed Thu Fri Sat);
  my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
  $year +=1900;
  $offset = strftime("%z", localtime());
  $time = sprintf("%02d:%02d:%02d",$hour,$min,$sec);
  
  # say  '|curl -n --insecure --ssl-reqd --mail-from "'.$mailfrom.'" --mail-rcpt "'.$mailrcpt.'" --mail-rcpt "'.$mail.'" --url '.$mailurl.' -s -T -';
  # open MAIL, '|curl -n --insecure --ssl-reqd --mail-from "'.$mailfrom.'" --mail-rcpt "'.$mailrcpt.'" --mail-rcpt "'.$mail.'" --url '.$mailurl.' -s -T -';
  open MAIL, '|curl -n --insecure --ssl-reqd --mail-from "'.$mailfrom.'" --mail-rcpt "'.$mail.'" --url '.$mailurl.' -s -T -';
  say MAIL 'From: Mitgliederverwaltung Piraten Nds <mv@piraten-nds.de>';
  say MAIL "To: $mail";
  say MAIL "User-Agent: sendInvite $version";
  say MAIL "Precedence: bulk";
  say MAIL "Date: $wday_name{$wday}, $mday $month_name{$mon} $year $time $offset";
  say MAIL "Content-Type: text/plain; charset=UTF-8";
  say MAIL 'Reply-To: mv-reply@piraten-nds.de';
  say MAIL $text;
}

close out;
