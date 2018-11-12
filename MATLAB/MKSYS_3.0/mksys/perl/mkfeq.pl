#
# mkfeq.pl --transrate of the system equations from text to M-file
#
# mkpp.txt の M-file 化
#

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

open (OUT2,">b_eq.m"); 

print OUT2 "%\n";
print OUT2 "% system equations; b_eq.m \n";
print OUT2 "%\n";
print OUT2 "function xdot = b_eq(para,x,theta)\n";
print OUT2 "global N\n";
print OUT2 "\n";

	print OUT2 "\t";
	print OUT2 "xdot=zeros(N+1,1); % Initializing state\n";
	
	open (IN,"b_eq.txt");

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
		print OUT2 "\t";
		print OUT2;
	}

	close (IN);

print OUT2 "\n";
print OUT2 "% end function\n";
close (OUT2);

open (OUT3,">b_eq_hp.m"); 

print OUT3 "%\n";
print OUT3 "% system equations; b_eq.m \n";
print OUT3 "%\n";
print OUT3 "function xdot = b_eq_hp(para,x,theta)\n";
print OUT3 "global N\n";
print OUT3 "\n";

	print OUT3 "\t";
	print OUT3 "xdot=zeros(N+2,1); % Initializing state\n";
	
	open (IN,"b_eq_Hopf.txt");

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
		print OUT3 "\t";
		print OUT3;
	}

	close (IN);

print OUT3 "\n";
print OUT3 "% end function\n";
close (OUT3);

