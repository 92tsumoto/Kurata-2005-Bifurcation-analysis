function [init_val]=bpara_input()
%
% inputs of the values of the state variables and their parameters
%

global fin
global N M
global sol_type
global bf_type

	switch sol_type
		%
		% Equilibrium point case
		%

		case 1
			if bf_type == 3
				num = N + M + 1;
			else
				num = N + M;
			end
		%
		% Limit cycle case.
		% In this case, the information of
		% period is required.
		%

		case 2
			if bf_type == 3
				num = N + M + 2;
			else
				num = N + M + 1;
			end
	end

	init_val = fscanf(fin,'%e\n',[1,num]);
	
%end function

