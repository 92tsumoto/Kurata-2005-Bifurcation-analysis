#
# mkJacobi.pl -- Making BF Jacobian matrix of Newton methods
#                for analysing Limit cycle or periodic solution
#

#
# Checking the type of the system
#
	&sys_check();

	#use Switch; # additional package

&mkDT();
&mkDTDP();
&mkDKaiDX();

if ($sys_type eq "a"){
	&mkDKaiDtau();
}

# mkDT.pl --transrate of the system equations from text to M-file
#
# fix_df.txt の M-file 化
#

sub mkDT {
	open (OUT,">DF.m"); 
	open (IN,"fix_df.txt");

	print OUT "%\n";
	print OUT "% Jacobian matrix using at Newton's method\n";
	print OUT "%\n";
	print OUT "function A = DF(x)\n";
	print OUT "\n";

	#
	# fix_df.txt の M-file 化
	#

	while (<IN>) {
		#
		# 状態 x[0-1] から x([0-9]) へ置換
		#
		s/x([1-9][0-9]*)/x_{$&)/g;
		s/{x/(/g;
		s/_//g;

		print OUT;
	}
	print OUT "\n";
	print OUT "%end function\n";

	close (IN);
	close (OUT);
}

# mkDTDP.pl -- Making a M-file with respect to derivatives of parameters
#
# dphidp.txt の M-file 化
#

sub mkDTDP {
	open (OUT,">dTdP.m"); 
	open (IN,"dphidp.txt");

	print OUT "%\n";
	print OUT "% Derivative of parameters.\n";
	print OUT "%\n";
	print OUT "function A1 = dTdP(x)\n";
	print OUT "\n";

	#
	# dphidp.txt の M-file 化
	#

	while (<IN>) {
		#
		# 状態 x[0-1] から x([0-9]) へ置換
		#
		s/x([1-9][0-9]*)/x_{$&)/g;
		s/{x/(/g;
		s/_//g;

		print OUT;
	}
	print OUT "%end function\n";

	close (IN);
	close (OUT);
}

# mkKaiDX.pl --transrate of the 2nd derivatives with respect to state variables
#
# d2fdxdx.txt の M-file 化
#

sub mkDKaiDX {
	open (OUT,">dkaidx_dkaidp.m"); 
	open (IN,"dKaidx_dKaidp.txt");

	print OUT "%\n";
	print OUT "% 2nd Derivative of state variables and a parameter.\n";
	print OUT "%\n";
	print OUT "function dKaidxdKaidp=dkaidx_dkaidp(x)\n";
	print OUT "\n";

	#
	# dkaidx.txt の M-file 化
	#

	while (<IN>) {
	#
	# 状態 x[0-1] から x([0-9]) へ置換
	#
		s/x([1-9][0-9]*)/x_{$&)/g;
		s/{x/(/g;
		s/_//g;

		print OUT;
	}
	print OUT "\n";
	print OUT "%end function\n";
	print OUT "\n";

	close (IN);
	close (OUT);
	
}

# mkDKaiDtheta.pl --transrate of the 2nd derivatives with respect
# to state variables and parameters
#
# dkaidp.tex の M-file 化
#

sub mkDKaiDThi {
	open (OUT,">dKaidthi.m"); 
	open (IN,"dKaidthi.txt");

	print OUT "%\n";
	print OUT "% Derivative of angle.\n";
	print OUT "%\n";
	print OUT "function dKaidthi = dKaidthe(para,x,theta)\n";
	print OUT "global subptype\n";
	print OUT "\n";
	print OUT "switch subptype\n";
	print OUT "\n";

	#
	# dKaidp.txt の M-file 化
	#

	while (<IN>) {
	#
	# 状態 x[0-1] から x([0-9]) へ置換
	#
		s/x([1-9][0-9]*)/x_{$&)/g;
		s/{x/(/g;
		s/_//g;

	#
	# パラメータ para[0-1] から para([0-9]) へ置換
	#
		s/para([1-9][0-9]*)/para_{$&)/g;
		s/{para/(/g;
		s/_//g;

		print OUT;
	}
	print OUT "end\n";
	print OUT "\n";
	print OUT "\n";
	print OUT "%end function\n";
	print OUT "\n";

	close (IN);
	close (OUT);

}

sub mkDKaiDtau {
	open (OUT,">F0.m"); 

	print OUT "function ff0 = F0(u)\n";
	print OUT "%\n";
	print OUT "% Derivative of characteristic equation\n";
	print OUT "% with respect to tau.\n";
	print OUT "%\n";
	print OUT "\n";

#
# Checking the dimension of the system
#
	$dim = &ndim();
	$dim = $dims -1;  # Diffeq.m 先頭の system type の記述分を取り除く．

	for($i=1;$i<=$dim;++$i){
		for($j=1;$j<=$dim;++$j){
			$m = $dim+$dim*($i-1)+$j;
			print OUT "\t ff0($j,$i)= u($m);\n";
		}
	}

	print OUT "\n";
	print OUT "%end function\n";
	print OUT "\n";

	close (IN);
	close (OUT);

}

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
# 系のタイプをチェック
#
sub sys_check {

	open (IN,"Diffeq.m"); 
	while (<IN>) {
		if ($. == 1){
			/type/;
			if ($` eq "a") {
				$sys_type = "a";
			}
			elsif (	$` eq "b") { 
				$sys_type = "b";
			}
			elsif ( $` eq "f") {
				$sys_type = "f";
			}
			elsif (	$` eq "m") {
				$sys_type = "m";
			}
			elsif (	$` eq "d") {
				$sys_type = "d";
			}
			elsif (	$` eq "s") {
				$sys_type = "s";
			}
			else { 
				die "Make system is terminated. The type of the system don't support\n"; 
			} 
		}
	}	
	close(IN);
}

