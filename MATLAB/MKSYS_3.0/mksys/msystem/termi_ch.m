function [termi_stop]=termi_ch()
%
% output of various values
%
% stop file �� open-close
% stop file ��ϡ�0/1
% �������Ƥ��ɤ߼�ꡤtermi_stop ������
%

	ftermi = fopen('stop','rt');

		termi_stop=fscanf(ftermi,'%d\n',1);

	fclose(ftermi);

%end function

