function [para,x,tau,dip,pre_revsw,iter_case_count,event_count]=...
	width_adjust(iterN,para,x,tau,out_dat1,out_dat2,det_value,ip,dip,...
		pre_para,pre_state,pre_tau,pre_theta,pre_revsw,iter_case_count,event_count)
%
% This function is for an adjustment of the stop size control of 
% the variational parameter. When the calculation returns an error,
% to solve some problem, this function is used.
%

global reltol abstol pre_reltol pre_abstol

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

	switch iter_case_count
		case {0,1} % solver tolerance を小さくする試みを 2 回試す
			%
			% パラメータを１つ前の状態に戻す．
			%
			[para,x,tau] = recover_state(pre_para,pre_state,pre_tau,pre_theta,ip,dip,pre_revsw,tmp1,tmp2);

			reltol=0.01*reltol; % 各 tolerance を 0.01 倍する.
			abstol=0.01*abstol;
			fprintf('There is a possibility that this stopped case has\n');
			fprintf('a problem with the tolerance of the ODE solver.\n');
			fprintf('Now tolerance values change: reltol=%e and abstol=%e\n',reltol,abstol);
			fprintf('\n');

			iter_case_count = iter_case_count + 1;

		case 2 % parameter step size を小さくする試みを２回試す．
			%
			% パラメータを１つ前の状態に戻す．
			%
			[para,x,tau] = recover_state(pre_para,pre_state,pre_tau,pre_theta,ip,dip,pre_revsw,tmp1,tmp2);

			pre_dip = dip(2);
			dip(2)=0.01*dip(2); % パラメータの刻を 0.01 倍する.
			fprintf('iterations >= %d:\n',iterN);
			fprintf('Now, changing to more small step size: %e to %e\n',pre_dip,dip(2));
			fprintf('\n');

			reltol = pre_reltol;
			abstol = pre_abstol;
			iter_case_count = 0; % カウンターのリセット
			event_count = event_count + 1;
	end

%end function


function [para,x,tau] = recover_state(pre_para,pre_state,pre_tau,pre_theta,ip,dip,pre_revsw,tmp1,tmp2)

global reverse_sw
global bf_type
global theta

	if reverse_sw == 1	
		if pre_revsw == 1 && tmp1(:,1) > 1
			[para,x,tau] = reset_pre(pre_para,pre_state,pre_tau,pre_theta,ip,dip);

		elseif pre_revsw == 0 && tmp2(:,1) > 1
			[para,x,tau] = reset_pre(pre_para,pre_state,pre_tau,pre_theta,ip,dip);

		else
			para = pre_para;
			x = pre_state;
			tau = pre_tau;
			if bf_type == 3
				theta = pre_theta;
			else
				theta = 0;
			end
		end
	elseif reverse_sw == 0
		if tmp1(:,1) > 1
			[para,x,tau] = reset_pre(pre_para,pre_state,pre_tau,pre_theta,ip,dip);

		else
			para = pre_para;
			x = pre_state;
			tau = pre_tau;
			if bf_type == 3
				theta = pre_theta;
			else
				theta = 0;
			end
		end
	end

% end function

function [para,x,tau] = reset_pre(pre_para,pre_state,pre_tau,pre_theta,ip,dip)

global bf_type theta

	para = pre_para;
	para(ip(2)) = para(ip(2)) - dip(2);
	x = pre_state;
	tau = pre_tau;
	if bf_type == 3
		theta = pre_theta;
	else
		theta = 0;
	end

%end function

