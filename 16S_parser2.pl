#!/usr/bin/perl
use warnings;

#for sets of barcoded samples, use this number to indicate the barcode number
$bcnumber = 49;

#open the raw 16S file downloaded from Geneious
open(DATA,"/scicomp/home/ymg2/perl/16S/16S-Biodiversity-results_BC${bcnumber}.tsv") || die "$!";

#tally genus counts
while (<DATA>) {
	@line = split(/\t/,$_);
	$name = $line[20];
	if (defined $name){
		$genus{$name}++;
}
}

#sort genuses by counts
sub sortbyvalue {
	%h = @_;
	return sort {$genus{$b} <=> $genus{$a}} keys %h;
}

@keys = sortbyvalue %genus;

#write the output file
open (OUTPUT, ">>/scicomp/home/ymg2/perl/16S/Summary_output/BC${bcnumber}out.txt") || die "$!";

for $key (@keys) {
	print OUTPUT $key . "," . $genus{$key}  . "\n";
}

close DATA;
close OUTPUT;

exit;
