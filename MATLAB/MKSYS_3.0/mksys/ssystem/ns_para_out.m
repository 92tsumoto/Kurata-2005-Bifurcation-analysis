function ns_para_out(x,para,theta)
%
% outputs of the values of the state variables and their parameters
% for Neimark-Sacker bifurcation.
%
%

global fout
global N

	fout = fopen('_.bak.ns','wt');
	strings = '_.bak.ns';

	cut_x=x(1:N);

	fprintf(fout,'%16.16E\n',para(:));
	fprintf(fout,'%16.16E\n',cut_x(:));
	fprintf(fout,'%16.16E\n',theta);

	fclose(fout);

	fprintf('save as %s\n',char(strings));

%end function

