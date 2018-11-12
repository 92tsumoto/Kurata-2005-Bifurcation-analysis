function MKSYS()
%
% MKSYS: is a main script for creating bifurcation analysis tools,
% e.g., {a,f,m}{progname}fix and {a,f,m}{progname}bf
%

debug = 0;
% debug mode 
% If debug is on, then debug = 1
% If debug is off, then debug = 0
%


tic;

fprintf('Start making system now !\n');
	fprintf('\n');

perl('perl/mksys.pl');

		perl('perl/mktex.pl');
		system('latex system');
		system('dvips system');
		fprintf('\n');
		fprintf('Finished TeX compile now: see your created system.ps\n');
		fprintf('\n');

fprintf('Build up several M-files of your system\n');
fprintf('\n');
	fprintf('\t Now, Making a M-file of variational equations\n');

	fin = fopen('Diffeq.m');
	fc = fgetl(fin);

	if strncmpi(fc,'a',1)
		mkasys;
		sys_type = 1;
	elseif strncmpi(fc,'b',1)
		mkbsys;
		sys_type = 2;
	elseif strncmpi(fc,'f',1)
		mkfsys;
		sys_type = 3;
	elseif strncmpi(fc,'m',1)
		mkmsys;
		sys_type = 4;
	elseif strncmpi(fc,'d',1)
		mkdsys;
		sys_type = 5;
	elseif strncmpi(fc,'s',1)
		mkssys;
		sys_type = 6;
	end	

	fclose(fin);

	fprintf('\t Output to Eq.m; variational equations\n');

	%
	% Create ODE function and variational equation 
	%
	perl('perl/mkEq.pl');
		%
		% by using the case of equilibrium point
		%
		if strncmpi(fc,'a',1)
			perl('perl/mkJacobi_eq.pl');
			fprintf('\t Create M-files for Jacobian matrix using analysis of Eq points\n');
		end	

	fprintf('\t Create M-files for Jacobian matrix of Fix and BF programs\n');
		perl('perl/mkJacobi.pl');

	fprintf('\t Output to M-files of the PP, FIX, and BF program\n');
		perl('perl/mkprg.pl');
		fprintf('\n');

fprintf('Finished the creation of the M-files to analyze the non-linear system\n');

switch debug
	case 0
	switch sys_type
		case 1
			copyfile('asystem/afix.in','fix.in');
			copyfile('asystem/abf.in','bf.in');
			delete('*.txt','*.aux','*.log','mkasys.m');
			delete('fix*.sys','bf*.sys');
			%delete('Eq.m','variational_Eq.m');
			%delete('F0.m','Fj.m','DF.m','dTdP.m','dkaidx_dkaidp.m');
			%delete('f_eq.m','DF_eq.m','dFdP_eq.m','d2fdxdx_eq.m','d2fdxdp_eq.m');
		case 2
			copyfile('bsystem/bfix.in','fix.in');
			copyfile('bsystem/bbf.in','bf.in');
			delete('*.txt','*.aux','*.log','mkasys.m');
			delete('fix*.sys','bf*.sys');
			delete('Eq.m','variational_Eq.m');
			delete('Fj.m','DF.m','dTdP.m','dkaidx_dkaidp.m');
			delete('f_eq.m','DF_eq.m','dFdP_eq.m','d2fdxdx_eq.m','d2fdxdp_eq.m');
		case 3
			copyfile('fsystem/ffix.in','fix.in');
			copyfile('fsystem/fbf.in','bf.in');
			delete('*.txt','*.aux','*.log','mkfsys.m');
			delete('fix*.sys','bf*.sys');
			delete('Eq.m','variational_Eq.m');
			delete('Fj.m','DF.m','dTdP.m','dkaidx_dkaidp.m');
		case 4
			copyfile('msystem/mfix.in','fix.in');
			copyfile('msystem/mbf.in','bf.in');
			delete('*.txt','*.aux','*.log','mkmsys.m');
			delete('fix*.sys','bf*.sys');
			delete('Eq.m','variational_Eq.m');
			delete('Fj.m','DF.m','dTdP.m','dkaidx_dkaidp.m');
		case 5
			copyfile('dsystem/dfix.in','fix.in');
			copyfile('dsystem/dbf.in','bf.in');
			delete('*.txt','*.aux','*.log','mkdsys.m');
			delete('fix*.sys','bf*.sys');
			delete('Eq.m','variational_Eq.m');
			delete('Fj.m','DF.m','dTdP.m','dkaidx_dkaidp.m');
		case 6
			copyfile('ssystem/sfix.in','fix.in');
			copyfile('ssystem/sbf.in','bf.in');
			delete('*.txt','*.aux','*.log','mkssys.m');
			delete('fix*.sys','bf*.sys');
			delete('Eq.m','variational_Eq.m','mkdev.m','mkdev2.m','mkdev3.m');
			delete('Fj.m','DF.m','dTdP.m','dkaidx_dkaidp.m');
		otherwise
			display('OSTYPE error !');
			return;
	end
	case 1
        return;
    otherwise
        return;
end

toc
