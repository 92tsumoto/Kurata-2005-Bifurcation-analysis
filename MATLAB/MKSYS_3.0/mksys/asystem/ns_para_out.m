function ns_para_out(x,para,theta,tau)
%
% outputs of the values of the state variables and their parameters
% for Hopf or Neimark-Sacker bifurcation.
%

global fout
global sol_type
global x_eq eq_switch
global N

	cut_x=x(1:N);
	
	switch sol_type 
		case 1
			fout = fopen('@.bak.hopf','wt');
			strings = '@.bak.hopf';
			fprintf(fout,'%16.16E\n',para(:));
			fprintf(fout,'%16.16E\n',cut_x(:));
			fprintf(fout,'%16.16E\n',theta);
		case 2
			fout = fopen('@.bak.ns','wt');
			strings = '@.bak.ns';
			fprintf(fout,'%16.16E\n',para(:));
			fprintf(fout,'%16.16E\n',cut_x(:));
			fprintf(fout,'%16.16E\n',theta);
			fprintf(fout,'%16.16E\n',tau);
			
			if eq_switch == 1
				feqout = fopen('eq.ini','wt');
				xeq_out = x_eq(:);
				fprintf(feqout,'%16.16E\n',xeq_out(1:N));
				fclose(feqout);
			end
	end

	fclose(fout);

	fprintf('save as %s\n',char(strings));

%end function

