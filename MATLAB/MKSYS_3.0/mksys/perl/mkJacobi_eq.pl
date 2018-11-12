#
# mkJacobi_eq.pl -- Making BF Jacobian matrix of Newton methods for analysing equilibrium point
#

&mkf();
&mkDF();
&mkDFDP();
&mkD2FDXDX();
&mkD2FDXDP();

#
# mkfeq.pl --transrate of the system equations from text to M-file
#
# mkpp.txt からの M-file 化
#

sub mkf {
	open (OUT,">f_eq.m"); 

	print OUT "%\n";
	print OUT "% system equations; f_eq.m \n";
	print OUT "%\n";
	print OUT "function xdot = f_eq(para,x)\n";
	print OUT "global N\n";
	print OUT "\n";

	#
	# mkpp.txt の M-file 化
	#

		print OUT "\t";
		print OUT "xdot=zeros(N,1); % Initializing state\n";
	
		open (IN,"mkpp.txt");

	while (<IN>) {
		print OUT "\t";
		print OUT;
	}

	close (IN);

	print OUT "\n";
	print OUT "% end function\n";
	close (OUT);
}

# mkDF_eq.pl --transrate of the system equations from text to M-file
#
# fix_df.txt の M-file 化
#

sub mkDF {
	open (OUT,">DF_eq.m"); 
	open (IN,"DF_eq.txt");

	print OUT "%\n";
	print OUT "% Jacobian matrix using at Newton's method\n";
	print OUT "% of equilibrium points\n";
	print OUT "%\n";
	print OUT "function A=DF_eq(para,x)\n";
	print OUT "\n";

	#
	# DF_eq.txt の M-file 化
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

		print OUT "\t";
		print OUT;
	}
	print OUT "\n";
	print OUT "%end function\n";

	close (IN);
	close (OUT);
}

# mkDFDP.pl -- Making a M-file with respect to derivatives of parameters
#
# dfdp.txt の M-file 化
#

sub mkDFDP {
	open (OUT,">dFdP_eq.m"); 
	open (IN,"dfdp.txt");

	print OUT "%\n";
	print OUT "% Derivative of parameters.\n";
	print OUT "%\n";
	print OUT "function A1=dFdP_eq(para,x)\n";
	print OUT "global subptype\n";
	print OUT "\n";
	print OUT "switch subptype\n";

	#
	# dfdp.txt の M-file 化
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

# mkD2FDXDX_eq.pl --transrate of the 2nd derivatives with respect to state variables
#
# d2fdxdx.txt の M-file 化
#

sub mkD2FDXDX {
	open (OUT,">d2fdxdx_eq.m"); 
	open (IN,"d2fdxdx.txt");

	print OUT "%\n";
	print OUT "% 2nd Derivative of state variables.\n";
	print OUT "%\n";
	print OUT "function d2fdxdx=d2fdxdx_eq(para,x)\n";
	print OUT "\n";

	#
	# d2fdxdx.txt の M-file 化
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
	print OUT "\n";
	print OUT "\n";
	print OUT "%end function\n";
	print OUT "\n";

	close (IN);
	close (OUT);
	
}

# mkD2FDXDP_eq.pl --transrate of the 2nd derivatives with respect to state variables and parameters
#
# d2fdxdp.tex の M-file 化
#

sub mkD2FDXDP {
	open (OUT,">d2fdxdp_eq.m"); 
	open (IN,"d2fdxdp.txt");

	print OUT "%\n";
	print OUT "% Derivative of parameters.\n";
	print OUT "%\n";
	print OUT "function d2fdxdp=d2fdxdp_eq(para,x)\n";
	print OUT "global subptype\n";
	print OUT "\n";
	print OUT "switch subptype\n";
	print OUT "\n";

	#
	# d2fdxdp_eq.txt の M-file 化
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
