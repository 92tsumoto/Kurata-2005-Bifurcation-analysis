# mkEq.pl --transrate of the system equations from text to M-file
#
# sys{pp,fix,bf}.txt の M-file 化
#

open (OUT,">Eq.m"); 

print OUT "%\n";
print OUT "% system equations; Eq.m \n";
print OUT "%\n";
print OUT "function xdot=Eq(t,x,para)\n";
print OUT "global ptype subptype\n";
print OUT "global N\n";
print OUT "%\n";
print OUT "switch ptype\n";

#
# syspp.txt の M-file 化
#

	print OUT "\t case 1 % PP\n";
	print OUT "\t\t xdot=zeros(N,1); % Initializing state\n";
	
	&mkpp(); 

	open (IN,"mkpp.txt");

	while (<IN>) {
		print OUT "\t\t ";
		print OUT;
	}

	close (IN);

#
# sysfix.txt の M-file 化
#

	print OUT "\t case 2 % FIX\n";
	print OUT "\t\t xdot=zeros(N*(N+1),1); % Initializing state\n";
	&mkfix();

	open (IN,"mkfix.txt");

	while (<IN>) {
		print OUT "\t\t ";
		print OUT;
	}
	
	close (IN);

#
# sysbf.txt の M-file 化
#

	print OUT "\t case 3 % BF\n";
	print OUT "\t\t xdot=zeros(N*(N+1)*(N+1)+N,1); % Initializing state\n";
	
	&mkbf();
	&mkbfp();
	
	open (IN,"mkbf.txt");

	while (<IN>) {
		print OUT "\t\t ";
		print OUT;
	}
	close (IN);

	print OUT "\t\t switch subptype % BF\n";
	
	open (IN,"mkbfp.txt");

	while (<IN>) {
		print OUT "\t\t\t ";
		print OUT;
	}
	close (IN);

print OUT "\t\t end\n";
print OUT "end\n";
close (OUT);

#
# stiff-fix.txt の M-file 化
#

open (OUT,">Fj.m"); 

print OUT "%\n";
print OUT "% Jacobian matrix of stiff ode-solver system; Fj.m \n";
print OUT "%\n";
print OUT "function J=Fj(t,x,para)\n";

&mkfstiff();

open (IN,"mkfstiff.txt");

	while (<IN>) {
		print OUT "\t ";
		print OUT;
	}

close (IN);

#
# ------------------------------------------------------------------
# 以下 subroutein
#
#

sub mkpp {

	open (OUT2,">mkpp.txt");

	open (IN,"syspp.txt");

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
		print OUT2;
	}
	close (IN);
	close (OUT2);
}

sub mkfix {
	
	open (OUT2,">mkfix.txt");

	open (IN,"sysfix.txt");

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
		print OUT2;
	}
	close (IN);
	close (OUT2);
}

sub mkbf {
	
	open (OUT2,">mkbf.txt");

	open (IN,"sysbf.txt");

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
		print OUT2;
	}
	close (IN);
	close (OUT2);
}

sub mkbfp {
	
	open (OUT2,">mkbfp.txt");

	open (IN,"sysbfp.txt");

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
		print OUT2;
	}
	close (IN);
	close (OUT2);
}

sub mkfstiff {

	open (OUT2,">mkfstiff.txt");

	open (IN,"stiff-fix.txt");

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
		print OUT2;
	}
	close (IN);
	close (OUT2);
}

