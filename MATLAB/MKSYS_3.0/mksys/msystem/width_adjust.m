function [para,x,dip,pre_revsw,iter_case_count,event_count]=...
	width_adjust(iterN,para,x,out_dat1,out_dat2,det_value,ip,dip,...
		pre_para,pre_state,pre_theta,pre_revsw,iter_case_count,event_count)
%
% This function is for an adjustment of the stop size control of
% the variational parameter. When the calculation returns an error,
% to solve some problem, this function is used.
%

%
% Confirmation of the sizes of the caching
% matrices ``out_dat1'' and ``out_dat2''
%
	tmp1 = size(out_dat1);
	tmp2 = size(out_dat2);

%
% If the determinant of Jacobian matrix of Newton method is close to ``0'',
% the Jacobian matrix could be a singular matrix. Then, the bifurcatin problem
% cannot solve by using Newton method. Therefore, it's considered that the Newton
% method didnot converge. In this case, the settings of ODE solvers are recoverd.
%
	if(abs(det_value) < 1E-4) % <-- cusp点の判定法を考えないといけない．

		event_count = 3;
		return;
	end

	%
	% In other case, it is possible to be the problem of tolerance of ODE solver
	% or step size of the variational parameter. So try again the calculation by
	% changing the smoller tolerance and/or the smoller step size.
	%

	switch event_count
		case {0,1,2} % parameter step size を小さくする試みを 3 回試す
			%
			% パラメータを１つ前の状態に戻す．
			%
			[para,x] = recover_state(pre_para,pre_state,pre_theta,ip,dip,pre_revsw,tmp1,tmp2);

			pre_dip = dip(2);
			dip(2)=0.01*dip(2); % パラメータの刻を 0.01 倍する.
			fprintf('iterations >= %d:\n',iterN);
			fprintf('Now, changing to more small step size: %e to %e\n',pre_dip,dip(2));
			fprintf('\n');

			event_count = event_count + 1;

		otherwise
			%
			% パラメータを１つ前の状態に戻す．
			%
			[para,x] = recover_state(pre_para,pre_state,pre_theta,ip,dip,pre_revsw,tmp1,tmp2);

			event_count = 3;
			return;
	end

%end function


function [para,x] = recover_state(pre_para,pre_state,pre_theta,ip,dip,pre_revsw,tmp1,tmp2)

global reverse_sw
global bf_type
global theta

	if reverse_sw == 1
		if pre_revsw == 1 && tmp1(:,1) > 1
			[para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip);

		elseif pre_revsw == 0 && tmp2(:,1) > 1
			[para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip);

		else
			para = pre_para;
			x = pre_state;
			if bf_type == 3
				theta = pre_theta;
			else
				theta = 0;
			end
		end
	elseif reverse_sw == 0
		if tmp1(:,1) > 1
			[para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip);

		else
			para = pre_para;
			x = pre_state;
			if bf_type == 3
				theta = pre_theta;
			else
				theta = 0;
			end
		end
	end

% end function

function [para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip)

global bf_type theta

	para = pre_para;
	para(ip(2)) = para(ip(2)) - dip(2);
	x = pre_state;
	if bf_type == 3
		theta = pre_theta;
	else
		theta = 0;
	end

%end function

