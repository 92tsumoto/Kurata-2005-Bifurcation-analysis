function [out_dat1,out_dat2]=bdisp_out(iterN,para,x,...
			chara,det_value,var1st,pre_revsw,out_dat1,out_dat2)
%
% output results
%

global reverse_sw

	%
	% Output of calculated results
	%
		bresults_out(iterN,para,x,chara,det_value,var1st,pre_revsw);

	%
	% The graphic data of a two-parameter bifurcation
	% diagram are held to out_dat1 and/or out_dat2.
	%
	if reverse_sw == 1 % ２方向の変化の時
		if pre_revsw==1

			out_dat1=[out_dat1; para(var1st)];

		elseif pre_revsw==0

			out_dat2=[out_dat2; para(var1st)];

		end

	elseif reverse_sw == 0 % １方向の変化の時

		out_dat1=[out_dat1; para(var1st)];
	end

%end function

