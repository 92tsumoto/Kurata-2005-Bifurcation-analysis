function backup_out2(stok,pre_revsw)
%
% output of various values
%

global f2out
global N M
global sol_type
global bf_type
global reverse_sw

	cut=stok(:);

	switch sol_type
		case 1
			% When the bifurcation is Hopf bifurcation,
			% the imaginary part of eigenvalues is needed.
			% In general, the number of initial values is M( dimension
			% of parameter) + N (dimension of system).

			if bf_type == 3
				num = M + N + 1;
			else
				num = M + N;
			end
		case 2
			% When the bifurcation is Neimark-Sacker bifurcation,
			% the angle information of characteristic multipliers is needed.
			% In general, the initial values is M( dimension of parameter)
			% + N (dimension of system) + tau (period of the Limit cycle).

			if bf_type == 3
				num = M + N + 2;
			else
				num = M + N + 1;
			end
	end

	if reverse_sw == 1
		if pre_revsw == 1
			if bf_type == 3
				switch sol_type
					case 1
						f2out = fopen('@.bak.hopf','wt');
						strings = '@.bak.hopf';
					case 2
						f2out = fopen('@.bak.ns','wt');
						strings = '@.bak.ns';
				end
			else
				f2out = fopen('@.bak','wt');
				strings = '@.bak';
			end
		elseif pre_revsw == 0
			if bf_type == 3
				switch sol_type
					case 1
						f2out = fopen('@.bak.hopf.1','wt');
						strings = '@.bak.hopf.1';
					case 2
						f2out = fopen('@.bak.ns.1','wt');
						strings = '@.bak.ns.1';
				end
			else
				f2out = fopen('@.bak.1','wt');
				strings = '@.bak.1';
			end
		end

	elseif reverse_sw == 0
		if bf_type == 3
			switch sol_type 
				case 1
					f2out = fopen('@.bak.hopf','wt');
					strings = '@.bak.hopf';
				case 2
					f2out = fopen('@.bak.ns','wt');
					strings = '@.bak.ns';
			end
		else
			f2out = fopen('@.bak','wt');
			strings = '@.bak';
		end
	end

	fprintf(f2out,'%16.16E\n',cut(1:num));
	fclose(f2out);

	fprintf('\n');
	fprintf('save as %s\n',char(strings));

%end function

