#
# mkfix.pl -- create the program (FIX) for calculation of the fixed point and the stability.
#
# begin main

#
# check the OS type
#
	if ($^O eq "MSWin32"){
		use Cwd;
		$dir = getcwd; 
	}else{
		$dir = `pwd`;
	}
#$dir = `pwd`;

#
# system type check
#
	&sys_check();

$prog_name = $sys_type.$sys_name.'fix';

	open (OUT_sys,">$prog_name.m");

#
# Checking the dimension of the system
#
	$dim = &ndim($dim);
	$dim = $dims -1;  # Diffeq.m 先頭の system type の記述分を取り除く．
#
# Reading the number of the system parameter in Diffeq.m
#
	$para_count = &npara()+$sys_para;


#
# mainly treatment
#

chomp ($dir);
$pdir = $dir."/".$sys_dir;

if ( $sys_type eq "a") {
	@funcs=("fpara_input.m","init_finput.m","Newton_fix_eq.m",
		"Newton_fix.m","fix_eq.m","fsysvar.m","RK.m",
		"ns_para_out.m","backup_out.m","termi_ch.m",
		"ftermi_out.m","fpredict.m",
		"detectbf.m","detectbf_eq.m",
		"locus_init.m","locus_init_eq.m","locus_graph.m",
		"fresults_out.m");
}
elsif ( $sys_type eq "b") {
	@funcs=("fpara_input.m","init_finput.m","Newton_fix.m","fsysvar.m",
		"RK.m","para_out.m","ns_para_out.m","backup_out.m","termi_ch.m",
		"ftermi_out.m","fpredict.m","fcorrect.m",
		"detectbf.m","locus_init.m","locus_graph.m","fresults_out.m");
}
elsif ( $sys_type eq "f") {
	@funcs=("fpara_input.m","init_finput.m","Newton_fix.m","fsysvar.m",
		"RK.m","ns_para_out.m","backup_out.m","termi_ch.m",
		"ftermi_out.m","fpredict.m",
		"detectbf.m","locus_init.m","locus_graph.m","fresults_out.m");
}
elsif ( $sys_type eq "m") {
	@funcs=("fpara_input.m","init_finput.m","Newton_fix.m","msysvar.m",
		"mRK.m","ns_para_out.m","backup_out.m","termi_ch.m",
		"ftermi_out.m","fpredict.m",
		"detectbf.m","locus_init.m","locus_graph.m","fresults_out.m");
}
elsif ( $sys_type eq "d") {
	@funcs=("fpara_input.m","init_finput.m","Newton_fix.m","fsysvar.m",
		"RK.m","ns_para_out.m","backup_out.m","termi_ch.m",
		"ftermi_out.m","fpredict.m","fcorrect.m",
		"detectbf.m","locus_init.m","locus_graph.m","fresults_out.m");
}
elsif ( $sys_type eq "s") {
	@funcs=("fpara_input.m","init_finput.m","Newton_fix.m","fsysvar.m",
		"RK.m","ns_para_out.m","backup_out.m","termi_ch.m",
		"ftermi_out.m","fpredict.m",
		"detectbf.m","locus_init.m","locus_graph.m","fresults_out.m");
}
else { 
        die "Make system is terminated."; 
} 

if ( $sys_type eq "a") {
	@org_funcs=("DF_eq.m","f_eq.m","Fj.m","DF.m","Eq.m");
}
elsif ($sys_type eq "m") {
	@org_funcs=("DF.m","Eq.m");
}
else { 
	@org_funcs=("Fj.m","DF.m","Eq.m");
} 

# cheching the existence of their files

