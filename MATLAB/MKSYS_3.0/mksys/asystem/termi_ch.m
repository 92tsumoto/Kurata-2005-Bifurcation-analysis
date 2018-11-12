function [termi_stop]=termi_ch()
%
% output of various values
%
% stop file の open-close
% stop file 内は，0/1
% その内容を読み取り，termi_stop へ入力
%

	ftermi = fopen('stop','rt');

		termi_stop=fscanf(ftermi,'%d\n',1);

	fclose(ftermi);

%end function

