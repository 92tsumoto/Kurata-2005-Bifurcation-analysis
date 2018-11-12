function fFix()
%
% Main program; FIX
%
% If it is {a,b,m,d}system, the main function have to describe {a,b,m,d}Fix().
%

global ptype
global iograph iosave
global kmax emax gmax epsx feps 
global seigtol
global fin fout f3out
global ini_para eigen_flag bf_flag
global N M
global fstop

% program type switch
ptype=2; % fix program

N; % Dimension of system equation.
M; % Number of system parameters.

% state vector and parameter vector.
%	x = []; para = [];

% temporary vector of parameters and states 
	stok = zeros(1,M+N);

% temporary vector of characteristic multiplier
	chara = zeros(1,N);

% flag of forcing termination (forcing_stop)
	fstop = 0;
	forcing_stop = 1;
	fig_flag = 0;

%
% Initial setting of program 
%

	fout = fopen('stop','wt');
	fprintf(fout,'%d',1);
	fclose(fout);

%
% Reading for the initial setting file.
%
	fin = fopen('fix.in','rt');

	if fin == -1

		disp('An initial setting file fix.in : No such file or directory.');
		return;

	else

		[sname,ipx,ipy,dipx,dipy,endipx,endipy,l,m,nnn,istopbf]=init_finput();

		if fstop
			disp('The program found a description error in fix.in.');
			disp('Please check fix.in and run this program again.');
			return;
		end

	end

	fclose(fin);

%
% Reading the initial file with the initial values. 
% 1st, checking the existence of the initial file.
%

	fin = fopen('_._','rt');

	if fin == -1

		disp('An initial file _._: no such file or directory.');
		return; 

	else

		[init_val]=fpara_input();

		para = init_val(1:M);
		x = init_val(M+1:M+N);

	end

	fclose(fin);

%
% Open for the output data. 
% Addition to a checking overwrite switch.
%

	if iosave==1

		fid = fopen(char(sname),'rt');

		if fid ~= -1
			fprintf('file name: %s already exists.\n',char(sname));
			reply = input('Do you want to overwrite? Y/N [N]: ', 's');

			if strcmp(reply,'y') || strcmp(reply,'Y')
				f3out = fopen(char(sname),'wt');
				fclose(fid);
			else
				disp('Please change the save file name and run this program again.');
				fclose(fid);
				return;
			end
		else 
			f3out = fopen(char(sname),'wt');
		end
		fprintf('\n');
	end

%
% Setting the variational variables.
%
	ip = [ipx ipy];
	dip = [dipx dipy];
	endip = [endipx endipy];
	ini_para = para(ip);

	stok_para = para;
	stok_x = x;
	stok=[para x(1:N)];

	eigen_flag = 0;
	bf_flag = 0;
	sn_flag = 0;

fprintf('k:%f c1:%f c3:%f B0:%f B:%f\n',para(1),para(2),para(3),para(4),para(5),,,);
fprintf('gmax emax: %e %e\n',gmax,emax);
fprintf('epsx feps: %e %e\n',epsx,feps);
fprintf('period h kmax nnn: %d %d %d %d\n',l,m,kmax,nnn);

switch istopbf
	case 0
		fprintf('Detection Type: %d <-- Non Stop Calculation !\n',istopbf);
	case 1
		fprintf('Detection Type: %d <-- After Detected Bifurcation, Calculation Stop\n',istopbf);
	case 2
		fprintf('Detection Type: %d <-- Get Detailed Bifurcation Value \n',istopbf);
end

fprintf('x: %e, %e\n',x(1),x(2),x(3),x(4),,,);
fprintf('i) para(1) para(2) / x | (c.m.)re im abs | (Jacobian)\n');
fprintf('-------------------\n');

%
% the start on the main part.
%

	c_count = 0;

%
% temporary matrix of the state and parameter.
%

	store_p = zeros(5,N);

