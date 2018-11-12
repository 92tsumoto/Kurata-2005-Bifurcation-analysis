function backup_out(stok)
%
% output of various values
%

global f2out
global sol_type
global x_eq eq_switch
global N M

	cut=stok(:);

	f2out = fopen('@.bak','wt');
	strings = '@.bak';

	switch sol_type
		case 1
			fprintf(f2out,'%16.16E\n',cut(1:M+N));
		case 2
			fprintf(f2out,'%16.16E\n',cut(1:M+N+1));
			if eq_switch == 1
				feqout = fopen('eq.ini','wt');
				xeq_out = x_eq(:);
				fprintf(feqout,'%16.16E\n',xeq_out(1:N));
				fclose(feqout);
			end
	end

	fclose(f2out);

	fprintf('save as %s\n',char(strings));

%end function

