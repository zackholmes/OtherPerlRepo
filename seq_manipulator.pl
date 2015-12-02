#!/usr/bin/perl
use warnings; 

print "Please paste your sequence and hit enter.";

$seq = <STDIN>;

print "Which function would you like to use?\n1: complement\n2: reverse\n3: reverse and complement\n";

$function_choice = <STDIN>;

if ($function_choice == 1){
	$seq =~ tr/ACGTacgt/TGCAtgca/;
}
elsif ($function_choice == 2){
	$seq = reverse ($seq);
}
elsif ($function_choice == 3){
	$seq = reverse ($seq);
	$seq =~ tr/ACGTacgt/TGCAtgca/;
}
else {
	print "Invalid function choice. Please enter either 1, 2, or 3 and press enter.";
}

print "$seq \n";

exit; 