%
% the following main routine for calculation
%
while forcing_stop

	stok_chara=chara;

	%
	% Prediction of the initial state
	%
		[x,store_p] = fpredict(x,store_p,c_count);

	%
	% Calculated the fixed point.
	%
		[s_ind,iterN,x,para,chara,det_value]=Newton_fix(l,m,x,para);
	
	switch s_ind
		case 0 % convergence case

			if sn_flag == 1	
				[Y,idx] = min(abs(1.0 - abs(stok_chara)));
				eig_dist = abs(1.0 - abs(stok_chara(idx)));

				if abs(eig_dist) < seigtol
					fprintf('Get the initial values for a Saddle-node bifurcation set.\n');
					backup_out(stok);
					break;
				end
			end

			% output_results
				fresults_out(iterN,para,ip,x,chara,det_value);

			% real-time display for the characteristic multiplier loci
			if iograph == 1
				if fig_flag == 0 && isequal(para(ip),ini_para)
					locus_init(chara); % initializing the graph
					fig_flag = 1;
				else
					locus_graph(chara); % real-time display of the result
				end	
			end

			%
			% Discrimination of initial stability and bifurcated values
			%
				[ddelta] = detectbf(x,para,chara,istopbf,ip);

			%
			% In the cases of PD, NS, and Pf bifurcations.
			% 
				if ddelta == 1
					dip = -0.05*dip;
					para(ip) = para(ip) - dip;
					bf_flag=0;
					c_count = 0;
					%store_p = zeros(5,N);
					flipud(store_p);

			%
			% In the cases of period-doubling, Neimark-Sacker, and/or
			% Pitch-fork bifurcation.
			% 
				elseif ddelta == -1
					forcing_stop = 0;
				end
		
		case 1 % Many iterations case
			fprintf('\n');
			fprintf('So many iterations in the Newtons method\n');
			fprintf('It is possible for a saddle-node bifurcation to generate.\n');

			if istopbf == 2
				% In the case of a saddle-node bifurcation, the following routine
				% is to approximate the parameters close to the bifurcation value
		
				[Y,idx] = min(abs(1.0 - abs(stok_chara)));
				eig_dist = abs(1.0 - abs(stok_chara(idx)));

				if abs(eig_dist) < seigtol
					fprintf('Get the initial values for a Saddle-node bifurcation set.\n');
					backup_out(stok);
					break;
				else
					if isequal(para(ip),ini_para)
						fprintf('Please check the initial settings, e.g., Period, initial states, parameter, etc.\n');
					end

					if sn_flag == 0 && kmax >= 10
						kmax = fix(kmax/2);
					end

					sn_flag = 1;
					dip = 0.05*dip;
					para = stok_para;
					x = stok_x;
					c_count = 0;
					store_p = zeros(5,N);
				end

			elseif istopbf == 0 || istopbf == 1
				fprintf('Get the initial values for a saddle-node bifurcation set.\n');
				backup_out(stok);
				break;
			end

		case 2 % Divergence case
			fprintf('\n');
			fprintf('States are divergent\n');
			backup_out(stok);
			break;

		case 3 % The case that the ODE solver returned a error value
			fprintf('\n');
			fprintf('Now, the calculation is terminated.\n');
			fprintf('This is because an error value from the ODE solver is returned.\n');
			backup_out(stok);
			return;

		case 4 % The case that Jacobian matrix for Newton method returned a error value.
			fprintf('\n');
			fprintf('Now, the calculation is terminated.\n');
			fprintf('This is because the Jacobian using Newton''s method became a singular matrix.\n');
			backup_out(stok);
			return;

	end % end switch s_ind

	stok_para=para;
	stok_x=x(1:N);
	stok=[para x(1:N)];

%
% Check for a emergency stop
%
	[termi_stop] = termi_ch();
		if termi_stop == 0
			ftermi_out(stok);
			forcing_stop = 0;
		end

%
% check whether the parameter reaches the end parameter
%
	if s_ind == 0

		if find( abs( endip - para(ip) ) <= 0.5*abs(dip) )
			backup_out(stok);
			break;
		else
			if c_count < 5
				if nnn < 5
					para(ip) = para(ip) + (dip/nnn)/5;
				else
					para(ip) = para(ip) + dip/nnn;
				end
				c_count = c_count + 1;
			elseif c_count >= 5
				if nnn > c_count
					para(ip) = para(ip) + dip/nnn;
				else
					para(ip) = para(ip) + dip;
				end
				c_count = c_count + 1;
			end
		end

	end

end % end while

%
% resetting the window of the real-time displaying graph
%
	if iograph

		hold off

	end

%
% File close
%
	if iosave == 1
		fclose(f3out);
	end

%end main program

