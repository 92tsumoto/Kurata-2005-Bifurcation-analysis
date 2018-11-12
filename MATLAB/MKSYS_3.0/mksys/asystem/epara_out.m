function [para,x,tau,ip,dip,endip,pre_revsw,forcing_stop]=...
			epara_out(para,x,tau,ip,dip,endip,var1st,dvar1st,end1st,pre_revsw)
%
% End-parameter check
%

global iosave
global sname2
global reltol abstol pre_reltol pre_abstol
global bf_out1 bf_out2
global reverse_sw
global bf_type sol_type
global ipara istate
global itheta itau 
global theta
global mu N

	if reverse_sw == 1
		if pre_revsw == 1
			fprintf('\n');
			fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
		%
		% save the parameters and the state values at the terminated point
		% to the initial value file.
		%
		% save the initial values file consisting of parameters and state values
		%
			tmp = x(1:N);
			switch sol_type
				case 1
					if bf_type == 3
						u=[para(:);tmp(:);theta];
					else
						u=[para(:);tmp(:)];
					end
				case 2
					if bf_type == 3
						u=[para(:);tmp(:);tau;theta];
					else
						u=[para(:);tmp(:);tau];
					end
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
			switch sol_type
				case 1
					tau = 0;
				case 2
					tau = itau;
			end
			switch sol_type
				case 1
					if bf_type == 3
						theta = itheta;
					else
						theta = 0;
					end
				case 2
					if bf_type == 3
						theta = itheta;
						mu = exp(sqrt(-1)*theta);
					else
						theta = 0;
					end
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
		% recover the ODE solver setting to an initial state
		%
			if sol_type == 2
				abstol = pre_abstol;
				reltol = pre_reltol;
			end

		%
		% forcibly finish this routine, but for the reversed calculation,
		% the forcibly finished switch is still ``on'', i.e., forcing_stop to ``1''
		%
			fprintf('\n');
			fprintf('Next, the bifurcation set will be calculated to inverted direction: dip(2)=%e\n',dip(2));
			forcing_stop = 1;
			return;

		elseif pre_revsw == 0
			fprintf('\n');
			fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
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
			tmp = x(1:N);
			switch sol_type
				case 1
					if bf_type == 3
						u=[para(:);tmp(:);theta];
					else
						u=[para(:);tmp(:)];
					end
				case 2
					if bf_type == 3
						u=[para(:);tmp(:);tau;theta];
					else
						u=[para(:);tmp(:);tau];
					end
			end
			backup_out2(u,pre_revsw);

		%
		% forcibly finish this routine, i.e., forcing_stop to ``0''
		%
			forcing_stop = 0;
			return;
		end

	elseif reverse_sw == 0
		fprintf('\n');
		fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
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
			tmp = x(1:N);
			switch sol_type
				case 1
					if bf_type == 3
						u=[para(:);tmp(:);theta];
					else
						u=[para(:);tmp(:)];
					end
				case 2
					if bf_type == 3
						u=[para(:);tmp(:);tau;theta];
					else
						u=[para(:);tmp(:);tau];
					end
			end
			backup_out2(u,pre_revsw);

		%
		% forcibly finish this routine, i.e., forcing_stop to ``0''
		%
			forcing_stop = 0;
			return;
	end

%end function

