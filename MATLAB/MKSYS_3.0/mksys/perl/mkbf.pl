#
# mkbf.pl -- create the program (BF) for calculation of the fixed point and the stability.
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
	#$dir = `pwd`;

#print "pwd:$dir\n";

	&sys_check();

$prog_name = $sys_type.$sys_name.'bf';

	open (OUT_sys,">$prog_name.m");

#
# Checking the dimension of the system
#
	$dim = &ndim($dim);
	$dim = $dims -1;  # Remove the description of "system type" in header of Diffeq.m
#
# Reading the number of the system parameter in Diffeq.m
#
	$para_count = &npara()+$sys_para;

#
# making a file of "variationalEq.m" and other functions
#
	if ( $sys_type eq "s") {
		&mkvari2($para_count);
		&mkdevx1($dim);
		&mkdevx2($dim);
		&mkdevp($dim);
	}
	else{
		&mkvari($para_count);
	}

#
# mainly treatment
#

chomp ($dir);
$pdir = $dir."/".$sys_dir;

if ( $sys_type eq "a") {
	@funcs=("bpara_input.m","init_binput.m","Newton_bf_eq.m","Newton_bf_HP.m",
		"Newton_bf.m","Newton_bf_NS.m","fsysvar.m","RK.m","backup_out2.m",
		"grad_ch.m","epara_out.m","width_adjust.m","width_adjust_eq.m",
		"predict.m","correct.m","iter_case.m","div_case.m","termi_out.m","termi_ch.m",
		"dChara_eq.m","dChara_eq_hopf.m",
		"dKaidtau.m","dKaidxdp.m","dKaidxdp_SD.m","dKaidxdp_NS.m",
		"fix_eq.m","init_graph.m","rout_graph.m","out_graph.m","bdisp_out.m","bresults_out.m");
	}
elsif ( $sys_type eq "b") {
	@funcs=("bpara_input.m","init_binput.m","Newton_bf.m","Newton_bf_NS.m",
		"fsysvar.m","RK.m","backup_out2.m","grad_ch.m","epara_out.m",
		"width_adjust.m","predict.m","correct.m","iter_case.m","div_case.m","termi_out.m","termi_ch.m",
		"dKaidxdp.m","dKaidxdp_NS.m",
		"init_graph.m","rout_graph.m","out_graph.m","bdisp_out.m","bresults_out.m");
	}
elsif ( $sys_type eq "f") {
	@funcs=("bpara_input.m","init_binput.m","Newton_bf.m","Newton_bf_NS.m",
		"fsysvar.m","RK.m","backup_out2.m","grad_ch.m","epara_out.m",
		"width_adjust.m","predict.m","correct.m","iter_case.m","div_case.m","termi_out.m","termi_ch.m",
		"dKaidxdp.m","dKaidxdp_NS.m",
		"init_graph.m","rout_graph.m","out_graph.m","bdisp_out.m","bresults_out.m");
	}
elsif ( $sys_type eq "m") {
	@funcs=("bpara_input.m","init_binput.m","Newton_bf.m","Newton_bf_NS.m",
		"msysvar.m","mRK.m","backup_out2.m","grad_ch.m","epara_out.m",
		"width_adjust.m","predict.m","correct.m","iter_case.m","div_case.m","termi_out.m","termi_ch.m",
		"dKaidxdp.m","dKaidxdp_NS.m",
		"init_graph.m","rout_graph.m","out_graph.m","bdisp_out.m","bresults_out.m");
	}
elsif ( $sys_type eq "d") {
	@funcs=("bpara_input.m","init_binput.m","Newton_bf.m","Newton_bf_NS.m",
		"fsysvar.m","RK.m","backup_out2.m","grad_ch.m","epara_out.m",
		"width_adjust.m","predict.m","correct.m","iter_case.m","div_case.m","termi_out.m","termi_ch.m",
		"dKaidxdp.m","dKaidxdp_NS.m",
		"init_graph.m","rout_graph.m","out_graph.m","bdisp_out.m","bresults_out.m");
	}
elsif ( $sys_type eq "s") {
	@funcs=("bpara_input.m","init_binput.m","Newton_bf.m","Newton_bf_NS.m",
		"fsysvar.m","RK.m","backup_out2.m","grad_ch.m","epara_out.m",
		"width_adjust.m","predict.m","correct.m","iter_case.m","div_case.m","termi_out.m","termi_ch.m",
		"dKaidxdp.m","dKaidxdp_NS.m",
		"init_graph.m","rout_graph.m","out_graph.m","bdisp_out.m","bresults_out.m");
	}
else { 
	die "Make system is terminated."; 
} 

