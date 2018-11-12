function [para,x,ip,dip,endip,pre_revsw,forcing_stop]=...
			iter_case(iterN,para,x,ip,dip,endip,...
				pre_para,pre_state,pre_theta,var1st,dvar1st,end1st,pre_revsw)
%
% Treatments of the cases that the Newton method couldn't converge.
%

global iosave
global sname2
global bf_out1 bf_out2
global reverse_sw
global bf_type
global ipara istate
global itheta theta
global mu N

	if reverse_sw == 1
		if pre_revsw == 1
			fprintf('\n');
			fprintf('iterations >= %d:\n',iterN);
		%
		% save the parameters and the state values at the terminated point
		% to the initial value file.
		%
		% save the initial values file consisting of parameters and state values
		%
			tmp = pre_state(1:N);
			if bf_type == 3
				u=[pre_para(:);tmp(:);pre_theta];
			else
				u=[pre_para(:);tmp(:)];
			end
			backup_out2(u,pre_revsw);

		%
		% If iosave is ``on'', initial data file is closed.
		%
			if iosave == 1
				fclose(bf_out1);
			end

		%
		% recover the initial setting.
		%
			para=ipara;
			x=istate;

			if bf_type == 3
				theta = itheta;
				mu = exp(sqrt(-1)*theta);
			else
				theta = 0;
			end
		%
		% recovery the variation of parameter to the initial setting
		%
			ip=var1st;
			endip=end1st;
			variational_Eq(ip);
		%
		% reverse the direction of parameter variation
		%
			dip=-1.0*dvar1st;

		%
		% After the direction of parameter variation changes,
		% a new save file for initial values is opened.
		%
			if iosave == 1
				bf_out2 = fopen(sname2,'wt');
			end
		%
		% the state of reverse switch changes to 0, i.e., pre_revsw to 0.
		%
			pre_revsw = 0;

		%
		% forcibly finish this routine, but for the reversed calculation,
		% the forcibly finished switch is still ``on'', i.e., forcing_stop to ``1''
		%
			fprintf('\n');
			fprintf('Next, calculates the bifurcation set for inverted direction: dip(2)\n');
			fprintf('now here\n');
			forcing_stop = 1;
			return;

		elseif pre_revsw == 0
			fprintf('\n');
			fprintf('iterations >= %d:\n',iterN);

			%
			% If iosave is ``on'', initial data file is closed.
			%
				if iosave == 1
					fclose(bf_out2);
				end

			%
			% save the parameters and the state values at the terminated point
			% to the initial value file.
			%
			% save the initial values file consisting of parameters and state values
			%
				tmp = pre_state(1:N);
				if bf_type == 3
					u=[pre_para(:);tmp(:);pre_theta];
				else
					u=[pre_para(:);tmp(:)];
				end
				backup_out2(u,pre_revsw);

			%
			% forcibly finish this routine and the calculation is stopped,
			% i.e., forcing_stop to ``0''
			%
				forcing_stop = 0;
				return;
		end

	elseif reverse_sw == 0
		fprintf('\n');
		fprintf('iterations >= %d:\n',iterN);

		%
		% If iosave is ``on'', initial data file is closed.
		%
			if iosave == 1
				fclose(bf_out1);
			end

		%
		% save the parameters and the state values at the terminated point
		% to the initial value file.
		%
		% save the initial values file consisting of parameters and state values
		%
			tmp = pre_state(1:N);
			if bf_type == 3
				u=[pre_para(:);tmp(:);pre_theta];
			else
				u=[pre_para(:);tmp(:)];
			end
			backup_out2(u,pre_revsw);

		%
		% forcibly finish this routine and the calculation is stopped,
		% i.e., forcing_stop to ``0''
		%
			forcing_stop = 0;
			return;
	end

%end function

