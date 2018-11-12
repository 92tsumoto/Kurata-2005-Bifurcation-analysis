#
# mkprg.pl -- create the several program for Bifrucation analyses .
#
# begin main

#
# check the OS type 
#
	if ($^O eq "MSWin32"){
		print "OStype:$^O\n";
		use Cwd;
		$dir = getcwd;
	}else{
		print "OStype:$^O\n";
		$dir = `pwd`;
	}

print "pwd:$dir\n";

chomp ($dir);
$pdir = $dir."/"."perl";

@asystem=("mkpp.pl","mkfix.pl","mkbf.pl");
@bsystem=("mkpp.pl","mkfix.pl","mkbf.pl");
@fsystem=("mkpp.pl","mkfix.pl","mkbf.pl");
@msystem=("mkpp.pl","mkfix.pl","mkbf.pl");
@dsystem=("mkpp.pl","mkfix.pl","mkbf.pl");
@ssystem=("mkpp.pl","mkfix.pl","mkbf.pl");

&sys_check();

	if ($sys_type eq "a") {
		foreach $asys (@asystem){
			$pg_file = $pdir."/".$asys;
				unless (-f $pg_file) {
					die "$pg_file: no such file or the directory.\n";
					}
			system("perl -w $pg_file");
		}
	}
	elsif ( $sys_type eq "b") { 
		foreach $bsys (@bsystem){
			$pg_file = $pdir."/".$bsys;
				unless (-f $pg_file) {
					die "$pg_file: no such file or the directory.\n";
					}
			system("perl -w $pg_file");
		}
	}
	elsif ( $sys_type eq "f") {
		foreach $fsys (@fsystem){
			$pg_file = $pdir."/".$fsys;
				unless (-f $pg_file) {
					die "$pg_file: no such file or the directory.\n";
					}
			system("perl -w $pg_file");
		}
	}
	elsif ( $sys_type eq "m") {
		foreach $msys (@msystem){
			$pg_file = $pdir."/".$msys;
				unless (-f $pg_file) {
					die "$pg_file: no such file or the directory.\n";
					}
			system("perl -w $pg_file");
		}
	}
	elsif ( $sys_type eq "d") {
		foreach $dsys (@dsystem){
			$pg_file = $pdir."/".$dsys;
				unless (-f $pg_file) {
					die "$pg_file: no such file or the directory.\n";
					}
			system("perl -w $pg_file");
		}
	}
	elsif ( $sys_type eq "s") {
		foreach $dsys (@dsystem){
			$pg_file = $pdir."/".$dsys;
				unless (-f $pg_file) {
					die "$pg_file: no such file or the directory.\n";
					}
			system("perl -w $pg_file");
		}
	}

# End main;

sub sys_check {
	my(@tmp) = @_;

#$pdir = $dir."/"."perl";
#print "$dir \n";

	open (IN,"Diffeq.m"); 
	while (<IN>) {
		if ($. == 1){
			/type/;
			if ($` eq "a") {
				$sys_type = "a";
			}
			elsif ( $` eq "b") { 
				$sys_type = "b";
			}
			elsif ( $` eq "f") {
				$sys_type = "f";
			}
			elsif ( $` eq "m") {
				$sys_type = "m";
			}
			elsif ( $` eq "d") {
				$sys_type = "d";
			}
			elsif ( $` eq "s") {
				$sys_type = "s";
			}
			else { 
			die "Make system is terminated. The system type is not supported.\n"; 
			} 
		}
	}       
	close(IN);
}


