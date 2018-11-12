function [termi_stop]=termi_ch()
%
% output of various values
%
% open-close of the stop file
% 0 or 1 is described in the stop file.
% it read the stop file. After that,
% it inputs to the termi_stop.
%

	ftermi = fopen('stop','rt');

		termi_stop=fscanf(ftermi,'%d\n',1);

	fclose(ftermi);

%end function