if ( $sys_type eq "a") {
	@org_funcs=("f_eq.m","DF_eq.m","dFdP_eq.m","d2fdxdx_eq.m","d2fdxdp_eq.m",
				"F0.m","DF.m","dTdP.m","dkaidx_dkaidp.m","variational_Eq.m","Eq.m");
}
elsif ( $sys_type eq "s") {
	@org_funcs=("DF.m","dTdP.m","dkaidx_dkaidp.m","variational_Eq.m","mkdev.m","mkdev2.m","mkdev3.m","Eq.m");
}
else {
	@org_funcs=("DF.m","dTdP.m","dkaidx_dkaidp.m","variational_Eq.m","Eq.m");
}

# cheching the existence of their files

if ( $sys_type eq "a") {
	$main_file = $pdir."/"."aBF.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "b") {
	$main_file = $pdir."/"."bBF.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "f") {
	$main_file = $pdir."/"."fBF.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "m") {
	$main_file = $pdir."/"."mBF.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "d") {
	$main_file = $pdir."/"."mBF.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
}
elsif ( $sys_type eq "s") {
	$main_file = $pdir."/"."sBF.m";
		unless (-f $main_file){
			die "$main_file: no such file or the directory.\n";
		}
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
		open(SYS1,"bf1.sys");
			@syspara=<SYS1>;
		close(SYS1);
	
	&replace_state();
		open(SYS2,"bf2.sys");
			@sysstat=<SYS2>;
		close(SYS2);

	&replace_out1();
		open(SYS3,"bf3.sys");
			@sysout1=<SYS3>;
		close(SYS3);

	&replace_out2();
		open(SYS4,"bf4.sys");
			@sysout2=<SYS4>;
		close(SYS4);
	
	&replace_out3();
		open(SYS5,"bf5.sys");
			@sysout3=<SYS5>;
		close(SYS5);


	open (IN,"$main_file"); 

#
# output the fix program
#

	while (<IN>) {
    	if (/function/){
        	s/fBF/$prog_name/;
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
		elsif( /fprintf\('x :/ ){
			s/fprintf//;
			s/\(.*\)//;
			s/;//;
			print OUT_sys "$sysstat[0]\n";
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
				elsif( /fprintf\(bf_out1/ ){
						s/fprintf//;
						s/\(.*\)//;
						s/;//;
						print OUT_sys "\t $sysout2[0]";
						print OUT_sys "\t\t $sysout2[1]";
				}
				elsif( /fprintf\(bf_out2/ ){
						s/fprintf//;
						s/\(.*\)//;
						s/;//;
						print OUT_sys "\t $sysout3[0]";
						print OUT_sys "\t\t $sysout3[1]";
				}
				print OUT_sys;
			}	#endwhile
			print OUT_sys "\n";
			close(INPUT);
		}
	}		

for($j=0;$j<=$#org_funcs;++$j){
	
	open (INPUT,"$dir/$org_funcs[$j]"); 
	
	print "$org_funcs[$j]\n";

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
				$sys_para = 0;
				$sys_type = "d";
				$sys_dir="dsystem";
			}
			elsif ( $` eq "s") {
				$sys_para = 3;
				$sys_type = "s";
				$sys_dir="ssystem";
			}
			else { 
			die "Make system is terminated. The system type is not supported.\n"; 
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
# main 内，fprintf文(parameter部分)の書き変え
#
sub replace_para {

	my(@tmp) = @_;

	open (bf_sys1,">bf1.sys");
	
	open (npara_IN,"npara.txt");

	print bf_sys1 "fprintf('";

	while (<npara_IN>) {
		@tmp=/'(.*?)'/;
		foreach $tmp (@tmp) {
			$para_name = $tmp;
			print bf_sys1 "$para_name:%f ";
		}
	}
	
	print bf_sys1 "\\n',";
	
	for($i=1;$i<=$para_count;++$i){
		print bf_sys1 "para($i)";
			unless($i==$para_count){print bf_sys1 ",";}
		 }

	print bf_sys1 ");";

	close (npara_IN);
	close (bf_sys1);
}

#
# main 内，fprintf文(states 部分)の書き変え
#
sub replace_state {

	open (bf_sys2,">bf2.sys");
	
	print bf_sys2 "fprintf('x :";
		for($j=1;$j<=$dim;++$j){
			print bf_sys2 " %e";
				unless($j==$dim){print bf_sys2 ",";}
			}
			print bf_sys2 "\\n',";
	
		for($j=1;$j<=$dim;++$j){
			print bf_sys2 "x($j)";
				unless($j==$dim){print bf_sys2 ",";}
		 	}
			print bf_sys2 ");";

close(bf_sys2);
}

#
# fprintf文(出力)の書き変え (No.1)
#
sub replace_out1 {

open (bf_sys3,">bf3.sys");

	print bf_sys3 "fprintf('%d ) %e %e / ";
	
	for($k=1;$k<=$dim;++$k){print bf_sys3 "%e ";}
	
	print bf_sys3 "| ";
	
	for($k=1;$k<=$dim;++$k){print bf_sys3 "%e %e %e | ";}
	
	unless ( $sys_type eq "a") {
		print bf_sys3 "( %e )\\n',...\n";
	}
	else {
		print bf_sys3 "( %e ) %e\\n',...\n";
	}
		
	print bf_sys3 "\t iterN,para(var1st(1)),para(var1st(2)),";
	
	for($k=1;$k<=$dim;++$k){ print bf_sys3 "x($k),"; }
	for($k=1;$k<=$dim;++$k){ print bf_sys3 "real(chara($k)),imag(chara($k)),abs(chara($k)),"; }
	
	unless ( $sys_type eq "a") {
		print bf_sys3 "det_value);\n";
	}
	else {
		print bf_sys3 "det_value,tau);\n";
	}
		
close(bf_sys3);

}

#
# fprintf文(出力)の書き変え (No.1)
#
sub replace_out2 {

open (bf_sys4,">bf4.sys");
				
	print bf_sys4 "fprintf(bf_out1,'%d) %e %e / ";
	
	for($k=1;$k<=$dim;++$k){ print bf_sys4 "%e "; }

	print bf_sys4 "| ";

	for($k=1;$k<=$dim;++$k){ print bf_sys4 "%e %e %e | "; }

	unless ( $sys_type eq "a") {
		print bf_sys4 "( %e )\\n',...\n";
	}
	else {
		print bf_sys4 "( %e ) %e\\n',...\n";
	}

	print bf_sys4 "\t iterN,para(var1st(1)),para(var1st(2)),";
		
	for($k=1;$k<=$dim;++$k){ print bf_sys4 "x($k),"; }
	for($k=1;$k<=$dim;++$k){ print bf_sys4 "real(chara($k)),imag(chara($k)),abs(chara($k)),"; }

	unless ( $sys_type eq "a") {
		print bf_sys4 "det_value);\n";
	}
	else {
		print bf_sys4 "det_value,tau);\n";
	}

close(bf_sys4);
}

#
# fprintf文(出力)の書き変え (No.2)
#
sub replace_out3 {

open (bf_sys5,">bf5.sys");
				
	print bf_sys5 "fprintf(bf_out2,'%d) %e %e / ";
	
	for($k=1;$k<=$dim;++$k){ print bf_sys5 "%e "; }

	print bf_sys5 "| ";

	for($k=1;$k<=$dim;++$k){ print bf_sys5 "%e %e %e | "; }

	unless ( $sys_type eq "a") {
		print bf_sys5 "( %e )\\n',...\n";
	}
	else {
		print bf_sys5 "( %e ) %e\\n',...\n";
	}

	print bf_sys5 "\t iterN,para(var1st(1)),para(var1st(2)),";
		
	for($k=1;$k<=$dim;++$k){ print bf_sys5 "x($k),"; }
	for($k=1;$k<=$dim;++$k){ print bf_sys5 "real(chara($k)),imag(chara($k)),abs(chara($k)),"; }

	unless ( $sys_type eq "a") {
		print bf_sys5 "det_value);\n";
	}
	else {
		print bf_sys5 "det_value,tau);\n";
	}

close(bf_sys5);
}

#
# variationalEq.m の書きだし．
#
sub mkvari {

	my ($para_count) = @_;

	open (vari_out,">variational_Eq.m");
	
	print vari_out "%\n";
	print vari_out "% Determination of which the variational equations are used\n";
	print vari_out "%\n";
	print vari_out "function variational_Eq(ip)\n";
	print vari_out "\n";
	print vari_out "global subptype\n";
	print vari_out "\n";
	print vari_out "\t switch ip(1)\n";

	for($i=1;$i<=$para_count;++$i){
		print vari_out "\t\t case $i\n";
			print vari_out "\t\t\t subptype=3$i;\n";
	}
	print vari_out "\t end\n";
	print vari_out "\n";
	print vari_out "%endfunctions\n";

close(vari_out);
}

#
# variationalEq.m の書きだし．
#
sub mkvari2 {

	my ($para_count) = @_;

	open (vari_out,">variational_Eq.m");
	
	print vari_out "%\n";
	print vari_out "% Determination of which the variational equations are used\n";
	print vari_out "%\n";
	print vari_out "function variational_Eq(ip)\n";
	print vari_out "\n";
	print vari_out "global subptype M\n";
	print vari_out "\n";
	print vari_out "\t if ip(1) == M-1\n";
	print vari_out "\t\t para_type = M-2;\n";
	print vari_out "\t else\n";
	print vari_out "\t\t para_type = ip(1);\n";
	print vari_out "\t end\n";
	print vari_out "\n";
	print vari_out "\t switch ip(1)\n";

	for($i=1;$i<=$para_count;++$i){
		print vari_out "\t\t case $i\n";
			if($i==$para_count-1){
				$j=$i-1;
				print vari_out "\t\t\t subptype=3$j;\n";
			} 
			else {
				print vari_out "\t\t\t subptype=3$i;\n";
			}
	}
	print vari_out "\t end\n";
	print vari_out "\n";
	print vari_out "%endfunctions\n";

close(vari_out);
}

#
# Outputs mkdev1.m 
#
sub mkdevx1 {

	my ($dim) = @_;

	open (dev_out,">mkdev.m");
	
	print dev_out "%\n";
	print dev_out "% Making the 2nd derivatives of the Poincare map\n";
	print dev_out "% with respect to state variables\n";
	print dev_out "%\n";
	print dev_out "function ddx1 = mkdev(mkddx,ddx0,df0,Df0)\n";
	print dev_out "\n";

	for($i=1;$i<=$dim;++$i){
		$k=1+($i-1)*$dim;
		$j=$i*$dim;
		print dev_out "\t q$i = mkddx($k:$j,:);\n";
	}
	print dev_out "\t q0 = [";
	for($i=1;$i<=$dim;++$i){
		print dev_out "q$i(:)";
		if($i!=$dim){ print dev_out " ";}
	}
	print dev_out "]*df0;\n";
	print dev_out "\n";

	for($i=1;$i<=$dim;++$i){
		$k=1+($i-1)*$dim;
		$j=$i*$dim;
		print dev_out "\t q$i = Df0*ddx0($k:$j,:);\n";
	}
	print dev_out "\t ddx1 = q0 + [";
	for($i=1;$i<=$dim;++$i){
		print dev_out "q$i";
		if($i!=$dim){ print dev_out ";";}
	}
	print dev_out "];\n";
	print dev_out "\n";

	print dev_out "%endfunctions\n";

close(dev_out);
}

#
# Outputs mkdev2.m 
#
sub mkdevx2 {

	my ($dim) = @_;

	open (dev_out,">mkdev2.m");
	
	print dev_out "%\n";
	print dev_out "% Making the 2nd derivatives of the Poincare map\n";
	print dev_out "% with respect to state variables\n";
	print dev_out "%\n";
	print dev_out "function ddx2 = mkdev2(mkddx,ddx1,df0,Df0,Df1)\n";
	print dev_out "\n";

	for($i=1;$i<=$dim;++$i){
		$k=1+($i-1)*$dim;
		$j=$i*$dim;
		print dev_out "\t q$i = mkddx($k:$j,:);\n";
	}
	print dev_out "\t q0 = [";
	for($i=1;$i<=$dim;++$i){
		print dev_out "q$i(:)";
		if($i!=$dim){ print dev_out " ";}
	}
	print dev_out "]*(Df0*df0);\n";
	print dev_out "\n";

	for($i=1;$i<=$dim;++$i){
		$k=1+($i-1)*$dim;
		$j=$i*$dim;
		print dev_out "\t q$i = Df1*ddx1($k:$j,:);\n";
	}
	print dev_out "\t ddx2 = q0 + [";
	for($i=1;$i<=$dim;++$i){
		print dev_out "q$i";
		if($i!=$dim){ print dev_out ";";}
	}
	print dev_out "];\n";
	print dev_out "\n";

	print dev_out "%endfunctions\n";

close(dev_out);
}

#
# Outputs mkdev3.m 
#
sub mkdevp {

	my ($dim) = @_;

	open (dev_out,">mkdev3.m");
	
	print dev_out "%\n";
	print dev_out "% Making the 2nd derivatives of the Poincare map\n";
	print dev_out "% with respect to state variables and parameter.\n";
	print dev_out "%\n";
	print dev_out "function rr = mkdev3(d2soldx2_0,dp0)\n";
	print dev_out "\n";

	for($i=1;$i<=$dim;++$i){
		$k=1+($i-1)*$dim;
		$j=$i*$dim;
		print dev_out "\t r$i = d2soldx2_0($k:$j,:)*dp0;\n";
	}
	print dev_out "\t rr = [";
	for($i=1;$i<=$dim;++$i){
		print dev_out "r$i";
		if($i!=$dim){ print dev_out " ";}
	}
	print dev_out "];\n";
	print dev_out "\n";

	print dev_out "%endfunctions\n";

close(dev_out);
}

