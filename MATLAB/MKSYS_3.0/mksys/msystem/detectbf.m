function [ddelta] = detectbf(x,para,chara,istopbf,ip)
%
% Discrimination of initial stability and bifurcated values
%

global bf_flag
global ini_para
global pre_ind
global N

ddelta=0;

%
% Discrimination of initial stability and bifurcated values
%
	if isequal(para(ip),ini_para)
		iidx = find( abs(chara) >= 1.0 );

		pre_ind = size(iidx);

	else
		iidx = find ( abs(chara) >= 1.0 );

		size_idx = size(iidx);

	end

	%
	% The detection of the change of the number of characteristic
	% multipliers that exceed absolute value one
	%
	if not(isequal(para(ip),ini_para))

		if pre_ind(:,1) ~= size_idx(:,1)
			% If it detects, then search the index of the eigenvalues
			[Y,idx] = min(abs(1.0 - abs(chara)));

			fprintf('Pass through a bifurcation !\n');
			bf_flag = 1;
			%pre_ind = size_idx;

			%
			% Determination of the kind of the bifurcation.
			% If the imaginary part of the detected eigenvalue is not
			% equal to zero, the potential of Neimark-Sacker bufurcation.
			%
			if size_idx(:,1) == pre_ind(:,1) + 2 || size_idx(:,1) == pre_ind(:,1) - 2
				fprintf('The bifurcation is Neimark-Sacker bifurcation\n');
				pre_ind = size_idx;
			%
			% If the imaginary part of the detected eigenvalue is
			% equal to zero, the potential of Pitch-fork or Period-doubling
			% bufurcations.
			%
			else
				%
				% In addition, if the real part of the detected eigenvalue is
				% a negative value, then the bifurcation is ``Period-doubling''
				% bufurcations.
				%
				if real(chara(idx)) < 0
					fprintf('A period-doubling bifurcation is generated.\n');
					pre_ind = size_idx;
				%
				% In addition, if the real part of the detected eigenvalue is
				% a positive value, then the bifurcation is ``Pitch-fork''
				% bufurcations.
				%
				else
					fprintf('A pitch-fork bifurcation is generated.\n');
					pre_ind = size_idx;
				end
			end

		else
			bf_flag = 0;
		end
	else
		bf_flag = 0;
	end

if bf_flag == 1

	%
	% After the detection of the bifurcaiton,
	% To more approximate the parameter to bifurcation values
	%
	if istopbf == 2

		%
		% The absolute value of characteristic multipliers
		% that is more close to 1 is detected. By adjusting the 
		% step size of the control parameter, if the absolute value
		% enters in the following range, the calculation is terminated.
		%
		
		if find( min( abs( 1.0 - abs(chara(idx)) )) < 1E-6 )

			%
			% NS bifurcation
			%
			if imag(chara(idx)) ~= 0
				theta = angle(chara(idx));
				ns_para_out(x,para,theta);

			%
			% T, Pd, Pf bifurcation
			%
			else
				stok = [para x(1:N)];
				backup_out(stok);
			end
		%
		% When ddelta = 1, reverse calculation by changing parameter step
		% size to small value. To finish the detection of a bifurcation
		% point, the calculation is terminated as ``ddelta = -1''.
		%
			ddelta = -1;
			return;

		%
		% In this case, the eigenvalue isnot satisfied a bifurcation condition.
		% So, return ``ddelta = 1'', and reverse calculation by changing
		% parameter step size to small value.
		%
		
		else

			ddelta = 1;

		end % the end of istopbf = 2 case

	%
	% The case that the calculation is terminated after the detection
	% of bifurcations. --> bf_stop case 1
	%

	elseif istopbf == 1
	
		%
		% Save the backup file until calculated values
		%
			stok=[para x(1:N)];
			backup_out(stok);
	
		%
		% To finish the detection of the bifurcation point,
		% the calculation is terminated as ddelta = -1.
		%		
			ddelta=-1;
			return;
	
	%
	% The case that the detection of bifurcations is performed,
	% but the calculation is continued. --> bf_stop case 0
	%

	elseif istopbf == 0
	
		return;
	
	end

end


% end function

