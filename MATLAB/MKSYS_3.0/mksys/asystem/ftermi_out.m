function ftermi_out(stok)
%
% output of various values
%

global f3out 
global iosave


	backup_out(stok);

	% ファイル出力がオンであれば file close

	if iosave == 1
		fclose(f3out);

		%
		% main 内最後にあるファイルクローズを避けるため
		% に iosave をゼロに reset しておく．

		iosave = 0;
	end

	fprintf('Program is terminated.\n');
	fprintf('The initial conditions are saved as @.bak\n');
	fprintf('\n');

%end function

