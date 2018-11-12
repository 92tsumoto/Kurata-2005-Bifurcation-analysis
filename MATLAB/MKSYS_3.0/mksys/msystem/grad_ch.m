function [para,ip,dip,endip] = grad_ch(para,ip,dip,endip,pre)
%
% Alternation of variational equations, 
% depending on the gradient of the bifurcation set.
%

	%
	% pre_para と para に関する傾きが au を越えている場合
	%
	fprintf('auto change on\n');

	if ( para(ip(1))-pre(1) > 0 && dip(2) > 0 )
		if dip(1) > 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	elseif ( para(ip(1))-pre(1) < 0 && dip(2) < 0 )
		if dip(1) < 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	elseif ( para(ip(1))-pre(1) < 0 && dip(2) > 0 )
		if dip(1) < 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	elseif ( para(ip(1))-pre(1) > 0 && dip(2) < 0 )
		if dip(1) > 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	end

	ip=fliplr(ip);
	dip=fliplr(dip);
	endip=fliplr(endip);
	dip(2)=ch_sw*dip(2);
	fprintf('para(%d) = %f, dpara(%d) = %f\n',ip(2),para(ip(2)),ip(2),dip(2));
	variational_Eq(ip);

%end function

