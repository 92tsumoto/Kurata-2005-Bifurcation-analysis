function [para,x,tau,dip,pre_revsw,iter_case_count,event_count]=...
	width_adjust_eq(iterN,para,x,tau,out_dat1,out_dat2,det_value,ip,dip,...
		pre_para,pre_state,pre_tau,pre_theta,pre_revsw,iter_case_count,event_count)
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

	switch iter_case_count
		case {0,1,2} % parameter step size を小さくする試みを２回試す．
			%
			% パラメータを１つ前の状態に戻す．
			%
			[para,x,tau] = recover_state(pre_para,pre_state,pre_tau,pre_theta,ip,dip,pre_revsw,tmp1,tmp2);

			pre_dip = dip(2);
			dip(2)=0.01*dip(2); % パラメータの刻を 0.01 倍する.
			fprintf('iterations >= %d:\n',iterN);
			fprintf('Now, changing to more small step size: %e to %e\n',pre_dip,dip(2));
			fprintf('\n');

			iter_case_count = iter_case_count + 1;
			event_count = event_count + 1;
	end

%end function

