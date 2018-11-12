function [init_val]=fpara_input()
%
% inputs of the values of the state variables and their parameters
%

global fin
global N M

	num = M + N;

	init_val = fscanf(fin,'%e\n',[1,num]);

%end function

