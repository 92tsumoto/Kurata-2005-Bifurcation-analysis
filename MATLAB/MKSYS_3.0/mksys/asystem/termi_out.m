function termi_out(para,x,tau,pre_revsw)
%
% program terminate check
%

global iosave
global bf_out1 bf_out2
global reverse_sw
global sol_type bf_type
global theta N

	if reverse_sw == 1
		if pre_revsw == 1
			fprintf('\n');
			fprintf('This program is forcibly terminated.\n');
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

		elseif pre_revsw == 0

			fprintf('\n');
			fprintf('This program is forcibly terminated.\n');
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

		end
	
	elseif reverse_sw == 0
		fprintf('\n');
		fprintf('This program is forcibly terminated.\n');
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

	end

%end function

