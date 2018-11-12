function [init_val]=bpara_input()
%
% inputs of the values of the state variables and their parameters
%

global fin
global N M
global bf_type

	if bf_type == 3
		num = N + M + 1;
	else
		num = N + M;
	end
	init_val = fscanf(fin,'%e\n',[1,num]);
	
%end function

