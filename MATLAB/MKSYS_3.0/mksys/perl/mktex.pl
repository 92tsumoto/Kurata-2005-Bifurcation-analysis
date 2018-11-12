# mktex.pl --Make tex file from standerd input file

open (OUT,">system.tex"); 

	&sys_check();

print OUT "\\documentclass{article}\n";
        if ($sys_type eq 'd' || $sys_type eq 's') {
            print OUT "\\input{epic.sty}\n";
        }
print OUT "\\pagestyle{empty}\n";
print OUT "\\begin{document}\n";
print OUT "\\title{\\bf System name ``" . $sys_name . "''}\n";
print OUT "\\author{``" . $sys_type_name . "''}\n";
print OUT "\\date{\\today}\n";
print OUT "\\maketitle\n";
print OUT "\\thispagestyle{empty}\n";

print OUT "\\section{System Equations}\n";
print OUT "\\begin{eqnarray*}\n";
	&sys_eq();
print OUT "\\end{eqnarray*}\n";

print $sys_type;
if( $sys_type eq "s") {	
	print OUT "\\section{Square-wave signal}\n";
	print OUT "\\begin{eqnarray*}\n";
		&sys_sig();
	print OUT "\\end{eqnarray*}\n";
}

print OUT "\\section{Parameters}\n";
print OUT "\\begin{center}\n";
print OUT "\\begin{tabular}{|c|c|c|}\n";
print OUT "\\hline\n";
print OUT "number & variable name & name \\\\\n";
print OUT "\\hline\n";
	&para_input();
print OUT "\\hline\n";
print OUT "\\end{tabular}\n";
print OUT "\\end{center}\n";

print OUT "\\end{document}\n";
close(OUT);

#
# 系のタイプをチェック
#
sub sys_check {

	open (IN,"Diffeq.m"); 
	while (<IN>) {
		chomp;
		if ($. == 1){
			/type:(\S+);/;
			$sys_name = $1;
			if ($` eq "a") {
					$sys_type_name ="Autonomous system";
					$sys_para = 0;
					$sys_type = "a";
			}
			elsif (	$` eq "b") { 
					$sys_type_name = "Autonomous system (Ver2)";
					$sys_para = 0;
					$sys_type = "b";
			}
			elsif ( $` eq "f") {
					$sys_type_name = "Nonautonomous system with a sinusoidal input";
					$sys_para = 1;
					$sys_type = "f";
			}
			elsif (	$` eq "m") {
					$sys_type_name = "Discrete system";
					$sys_para = 0;
					$sys_type = "m";
			}
			elsif (	$` eq "d") {
					$sys_type_name = "Nonautonomous system with an impulsive force";
					$sys_para = 2;
					$sys_type = "d";
			}
			elsif (	$` eq "s") {
					$sys_type_name = "Nonautonomous system with a square-wave force";
					$sys_para = 2;
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
# 状態変数のシンボル化
# 
sub sys_eq {

	open (IN,"Diffeq.m"); 
	while (<IN>) {
		chomp;
		if ($. == 1){
		}
		else {
			unless ($sys_type eq "m") {
				#
				# 状態 f[0-1] から dx([0-9])/dt へ置換
				#
				s/f([1-9][0-9]*)/\\frac{dx_{$&}}{dt}/g;
				s/{f/{/g;
			}
			else {
				#
				# 状態 f[0-1] から dx([0-9])/dt へ置換
				#
				s/f([1-9][0-9]*)/x_{$&}(t+1)/g;
				s/{f/{/g;
			}
				
			s/=/ \\!\\!\\!\\!&=&\\!\\!\\!\\! /g;
			
			#
			# 状態 x[0-1] から x_{[0-9]} へ置換
			#
			unless ($sys_type eq "m") {
				s/x([1-9][0-9]*)/x_{$&}/g;
				s/{x/{/g;
				#s/_//g;
			}
			else {
				s/x([1-9][0-9]*)/x_{$&}(t)/g;
				s/{x/{/g;
			}
			#
			# nonautonomous であれば，正弦関数を書き換え
			#
			if( $sys_type eq "f") {	
				s/cos\(t\)/cos(\\mbox{\\tt omega } t )/g;
				s/sin\(t\)/sin(\\mbox{\\tt omega } t )/g;
			}

			#
			# パラメータ $[a-Z]$ から [a-Z|0-9] へ置換
			#
				s/\$(.*?)\$/{\\mbox{\\tt $1}}/g;
				s/\*//g;
			#
			# 解析関数を含む場合の処理
			#
				s/exp/\\exp/g;
				s/log/\\log/g;
				s/ln/\\ln/g;
				s/cos/\\cos/g;
				s/cosh/\\cosh/g;
				s/cot/\\cot/g;
				s/coth/\\coth/g;
				s/csc/\\csc/g;
				s/sec/\\sec/g;
				s/sin/\\sin/g;
				s/sinh/\\sinh/g;
				s/tan/\\tan/g;
				s/tanh/\\tanh/g;
				s/arccos/\\arccos/g;
				s/arcsin/\\arcsin/g;
				s/arctan/\\arctan/g;
			#
			# 改行処理
			#
				s/\;/\\\\/g;

				print OUT ;
				print OUT "\n";
		}		
	}
	close (IN);
}

#
# Square-wave のシンボル化
# 
sub sys_sig {

	print OUT "s(t) = \\left\\{\n";
	print OUT "\\begin{array}{cl}\n";
	print OUT "{\\tt smin}, & (0 \\le t < 2\\pi/{\\tt omega}*t_1)\\\\\\\\\n";
	print OUT "{\\tt smax}, & (2\\pi/{\\tt omega}*t_1 \\le t < 2\\pi/{\\tt omega})\n";
	print OUT "\\end{array}\n";
	print OUT "\\right.\n";
}

#
# パラメータ処理
#
sub para_input {

open (IN,"npara.txt");

	while (<IN>) {
		#
		# = から =( へ置換
		#
		/para\(([1-9][0-9])\)/;
		$para_number=$.;
		/=/;
		$vari_name=$`;
		/sym\(\'(.*?)\'\)/;
		$para_name=$1;
	
	print OUT "$para_number \& $vari_name \& \$\\mbox{\\tt $para_name}\$ \\\\ \n";
	}
	close (IN);

}
