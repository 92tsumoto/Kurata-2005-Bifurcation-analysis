function [init_val]=fpara_input()
%
% inputs of the values of the state variables and their parameters
%

global fin
global sol_type
global N M

	switch sol_type
	%
	% Equilibrium point case
	%
		case 1
			num = N + M;
	%
	% Limit cycle case.
	% In this case, the information of
	% period is required.
	%
		case 2
			num = N + M + 1;

	end

	init_val = fscanf(fin,'%e\n',[1,num]);

%end function

