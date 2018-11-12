# mksys.pl --Make system from standerd input to output

#
# check the OS type 
#
open (OUT2,">ostype.txt");
	print OUT2 "$^O\n";
close(OUT2);

#
# Checking the type of the system
#
	&sys_check();

#use Switch; # additional package

	if ($sys_type eq "a"){
		open (OUT,">mkasys.m"); 
			}
	elsif (	$sys_type eq "b") { 
		open (OUT,">mkbsys.m"); 
	}
	elsif ( $sys_type eq "f") {
		open (OUT,">mkfsys.m"); 
	}
	elsif (	$sys_type eq "m") {
		open (OUT,">mkmsys.m"); 
	}
	elsif (	$sys_type eq "d") {
		open (OUT,">mkdsys.m"); 
	}
	elsif (	$sys_type eq "s") {
		open (OUT,">mkssys.m"); 
	}
	else { 
		die "Make system is terminated. The type of the system don't support\n"; 
	} 

#
# Checking the dimension of the system
#
	$dim = &ndim();
	$dim = $dims -1;  # Diffeq.m 先頭の system type の記述分を取り除く．

#
# Reading the number of the system parameter in Diffeq.m
#
	$para_count = &npara($c)+$sys_para;

#
# Dimension of the system and including the parametes
#

open (OUT2,">dim_syspara.txt");
	print OUT2 "N=$dim; % Dimension of the system\n";
	print OUT2 "M=$para_count; % The number of the system parameters\n";
close(OUT2);

#
# Output of first part of M-file mk{a,b,f,m,d}sys.m
#
print OUT "%\n";
print OUT "% Main program; MKSYS \n";
print OUT "%\n";
	if ($sys_type eq "a"){
		print OUT "function mkasys()\n";
			}
	elsif (	$sys_type eq "b") { 
		print OUT "function mkbsys()\n";
	}
	elsif ( $sys_type eq "f") {
		print OUT "function mkfsys()\n";
	}
	elsif (	$sys_type eq "m") {
		print OUT "function mkmsys()\n";
	}
	elsif (	$sys_type eq "d") {
		print OUT "function mkdsys()\n";
	}
	elsif (	$sys_type eq "s") {
		print OUT "function mkssys()\n";
	}
	else { 
		die "Make system is terminated. The type of the system don't support\n"; 
	} 
print OUT "global fout\n";
print OUT "global xdot\n";
print OUT "global N M\n";
print OUT "N=$dim; % Dimension of the system\n";
print OUT "M=$para_count; % The number of the system parameters\n";
$dim_max=$dim*$dim*$dim+2*$dim*$dim+2*$dim; 
print OUT "xdot=zeros($dim_max,$para_count);\n";

#
# Symbolized the state variables
# 
	&symbolize_state();
#	print "$para_count $n\n";

#
# A secrement of the 1st variational equation 
# with respect to the initial values ( The number of N**2 )
#
	&symbolize_dstate();

#
# A secrement of the 1st variational equation 
# with respect to the parameters ( The number of N )
#
	&symbolize_dpara();

#
# A secrement of the 2nd variational equation 
# with respect to the initial values ( The number of N**3 )
#
	&symbolize_ddstate();

#
# A secrement of the 2nd variational equation 
# with respect to the parameter and the initial values ( The number of N**2 )
#
	&symbolize_ddstatepara();

#
# Symbolized various parameters
# 
open (OUT2, ">npara.txt");
open (IN,"Diffeq.m"); 

print OUT "% symbolized system parameter\n";

	while (<IN>) {
		@paras = /\$(.*?)\$/g;
		@add = (@add, @paras);
		@add = sort{$a cmp $b} @add;
	}
	
	# 登場順に格納する
	my @data;
	my %check;
	foreach $val (@add) {
		unless (exists $check{$val}) {
				push @data, $val;
					$check{$val} = 1;
			}
	}

	$num = 1;
	
	foreach $spara (@data){
		print OUT2 "para($num) = sym(\'$spara\'\);\n";
		print OUT "para($num) = sym(\'para$num\'\);\n";
		++$num;
	}
