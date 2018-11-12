function backup_out(stok)
%
% output of various values
%

global f2out
global N M

	cut=stok(:);

	f2out = fopen('_.bak','wt');
	strings = '_.bak';

	fprintf(f2out,'%16.16E\n',cut(1:M+N));

	fclose(f2out);

	fprintf('save as %s\n',char(strings));

%end function