if ( $sys_type eq "a") {
	$main_file = $pdir."/"."aFix.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "b") {
	$main_file = $pdir."/"."bFix.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "f") {
	$main_file = $pdir."/"."fFix.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "m") {
	$main_file = $pdir."/"."mFix.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "d") {
	$main_file = $pdir."/"."dFix.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "s") {
	$main_file = $pdir."/"."sFix.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
else{
	die "$main_file: no such file or the directory.\n";
}

foreach $func (@funcs){
	$now_file = $pdir."/".$func;
	unless (-f $now_file) {
		die "$now_file: no such file or the directory.\n";
		}
	}

foreach $org_func (@org_funcs){
	unless (-f $org_func) {
		die "$org_func: no such file or in this current directory.\n";
		}
	}

	open(IN2,"dim_syspara.txt");
		@lines = <IN2>;
	close(IN2);

#
# prepalation for replacement of fprintf statement, depending on the system. 
#
	&replace_para();
		open(SYS1,"fix1.sys");
			@syspara=<SYS1>;
		close(SYS1);
	
	&replace_state();
		open(SYS2,"fix2.sys");
			@sysstat=<SYS2>;
		close(SYS2);

	&replace_out1();
		open(SYS3,"fix3.sys");
			@sysout1=<SYS3>;
		close(SYS3);

	&replace_out2();
		open(SYS4,"fix4.sys");
			@sysout2=<SYS4>;
		close(SYS4);

	open (IN,"$main_file"); 

#
# output the fix program
#

	while (<IN>) {
    	if (/function/){
        	s/fFix/$prog_name/;
    		}	
#
# translation of the dimension of the system.
#
    	if (/^N/) {
        	s/$'/$lines[0]/;
        	s/NN/N/;
    		}
#
# translation of the dimension of the system parameter.
#
    	if (/^M/) {
        	s/$'/$lines[1]/;
        	s/MM/M/;
    		}

#
# replace of the standerd outputs depending on the system.
# (parameters)
#
		if ( /fprintf\('k:/ ){
			s/fprintf//;
			s/\(.*\)//;
			s/;//;
			print OUT_sys "$syspara[0]\n";
			}
#
# replace of the standerd outputs depending on the system.
# (state variables)
#
		elsif( /fprintf\('x:/ ){
			s/fprintf//;
			s/\(.*\)//;
			s/;//;
			print OUT_sys "$sysstat[0]";
		}	

		print OUT_sys;

	} #end while

	close(IN);

	print OUT_sys "\n";
#
# Addition of several subfunctions
#
	for($i=0;$i<=$#funcs;++$i){
		unless($i==$#funcs){	
			open (INPUT,"$pdir/$funcs[$i]");
		
			while (<INPUT>){
				print OUT_sys ;
			}	
			print OUT_sys "\n";
			close(INPUT);
		}
		else{
			open (INPUT,"$pdir/$funcs[$i]");
			
			while (<INPUT>){
				if( /fprintf\('%d/ ){
						s/fprintf//;
						s/\(.*\)//;
						s/;//;
						print OUT_sys "\t $sysout1[0]";
						print OUT_sys "\t\t $sysout1[1]";
				}	
				elsif( /fprintf\(f3out/ ){
						s/fprintf//;
						s/\(.*\)//;
						s/;//;
						print OUT_sys "\t $sysout2[0]";
						print OUT_sys "\t\t $sysout2[1]";
				}
				print OUT_sys;
			}	#endwhile
			print OUT_sys "\n";
			close(INPUT);
		}
	}		

for($j=0;$j<=$#org_funcs;++$j){
	
	open (INPUT,"$dir/$org_funcs[$j]"); 
	
	while (<INPUT>){
		print OUT_sys ;
	}	
	print OUT_sys "\n";
	close(INPUT);
}

close (OUT_sys);

#
# Deletes temporary files
#
#system("rm *.sys");


# End main;


sub sys_check {
	my(@tmp) = @_;

	open (IN,"Diffeq.m"); 
	while (<IN>) {
		if ($. == 1){
			/type/;
			if ( $` eq "a") {
				$sys_para = 0;
				$sys_type = "a";
				$sys_dir="asystem";
			}
			elsif ( $` eq "b") {
				$sys_para = 1;
				$sys_type = "b";
				$sys_dir="bsystem";
			}
			elsif ( $` eq "f") {
				$sys_para = 1;
				$sys_type = "f";
				$sys_dir="fsystem";
			}
			elsif ( $` eq "m") {
				$sys_para = 0;
				$sys_type = "m";
				$sys_dir="msystem";
			}
			elsif ( $` eq "d") {
				$sys_para = 1;
				$sys_type = "d";
				$sys_dir="dsystem";
			}
			elsif ( $` eq "s") {
				$sys_para = 3;
				$sys_type = "s";
				$sys_dir="ssystem";
			}
			else { 
			die "Make system is terminated. The type of the system don't support\n"; 
			} 
		@tmp=/:(.*?);/;
		foreach $tmp (@tmp) {
			$sys_name = $tmp;
			}
			
		}
	}       
	close(IN);
}

#
# 系の次元，パラメータの個数をチェック
#
sub ndim {
	my ($dim) = @_;

	open (IN,"Diffeq.m");
   
	while (<IN>) {
#
# Diffeq.m の行番号の読み取り
#
		$dims = $.; 
	}

	close(IN);
	
return($dim);
}

#
# パラメータ数のカウント
#
sub npara {
	my ($c) = @_;

	open (IN_eq,"Diffeq.m");

	while (<IN_eq>) {
#
# パラメータの抜き出し
#
		@paras = /\$(.*?)\$/g;
		@stok = (@stok, @paras);
		@stok = sort{$a cmp $b} @stok;
	}
   
# 登場順に格納する

	my @cuts;
	my %check;
	
	foreach my $val (@stok) {
		unless (exists $check{$val}) {
			push @cuts, $val;
			$check{$val} = 1;
			}
		}

	$c= @cuts+0;

	close(IN_eq);
   
return ($c);
}

#
# fprintf文(parameter)の書き変え
#
sub replace_para {

	my(@tmp) = @_;

	open (fix_sys1,">fix1.sys");
	
	open (npara_IN,"npara.txt");

	print fix_sys1 "fprintf('";

	while (<npara_IN>) {
		@tmp=/'(.*?)'/;
		foreach $tmp (@tmp) {
			$para_name = $tmp;
			print fix_sys1 "$para_name:%f ";
		}
	}
	
	print fix_sys1 "\\n',";
	
	for($i=1;$i<=$para_count;++$i){
		print fix_sys1 "para($i)";
			unless($i==$para_count){print fix_sys1 ",";}
		 }

	print fix_sys1 ");";

	close (npara_IN);
	close (fix_sys1);
}

#
# fprintf文(states)の書き変え
#
sub replace_state {

	open (fix_sys2,">fix2.sys");
	print fix_sys2 "fprintf('x :";
	
	for($i=1;$i<=$dim;++$i){
		print fix_sys2 " %e";
		unless($i==$dim){print fix_sys2 ",";}
		}
	
	print fix_sys2 "\\n',";
	
	for($i=1;$i<=$dim;++$i){
		print fix_sys2 "x($i)";
			unless($i==$dim){print fix_sys2 ",";}
		 }

	print fix_sys2 ");";

close(fix_sys2);
}

#
# fprintf文(出力)の書き変え (No.1)
#
sub replace_out1 {

open (fix_sys3,">fix3.sys");

	print fix_sys3 "fprintf('%d %e %e / ";
	
	for($k=1;$k<=$dim;++$k){print fix_sys3 "%e ";}
	
	print fix_sys3 "| ";
	
	for($k=1;$k<=$dim;++$k){print fix_sys3 "%e %e %e | ";}
	
	unless ( $sys_type eq "a") {
		print fix_sys3 "( %e )\\n',...\n";
	}
	else {
		print fix_sys3 "( %e ) %e\\n',...\n";
	}
	print fix_sys3 "\t iterN,para(ip(1)),para(ip(2)),";
	
	for($k=1;$k<=$dim;++$k){ print fix_sys3 "x($k),"; }
	for($k=1;$k<=$dim;++$k){ print fix_sys3 "real(chara($k)),imag(chara($k)),abs(chara($k)),"; }
	
	unless ( $sys_type eq "a") {
		print fix_sys3 "det_value);\n";
	}
	else { 
		print fix_sys3 "det_value,tau);\n";
	} 

close(fix_sys3);

}

#
# fprintf文(出力)の書き変え (No.1)
#
sub replace_out2 {

open (fix_sys4,">fix4.sys");
				
	print fix_sys4 "fprintf(f3out,'%d %e %e / ";
	
	for($k=1;$k<=$dim;++$k){ print fix_sys4 "%e "; }

	print fix_sys4 "| ";

	for($k=1;$k<=$dim;++$k){ print fix_sys4 "%e %e %e | "; }

	unless ( $sys_type eq "a") {
		print fix_sys4 "( %e )\\n',...\n";
	}
	else {
		print fix_sys4 "( %e ) %e\\n',...\n";
	}
	print fix_sys4 "\t iterN,para(ip(1)),para(ip(2)),";
		
	for($k=1;$k<=$dim;++$k){ print fix_sys4 "x($k),"; }
	for($k=1;$k<=$dim;++$k){ print fix_sys4 "real(chara($k)),imag(chara($k)),abs(chara($k)),"; }

	unless ( $sys_type eq "a") {
		print fix_sys4 "det_value);\n";
	}
	else { 
		print fix_sys4 "det_value,tau);\n";
	} 

close(fix_sys4);
}

