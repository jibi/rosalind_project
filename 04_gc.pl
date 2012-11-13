#!/usr/bin/perl
use strict;
use warnings;

my @entries = ();
my $file_length;
my $file;

open my $fh,"<", "./set" || die $!;
$file_length = read $fh, $file, 10 * (1000 * 2 + 100);

while ($file  =~ />Rosalind_(\d{4})\n([ACGT\n]+)/) {
	my $id = $1;
	my $data = $2;
	my $len;
	my $start = length($2) + 15; #length('>Rosalind_xxxx ')

	$file_length = $file_length - $start;
	$file = substr($file, $start, $file_length);
	$data =~ s/\n//g;
	$len = length($data);		

	push @entries, {'id' => $id, 'data' => $data, 'len' => $len};
}

my $max = 0;
my $max_id;

foreach my $e (@entries) {
	my $gc = 0;
	my $ratio;

	foreach my $char (unpack("W*",$e->{'data'})) {
		$gc++ if ($char == ord('G') || $char  == ord('C'));
	}

	$ratio = $gc / $e->{'len'}; 

	if ($ratio > $max) {
		$max = $ratio;
		$max_id = $e->{'id'};
	}
}

print "Rosalind_" . $max_id . "\n" . $max * 100 . "\n";

