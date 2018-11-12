function ftermi_out(stok)
%
% output of various values
%

global f3out 
global iosave


	backup_out(stok);

	% If the file output is on, the file is closed.

	if iosave == 1
		fclose(f3out);

		%
		% To avoid a file close command at the end of
		% main routine, iosave is reset to zero.
		%

		iosave = 0;
	end

	fprintf('Program is terminated.\n');
	fprintf('The initial conditions are saved as _.bak\n');
	fprintf('\n');

%end function

