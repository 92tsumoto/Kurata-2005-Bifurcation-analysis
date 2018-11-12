# mkdat.pl --Make a bifurcation set from two data files


&check_dat_name();
#print "$dat_name\n";

open (IN,"$dat_name"); 
open (OUT,">tmp.dat"); 

@reverse_dat = reverse(<IN>);

$end = $#reverse_dat;

print OUT "$reverse_dat[$end]";
print OUT "$reverse_dat[$end-1]";

$stop = $end -1;

$i = 0;
foreach (@reverse_dat){
	if( $i < $stop ){
		print OUT;
	}	
	++$i;
}
close(OUT);
close(IN);

open (IN2,"$dat_name.1"); 
open (FOUT,">>tmp.dat"); 

while (<IN2>){
	print FOUT;
}

close(FOUT);
close(IN2);

#
# Deletes temporary files
#
delete('tmp.dat','$dat_name');
copyfile('_._', '$dat_name._');
delete('$dat_name.1');

#
# check the data file name
#
sub check_dat_name {

	open (IN,"bf.in"); 
	
	while (<IN>) {
		chomp;
		if ($. == 2){
			/(\S+)/;
			$dat_name = $1;
			} 
		}
	close(IN);
}
