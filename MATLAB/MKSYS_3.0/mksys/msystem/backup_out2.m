function backup_out2(stok,pre_revsw)
%
% output of various values
%

global f2out
global N M
global bf_type
global reverse_sw

	cut=stok(:);

	if bf_type == 3

		% When the bifurcation is Neimark-Sacker bifurcation,
		% the angler information of characteristic multiplier
		% is needed.

		num = M + N + 1;

	else

		% In general, the number of initial values is M( dimension
		% of parameter) + N (dimension of system).

		num = M + N;
	end

	if reverse_sw == 1
		if pre_revsw == 1
			if bf_type == 3
				f2out = fopen('#.bak.ns','wt');
				strings = '#.bak.ns';
			else
				f2out = fopen('#.bak','wt');
				strings = '#.bak';
			end
		elseif pre_revsw == 0
			if bf_type == 3
				f2out = fopen('#.bak.ns.1','wt');
				strings = '#.bak.ns.1';
			else
				f2out = fopen('#.bak.1','wt');
				strings = '#.bak.1';
			end
		end

	elseif reverse_sw == 0
		if bf_type == 3
			f2out = fopen('#.bak.ns','wt');
			strings = '#.bak.ns';
		else
			f2out = fopen('#.bak','wt');
			strings = '#.bak';
		end
	end

	fprintf(f2out,'%16.16E\n',cut(1:num));
	fclose(f2out);

	fprintf('\n');
	fprintf('save as %s\n',char(strings));

%end function