#
# Symbolize specifying characters from the type of the system.
# Specifically, in a non-autonomous system, we need to symbolize a parameter, 
# which describes 'omega' as an implicit parameter, and the time as an explicit 
# parameter. 
#
	if ( $sys_type eq "f" ) {
		print OUT "para($para_count) = sym(\'para$para_count\'\);\n";
		print OUT2 "para($para_count) = sym(\'omega\'\);\n";
		print OUT "% time of Sinusoidal function\n";
		print OUT "t = sym(\'t\'\);\n";
	}	
	elsif ( $sys_type eq "s" ) {
		$i = $para_count-2;
		$j = $para_count-1;
		print OUT "para($i) = sym(\'para$i\'\);\n";
		print OUT "para($j) = sym(\'para$j\'\);\n";
		print OUT "para($para_count) = sym(\'para$para_count\'\);\n";
		print OUT2 "para($i) = sym(\'smin\'\);\n";
		print OUT2 "para($j) = sym(\'smax\'\);\n";
		print OUT2 "para($para_count) = sym(\'omega\'\);\n";
		print OUT "% time of Square-wave function\n";
		print OUT "t = sym(\'t\'\);\n";
	}	
	close(IN);
	close(OUT2);

print OUT "\n";

#
# Automatically replace the Diffeq into symbolize things
#
#
# State and Function x,f の抜き出し
#

	open (OUT2,">mkpara.txt");
	open (IN,"Diffeq.m");

	while (<IN>) {
		if ($. == 1){
			if ($sys_type eq "a") { print OUT "% Autonomous system\n"; }
			elsif ($sys_type eq "b") { print OUT "% Autonomous system which the period variable is independent variable\n"; }
			elsif ($sys_type eq "f") { print OUT "% Nonautonomous system with a sinusoidal input\n"; }
			elsif ($sys_type eq "m") { print OUT "% Discrete system\n"; }
			elsif ($sys_type eq "d") { print OUT "% Nonautonomous system with an impulsive force\n"; }
			elsif ($sys_type eq "s") { print OUT "% Nonautonomous system with an square-wave force\n"; }
		}
		else {
			#
			# Replace from the state x[0-1] to the state x([0-9])
			#
			s/x([1-9][0-9]*)/x_{$&)/g;
			s/{x/(/g;
			s/_//g;
	
			#
			# Replace from the function f[0-1] to the function f([0-9])
			#
			s/f([1-9][0-9]*)/f_{$&)/g;
			s/{f/(/g;
			s/_//g;
			print OUT2;
		}
	}
	close (IN);
	close (OUT2);
#
#----------------------------------------
#
	open (IN,"mkpara.txt");

		while (<IN>) {
			#
			# パラメータの抜き出し
			#
			@paras = /\$(.*?)\$/g;
			@stok = (@stok, @paras);
			@stok = sort{$a cmp $b} @stok;
		}	
	# 登場順に格納する
	my @cuts;
	my %check2;
		foreach my $val (@stok) {
			unless (exists $check2{$val}) {
				push @cuts, $val;
				$check2{$val} = 1;
			}
		}
	close (IN);
#
#----------------------------------------
#
	open (OUT2,">mkfunc.txt");
	open (IN,"mkpara.txt");

	while (<IN>) {
		s/\$(.*?)\$/para($1)/g;
      	$c=1;
      	foreach $cut (@cuts){
			s/\($cut\)/($c)/g;
       			$c++;
       	} 
		print OUT2;
	}
	close (OUT2);

#
# system type に依存する処理
#
# Nonautonomous system の場合に角周波数 omega により
# system 全体を割っておく処理を行う
# sub routein: ftype -> print_fsys
# sub routein: stype -> print_ssys
#
	if ($sys_type eq "f") {
		&ftype();
		&print_fsys();
	}
	elsif ($sys_type eq "s") {
		&stype();
		&print_fsys();
	}
#
# それ以外の system の場合が必要になればここに追加
# ex -> 'a','b','m','d' etc．
# sub routein: print_sys は，なんの処理も行わない単なるフィルタ
#
	else{
		&print_sys();
	}
close(IN);

print OUT "\n";

print OUT "%\n";
print OUT "%--------------------------------------------------------\n";
print OUT "%\n";
#
# system -- system 方程式の格納
#
print OUT "% Import the system \n";
#print OUT "dotx = kron(f(:),ones(1,M));\n";
print OUT "dotx = f(:);\n";
print OUT "\n";
#
# system -- system Eq. の出力(PP用)
#
print OUT "% Output the System (For PP)\n";
print OUT "fout = fopen('syspp.txt','wt');\n";
print OUT "z=N;\n";
print OUT "for i=1:z;\n";
print OUT "\t fprintf(fout,'xdot(%d)=%s;\\n',i,char(dotx(i)));\n";
print OUT "end\n";
print OUT "fprintf(fout,'\\n');\n";
print OUT "fclose(fout);\n";
print OUT "\n";

print OUT "%\n";
print OUT "%---------------------------------------------------------\n";
print OUT "%\n";
#
# system -- 初期値に関する第一変分方程式
#
print OUT "% The 1st variational equation with respect to the initial values.\n";
print OUT "\n";
print OUT "DF = jacobian(f,x);\n";
print OUT "\n";
print OUT "dg = DF*dx;\n";
print OUT "\n";

#
# system -- 初期値に関する第一変分方程式の格納
#
print OUT "% system -- import the 1st variational equation with respect to the initial values.\n";
print OUT "dotx = [dotx ; dg(:)];\n";
print OUT "\n";

# system -- system Eq. と第１変分方程式の出力(FIX用)
print OUT "% Output the system and the 1st variational equations (For FIX)\n";
print OUT "fout = fopen('sysfix.txt','wt');\n";
print OUT "z=N^2+N;\n";
print OUT "for i=1:z;\n";
print OUT "\t fprintf(fout,'xdot(%d)=%s;\\n',i,char(dotx(i,1)));\n";
print OUT "end\n";
print OUT "\t fprintf(fout,'\\n');\n";
print OUT "fclose(fout);\n";
print OUT "\n";

#
# ODE -- stiff ode-solver 使用時の Jacobian matrix を計算
#
print OUT "% calculation of Jacobian matrix using stiff-ode solver.\n"; 
#print OUT "dx(:);\n";
print OUT "u=[x dx(:).'];\n";
print OUT "v=dotx(1:$N*($N+1));\n";
print OUT "Fj=jacobian(v,u);\n";
print OUT "\n";

# ODE -- stiff-ode solver 用の Jacobian matrix の出力
print OUT "% Output the Jacobian matrix for stiff-ode solver (For FIX)\n";
print OUT "fout = fopen('stiff-fix.txt','wt');\n";
print OUT "z=N^2+N;\n";
print OUT "for i=1:z;\n";
print OUT "\t for j=1:z;\n";
print OUT "\t\t fprintf(fout,'J(%d,%d)=%s;\\n',j,i,char(Fj(j,i)));\n";
print OUT "\t end\n";
print OUT "end\n";
print OUT "fprintf(fout,'\\n');\n";
print OUT "fclose(fout);\n";
print OUT "\n";

print OUT "%\n";
print OUT "%----------------------------------------------------------\n";
print OUT "%\n";
# system -- system Eq. と全変分方程式の出力(BF用)
print OUT "% Output the system and all the variational equations (For BF)\n";
print OUT "%\n";
print OUT "fout = fopen('sysbf.txt','wt');\n";
print OUT "z=N^2+N;\n";
print OUT "for i=1:z;\n";
print OUT "\t fprintf(fout,'xdot(%d)=%s;\\n',i,char(dotx(i,1)));\n";
print OUT "end\n";
#
# system -- 初期値に関する第二変分方程式 (第１項)
#
print OUT "% system -- The 2nd variational equation with respect to initial values. (1st term)\n";
for($i=1;$i<=$N;++$i){
	print OUT "d1dg(:,:,$i) = DF*ddx(:,:,$i);\n";
}
print OUT "\n";
#
# system -- 初期値に関する第二変分方程式 (第２項と１項目との連結)
#
print OUT "% system -- the 2nd variational equation with respect to the initial values (1st and 2nd terms)\n";
# modify: 2015.1.13
#print OUT "ddg2=jacobian(DF*dx,x)*dx;\n";
print OUT "ddg2=jacobian(transpose(dg(:)),x)*dx;\n";
$u=0;
for($i=1;$i<=$N;++$i){
	$p=$u+1;
	$q=$i*$N;
	print OUT "ddg3(:,:,$i)=ddg2($p:$q,:);\n";
	$u=$u+$N;
}
print OUT "ddg=ddg3+d1dg;\n";
print OUT "\n";
#
# system -- 初期値に関する第二変分方程式の格納
#
print OUT "% system -- import the 2nd variational equation with respect to initial values\n";
print OUT "ddgg=[";
for($i=1;$i<=$N;++$i){
	for($j=1;$j<=$N;++$j){
		print OUT "ddg(:,$i,$j)";
		unless(($i==$N) and ($j==$N)){
				print OUT ",";
		}
	}	
}
print OUT "];\n";
print OUT "\n";

print OUT "% Output the 2nd variational equation with respect to initial values\n";
print OUT "for i=1:N^3;\n";
print OUT "\t fprintf(fout,'xdot(%d)=%s;\\n',i+N^2+2*N,char(ddgg(i)));\n";
print OUT "end\n";
print OUT "fprintf(fout,'\\n');\n";
print OUT "fclose(fout);\n";
print OUT "\n";

#
# パラメータの微分
#
print OUT "%\n";
print OUT "%---------------------------------------------------------------\n";
print OUT "%\n";
print OUT "%\n";
print OUT "% Derivative of the parameters\n";
print OUT "%\n";
print OUT "fout = fopen('sysbfp.txt','wt');\n";
print OUT "%\n";
print OUT "dfdp = jacobian(f,para);\n";
#print OUT "dgp = kron(DF*dp(:),ones(1,M))+jacobian(f,para);\n";
print OUT "dgp = kron(DF*dp(:),ones(1,M))+dfdp;\n";
print OUT "\n";

#
# system -- 初期値とパラメータに関する第二変分方程式 (第１項)
#
print OUT "%\n";
print OUT "% The 2nd variational equation with respect to initial value and parameters (1st term)\n";
print OUT "%\n";
print OUT "d1tmp=DF*dxdp;\n";
for($i=1;$i<=$para_count;++$i){
	print OUT "d1ddp(:,:,$i)=d1tmp;\n";
	}
print OUT "\n";

#
# system -- 初期値とパラメータに関する第二変分方程式 (第２項)
#
print OUT "% The 2nd variational equation with respect to initial value and parameters (The 2nd term)\n";
# modify: 2015.1.13
#print OUT "ddxdp1=jacobian(DF*dx,x)*dp(:);\n";
print OUT "ddxdp1=jacobian(transpose(dg(:)),x)*dp(:);\n";
print OUT "ddxdp2=[";
$u=0;
for($i=1;$i<=$N;++$i){
	$p=$u+1;
	$q=$i*$N;
	print OUT "ddxdp1($p:$q)";
	unless($q==$N*$N){
		print OUT ",";
	}
	$u=$u+$N;
}
print OUT "];\n";
for($i=1;$i<=$para_count;++$i){
	print OUT "ddxdp3(:,:,$i)=ddxdp2;\n";
}
print OUT "\n";

#
# system -- 初期値とパラメータに関する第二変分方程式 (第３項)
#
print OUT "% The 2nd variational equation with respect to initial value and parameter (The 3rd Term)\n";
#print OUT "dpdx2=jacobian(jacobian(f,x)*dx,para);\n";
# modify: 2015.1.13
#print OUT "dpdx2=jacobian(DF*dx,para);\n";
print OUT "dpdx2=jacobian(transpose(dg(:)),para);\n";
for($k=1;$k<=$para_count;++$k){
	print OUT "pptmp=dpdx2(:,$k);\n";
	print OUT "d2ddp(:,:,$k)=[";
	$u=0;
	for($i=1;$i<=$N;++$i){
		$p=$u+1;
		$q=$i*$N;
		print OUT "pptmp($p:$q)";
		unless($q==$N*$N){
			print OUT ",";
		}
		$u=$u+$N;
	}
	print OUT "];\n";
}
print OUT "\n";

#
# system -- 初期値とパラメータに関する第二変分方程式の格納
#
print OUT "% system -- import the 2nd variational equation with respect to initial values and parameters.\n";
print OUT "dxdpara=d1ddp+ddxdp3+d2ddp;\n";
print OUT "\n";
print OUT "% Output the 1st and 2nd variational equations with respect to parameters and initial values\n";
print OUT "z=N^2;\n";
print OUT "for p=1:M;\n";
print OUT "\t dxdpara_tmp=dxdpara(:,:,p);\n";
print OUT "\t stok = dxdpara_tmp(:);\n";
print OUT "\t fprintf(fout,'case 3%d\\n',p);\n";
print OUT "\t for i=1:N;\n";
print OUT "\t\t fprintf(fout,'\\t');\n";
print OUT "\t\t fprintf(fout,'xdot(%d)=%s;\\n',i+N^2+N,char(dgp(i,p)));\n";
print OUT "\t end\n";
print OUT "\t for i=1:z;\n";
print OUT "\t\t fprintf(fout,'\\t');\n";
print OUT "\t\t fprintf(fout,'xdot(%d)=%s;\\n',i+N^3+N^2+2*N,char(stok(i)));\n";
print OUT "\t end\n";
print OUT "\t fprintf(fout,'\\n');\n";
print OUT "end\n";
print OUT "\n";
print OUT "fclose(fout);\n";
print OUT "\n";

print OUT "%\n";
print OUT "%------------------------------------------------------------\n";
print OUT "%\n";
#
# FIX: Fix 用の Jacobi 行列の出力
#
print OUT "% Output of the Jacobian matrix using the Newton method (For FIX)\n";
print OUT "fout = fopen('fix_df.txt','wt');\n";
print OUT "for p=1:N;\n";
print OUT "\t for q=1:N;\n";
print OUT "\t\t if p==q\n";
print OUT "\t\t\t fprintf(fout,'A(%d,%d)=%s-1.0;\\n',p,q,char(dx(p,q)));\n";
print OUT "\t\t else\n";
print OUT "\t\t\t fprintf(fout,'A(%d,%d)=%s;\\n',p,q,char(dx(p,q)));\n";
print OUT "\t\t end;\n";
print OUT "\t end\n";
print OUT "end\n";
print OUT "fclose(fout);\n";
print OUT "\n";

	#
	# 自律系平衡点の分岐解析の場合に必要な Jacobi 行列の出力．
	# 
	if ($sys_type eq "a"){
		print OUT "%\n";
		print OUT "%----------------------------------------------------------------\n";
		print OUT "%\n";
		print OUT "%% Output of the Jacobian matrix using the Newton method (For FIX_eq)\n";
		print OUT "\n";
		print OUT "fout = fopen('DF_eq.txt','wt');\n";
		print OUT "for p=1:N;\n";
		print OUT "\t for q=1:N;\n";
		print OUT "\t\t fprintf(fout,'A(%d,%d)=%s;\\n',p,q,char(DF(p,q)));\n";
		print OUT "\t end\n";
		print OUT "end\n";
		print OUT "fclose(fout);\n";
		print OUT "\n";
	}
	#
	# それ以外の system の場合はなにもしない．
	#
	else{
	
	}

#
# BF: BF 用の Jacobi 行列の出力
#
	if ($sys_type eq "a"){
		#
		# BF_eq: BF 用の Jacobi 行列の出力(平衡点版)
		#
		print OUT "%\n";
		print OUT "%------------------------------------------------------------------\n";
		print OUT "%\n";
		print OUT "% Output derivatives of parameters (For BF_eq)\n";
		print OUT "%\n";
		print OUT "fout = fopen('dfdp.txt','wt');\n";
		print OUT "for p=1:M;\n";
		print OUT "\t fprintf(fout,'case 3%d\\n',p);\n";
		print OUT "\t for i=1:N;\n";
		print OUT "\t\t fprintf(fout,'\\t');\n";
		print OUT "\t\t fprintf(fout,'A1(%d,1)=%s;\\n',i,char(dfdp(i,p)));\n";
		print OUT "\t end\n";
		print OUT "\t fprintf(fout,'\\n');\n";
		print OUT "end\n";
		print OUT "fclose(fout);\n";
		print OUT "\n";

		print OUT "%\n";
		print OUT "%------------------------------------------------------------------\n";
		print OUT "%\n";
		print OUT "% Output derivatives of characteristic equation with respect to states (For BF_eq)\n";
		print OUT "%\n";
		print OUT "fout = fopen('d2fdxdx.txt','wt');\n";
		# modify: 2015.1.13
		#print OUT "d2fdxdx = jacobian(DF,x);\n";
		print OUT "d2fdxdx = jacobian(transpose(DF(:)),x);\n";
		print OUT "for i=1:N*N;\n";
		print OUT "\t for j=1:N;\n";
		print OUT "\t\t fprintf(fout,'d2fdxdx(%d,%d)=%s;\\n',i,j,char(d2fdxdx(i,j)));\n";
		print OUT "\t end\n";
		print OUT "end\n";
		print OUT "fclose(fout);\n";
		print OUT "\n";

		print OUT "%\n";
		print OUT "%------------------------------------------------------------------\n";
		print OUT "%\n";
		print OUT "% Output derivatives of characteristic equation with respect to states and parameter (For BF_eq)\n";
		print OUT "%\n";
		print OUT "fout = fopen('d2fdxdp.txt','wt');\n";
		print OUT "for i=1:M;\n";
		print OUT "\t d2fdxdp(:,:,i)=diff(DF,para(i));\n";
		print OUT "end\n";
		print OUT "for i=1:M;\n";
		print OUT "\t fprintf(fout,'case 3%d\\n',i);\n";
		print OUT "\t for j=1:N;\n";
		print OUT "\t\t for k=1:N;\n";
		print OUT "\t\t\t fprintf(fout,'d2fdxdp(%d,%d)=%s;\\n',k,j,char(d2fdxdp(k,j,i)));\n";
		print OUT "\t\t end\n";
		print OUT "\t end\n";
		print OUT "\t fprintf(fout,'\\n');\n";
		print OUT "end\n";
		print OUT "fclose(fout);\n";
		print OUT "\n";
	}
	#
	# それ以外の system の場合はなにもしない．
	#
	else{
	
	}


#
# 以下余分な部分を消去する必要あり: BF 用の Jacobi 行列の出力
#
print OUT "%\n";
print OUT "%------------------------------------------------------------------\n";
print OUT "%\n";
print OUT "% Output of the Jacobian matrix using the Newton method (For BF)\n";
print OUT "% N x N (the same as the fix_df.txt)\n";
print OUT "\n";
#print OUT "% symbolized the eigenvalue\n";
#print OUT "mu = sym('mu');\n";
#print OUT "\n";

#
# リミットサイクル or 周期解の分岐に対する BF 用 Jacobi
#
print OUT "%\n";
print OUT "% Elements of N x N+1.\n";
print OUT "%\n";
print OUT "% Output derivatives of parameters (For BF)\n";
print OUT "%\n";
print OUT "fout = fopen('dphidp.txt','wt');\n";
print OUT "%\n";
print OUT "\t for i=1:N;\n";
print OUT "\t\t fprintf(fout,'\\t A1(%d,1)=%s;\\n',i,char(dp(i)));\n";
print OUT "\t end\n";
print OUT "\t fprintf(fout,'\\n');\n";
print OUT "\n";
print OUT "fclose(fout);\n";
print OUT "\n";
print OUT "%\n";
print OUT "%------------------------------------------------------------------\n";
print OUT "%\n";
print OUT "% Output derivatives of characteristic equation with respect to states (For BF)\n";
print OUT "%\n";
print OUT "fout = fopen('dKaidx_dKaidp.txt','wt');\n";

$p=1;
for($i=1;$i<=$N;++$i){
	for($j=1;$j<=$N;++$j){
		print OUT "dkaidx_dkaidp($p,:)=[";
		for($k=1;$k<=$N;++$k){
			print OUT "ddx($j,$i,$k)";
			unless($k==$N){
				print OUT ",";
			}
		}
	print OUT "];\n";
	$p=$p+1;
	}	
}
for($i=1;$i<=$N;++$i){
	print OUT "dkaidx_dkaidp($p,:)=[";
	for($j=1;$j<=$N;++$j){
		print OUT "dxdp($i,$j)";
			unless($j==$N){
				print OUT ",";
			}
		}
	print OUT "];\n";
	$p=$p+1;
}	
print OUT "for i=1:N*N+N;\n";
print OUT "\t for j=1:N;\n";
print OUT "\t\t fprintf(fout,'\\t dKaidx_dKaidp(%d,%d)=%s;\\n',i,j,char(dkaidx_dkaidp(i,j)));\n";
print OUT "\t end\n";
print OUT "end\n";
print OUT "fclose(fout);\n";
print OUT "\n";

close (OUT);

#
# 系のタイプをチェック
#
sub sys_check {

	open (IN,"Diffeq.m"); 
	while (<IN>) {
		if ($. == 1){
			/type/;
			if ($` eq "a") {
					print "% Autonomous system\n";
					$sys_para = 0;
					$sys_type = "a";
			}
			elsif (	$` eq "b") { 
					print "% Autonomous system which the period variable is independent variable\n";
					$sys_para = 0;
					$sys_type = "b";
			}
			elsif ( $` eq "f") {
					print "% Nonautonomous system with a sinusoidal input\n";
					$sys_para = 1;
					$sys_type = "f";
			}
			elsif (	$` eq "m") {
					print "% Discrete system\n";
					$sys_para = 0;
					$sys_type = "m";
			}
			elsif (	$` eq "d") {
					print "% Nonautonomous system with an impulsive force\n";
					$sys_para = 2;
					$sys_type = "d";
			}
			elsif (	$` eq "s") {
					print "% Nonautonomous system with an square-wave force\n";
					$sys_para = 3;
					$sys_type = "s";
			}
			else { 
					die "Make system is terminated. The type of the system don't support\n"; 
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

	open (IN,"Diffeq.m");

	while (<IN>) {
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
	close(IN);
	return ($c);
}

#
# 状態変数のシンボル化
# 
sub symbolize_state {

	open (IN,"Diffeq.m"); 
	while (<IN>) {
    	if( /x/ ){
			$n=$.-1;
			print OUT "x($n)= sym(\'x$n\'\);\n";
		}
	}
close (IN);
}

#
# 初期値に関する第１変分方程式用計算機変数の確保( N**2 個 )
#
sub symbolize_dstate {
	#my ($N) = @_;

	print OUT "% Arguments for the 1st variational equation with respect to the initial values.\n";
	$N=$n;
	$u=$N+1;
	for($i=1;$i<=$N;++$i){
		for($j=1;$j<=$N;++$j){
			print OUT "dx($j,$i)= sym(\'x$u\'\);\n";
			$u++;
		}
	}
}

#
# パラメータに関する第１変分方程式用計算機変数の確保( N 個 )
#
sub	symbolize_dpara {

	print OUT "% Arguments for the 1st variational equation with respect to the system parameter.\n";

	for($i=1;$i<=$n;++$i){
		print OUT "dp($i)= sym(\'x$u\'\);\n";
		$u++;
	}
}

#
# 初期値に関する第２変分方程式用計算機変数の確保( N**3 個 )
#
sub	symbolize_ddstate {

	print OUT "% Arguments for the 2nd variational equation with respect to the initial value.\n";
	$N=$n;
	$u=$N*$N+2*$N+1;
	for($i=1;$i<=$N;++$i){
		for($j=1;$j<=$N;++$j){
			for($k=1;$k<=$N;++$k){
				print OUT "ddx($k,$i,$j)= sym(\'x$u\'\);\n";
				$u++;
			}
		}
	}
}

#
# パラメータと初期値に関する第２変分方程式用計算機変数の確保( N**2 個 )
#
sub	symbolize_ddstatepara {

	print OUT "% Arguments for the 2nd variational equation with respect to the system parameter and the initial values.\n";
	
	$u=$N*($N+2)+$N*$N*$N+1;
	for($i=1;$i<=$N;++$i){
		for($j=1;$j<=$N;++$j){
			print OUT "dxdp($j,$i)= sym(\'x$u\'\);\n";
			$u++;
		}
	}
	print OUT "\n";
}

#
# system type に依存する処理
#
sub ftype {

open (OUT2,">mkfunc2.txt");

open (IN,"mkfunc.txt");

	while (<IN>) {
		#
		# = から =( へ置換
		#
		s/=/=(/g;

		#
		# ; から )/para(**) へ置換
		#
		s/;/)\/para_{para$para_count);/g;
		s/{para/(/g;
		s/_//g;
		print OUT2;
	}
	close (OUT2);

}

sub stype {

	open (OUT2,">mkfunc_pre.txt");
	open (IN,"mkfunc.txt");

	while (<IN>) {
		#
		# = から =( へ置換
		#
		s/=/=(/g;

		#
		# ; から )/para(**) へ置換
		#
		s/;/)\/para_{para$para_count);/g;
		s/{para/(/g;
		s/_//g;
		print OUT2;
	}
	close (OUT2);

	open (OUT2,">mkfunc2.txt");
	open (IN,"mkfunc_pre.txt");

	$u=$para_count -2;

	while (<IN>) {
		#
		# s(t) から para(**) へ置換
		#
		s/s\(t\)/para($u)/g;
		print;
		print OUT2;
	}
	close (OUT2);

}

#
# それ以外の system の場合に必要になればここに追加して
# いけば良い --> 'a','b','m','d' など．
# sub routein: print_sys は，なんの処理も行わない単なるフィルタ処理
#
sub print_sys {

	open (IN, "mkfunc.txt");

	while (<IN>){
		print OUT;
	}

	close(IN);
}

# Nonautonomous system の場合に角周波数 omega により
# system 全体を割っておく処理を行う
# sub routein: ftype -> print_fsys

sub print_fsys {
	
	open (IN, "mkfunc2.txt");

	while (<IN>){
		print OUT;
	}

	close(IN);
}
