function ftermi_out(stok)
%
% output of various values
%

global f3out 
global iosave


	backup_out(stok);

	% �ե�������Ϥ�����Ǥ���� file close

	if iosave == 1
		fclose(f3out);

		%
		% main ��Ǹ�ˤ���ե����륯�������򤱤뤿��
		% �� iosave �򥼥�� reset ���Ƥ�����

		iosave = 0;
	end

	fprintf('Program is terminated.\n');
	fprintf('The initial conditions are saved as @.bak\n');
	fprintf('\n');

%end function

