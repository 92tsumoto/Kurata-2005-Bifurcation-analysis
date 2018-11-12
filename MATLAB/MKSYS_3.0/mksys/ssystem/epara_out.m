function [para,x,ip,dip,endip,pre_revsw,forcing_stop]=...
			epara_out(para,x,ip,dip,endip,var1st,dvar1st,end1st,pre_revsw)
%
% End-parameter check
%

global iosave
global sname2
global reltol abstol pre_reltol pre_abstol
global bf_out1 bf_out2
global reverse_sw
global bf_type
global ipara istate
global itheta theta
global mu N

	if reverse_sw == 1
		if pre_revsw == 1
			fprintf('\n');
			fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
		%
		% parameter at the terminated point. save in initial state file.
		%
			tmp = x(1:N);
			if bf_type == 3
				u=[para(:);tmp(:);theta];
			else
				u=[para(:);tmp(:)];
			end
			backup_out2(u,pre_revsw);

		%
		% If output file flag is on, then file is closed.
		%
			if iosave == 1
				fclose(bf_out1);
			end

		%
		% get back to initial setting.
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
		% get back to variations of parameters.
		%
			ip=var1st;
			endip=end1st;
			variational_Eq(ip);

			dip=-1.0*dvar1st;

		%
		% save file is opened after the direction of variable parameter is changed.
		%
			if iosave == 1
				bf_out2 = fopen(sname2,'wt');
			end
		%
		% changes in pre_revsw.
		%
			pre_revsw = 0;

		%
		% get back to ode solver settings.
		%
			abstol = pre_abstol;
			reltol = pre_reltol;

		%
		% forcibly finish this routine, but the calculation continue,
		% i.e., forcing_stop to ``1''
		%
			fprintf('\n');
			fprintf('Next, the bifurcation set will be calculated to inverted direction: dip(2)=%e\n',dip(2));
			forcing_stop = 1;
			return;

		elseif pre_revsw == 0

			fprintf('\n');
			fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
		%
		% If file output is on, then the file is closed.
		%
			if iosave == 1
				fclose(bf_out2);
			end

		%
		% output the initial setting file
		%
			tmp = x(1:N);
			if bf_type == 3
				u=[para(:);tmp(:);theta];
			else
				u=[para(:);tmp(:)];
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
		fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
	%
	% If file output is on, then the file is closed.
	%
		if iosave == 1
			fclose(bf_out1);
		end

	%
	% parameter at the terminated point. save in initial state file.
	%
		tmp = x(1:N);
		if bf_type == 3
			u=[para(:);tmp(:);theta];
		else
			u=[para(:);tmp(:)];
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

