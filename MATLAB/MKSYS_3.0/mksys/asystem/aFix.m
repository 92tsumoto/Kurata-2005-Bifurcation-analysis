function fFix()
%
% Main program; FIX
%
% If it is {a,b,m,d}system, the main function have to describe {a,b,m,d}Fix().
%

global ptype
global sol_type
global iograph iosave
global kmax emax gmax epsx feps 
global psec_num seigtol
global fin fout f3out
global eigen_flag bf_flag
global ini_para
global x_eq eq_switch
global N M
global fstop

% program type switch
ptype=2; % fix program

% Whether the Bifurcation analysis of an equilibrium point 
% or a Limit cycle ?
% * Bifurcation analysis of an equilibrium point
% -> sol_type = 1; 
% * Bifurcation analysis of a Limit cycle
% -> sol_type = 2 
%

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
% Reading the initial file with the initial values. 
% 1st, checking the existence of the initial file.
%
	fin = fopen('@.@','rt');

	if fin == -1
		disp('An initial file @.@: no such file or directory.');
		fclose(fin);
		return; 
	else
		[init_val]=fpara_input();
			switch sol_type
				case 1
					para = init_val(1:M);
					x = init_val(M+1:M+N);
					tau = 0;
				case 2
					para = init_val(1:M);
					x = init_val(M+1:M+N);
					tau = init_val(:,end);
			end
		fclose(fin);
	end
	
	switch sol_type
		case 1
			stok=[para x(1:N)];
		case 2 
			stok=[para x(1:N) tau];
	end

%
% Reading the initial file ``ep.ini'' or ``ep.fix'' for the Poincare section.
% 1st, checking the existence of the initial file.
%
	if sol_type == 2
		fin_eqini = fopen('eq.ini','rt');
		fin_eqfix = fopen('eq.fix','rt');

		if fin_eqini ~= -1 && fin_eqfix ~= -1
			fprintf('Which do you want to use as the setting file `eq.ini'' or `eq.fix'' ?\n');
			fprintf('`eq.ini'': the case that an equilibrium point is used as the basis for the Poincare section.\n');
			fprintf('`eq.fix'': the case that an arbitrary value is used as the basis for the Poincare section.\n');
			reply = input('1)eq.ini; 2)eq.fix ? [1]/[2]: ', 's');

			if strcmp(reply,'1')
				fprintf('An equilibrium point is used as the basis for the Poincare section.\n');
				x_eq = fscanf(fin_eqini,'%e\n',[1,N]);
				eq_switch = 1;
				fclose(fin_eqini);
				fclose(fin_eqfix);

			elseif strcmp(reply,'2')
				fprintf('An arbitrary value is used as the basis for the Poincare section.\n');
				x_eq = fscanf(fin_eqfix,'%e\n',[1,N]);
				eq_switch = 0;
				fclose(fin_eqini);
				fclose(fin_eqfix);

			else
				fprintf('A state variable in the inital value file @.@ is used as the basis for the Poincare section.\n');
				x_eq = x;
				eq_switch = 0;
				fclose(fin_eqini);
				fclose(fin_eqfix);
			end

		elseif fin_eqini ~= -1
			fprintf('An equilibrium point is used as the basis for the Poincare section.\n');
			x_eq = fscanf(fin_eqini,'%e\n',[1,N]);
			eq_switch = 1;
			fclose(fin_eqini);

		elseif fin_eqfix ~= -1
			fprintf('An arbitrary value is used as the basis for the Poincare section.\n');
			x_eq = fscanf(fin_eqfix,'%e\n',[1,N]);
			eq_switch = 0;
			fclose(fin_eqfix);
		else
			fprintf('An arbitrary value is used as the basis for the Poincare section.\n');
			x_eq = x;
			eq_switch = 0;
		end
	end

%
% Setting the variational variables.
%
	ip = [ipx ipy];
	dip = [dipx dipy];
	endip = [endipx endipy];
	ini_para = para(ip);

	stok_para=para;
	stok_x=x(1:N);
	stok_tau = tau;

	switch sol_type
		case 1
			stok=[para x(1:N)];
		case 2 
			stok=[para x(1:N) tau];
	end

	eigen_flag = 0;
	bf_flag = 0;
	sn_flag = 0;

%
% First display
%
	fprintf('k:%f c1:%f c3:%f B0:%f B:%f\n',para(1),para(2),para(3),para(4),para(5),,,);
	fprintf('gmax emax: %e %e\n',gmax,emax);
	fprintf('epsx feps: %e %e\n',epsx,feps);

	switch sol_type
		case 1
			fprintf('kmax nnn: %d %d %d %d\n',kmax,nnn);
		case 2
			fprintf('period  h kmax nnn: %d %d %d %d\n',l,m,kmax,nnn);
	end

	switch istopbf
		case 0
			fprintf('Detection Type: %d <-- Non Stop Calculation !\n',istopbf);
		case 1
			fprintf('Detection Type: %d <-- After Detected Bifurcation, Calculation Stop\n',istopbf);
		case 2
			fprintf('Detection Type: %d <-- Get Detailed Bifurcation Value \n',istopbf);
	end

	fprintf('x: %e, %e\n',x(1),x(2),x(3),x(4),,,);
	switch sol_type
		case 1
			fprintf('i) para(1) para(2) / x | (c.m.)re im abs | (jacobian)\n');
		case 2
			fprintf('The state variable of Poincare section: x(%d)\n',psec_num);
			fprintf('Then, The period of LC tau: (%f)\n',tau);
			fprintf('i) para(1) para(2) / x | (c.m.)re im abs | (Jacobian) Period\n');
	end
	fprintf('-------------------\n');

%
% the start on the main part.
%
	c_count = 0;

%
% preparation for making the Poincare map
% coded by Ueta source code
%%%%%%%%
% make dh (x -> u)
%%%%%%%%

	dh = zeros(N-1, N);

	for ii = 1:N-1
		k = 1;
		for jj = 1:N
			if jj == psec_num
				continue;
			end
			if k == ii
				dh(ii, jj) = 1;
			end
			k = k + 1;
		end
	end

%%%%%%%%
% make dh^{-1} by transpose
%%%%%%%%

	dhinv = transpose(dh);

%%%%%%%%
% make dq
%%%%%%%%
	dq = zeros(1,N);
	dq(psec_num) = 1;

%
% temporary matrix of the state and parameter.
%
	
	switch sol_type
		case 1
			store_p = zeros(5,N);
		case 2
			store_p = zeros(5,N+1);
	end

%
% the following main routine for calculation
%
while forcing_stop

	stok_chara=chara;

	%
	% Prediction of the initial state
	%
	
	switch sol_type
		case 1
			[x,store_p] = fpredict(x,store_p,c_count);
		case 2
			uu = [x tau];
			[uu,store_p] = fpredict(uu,store_p,c_count);
			x = uu(1:N);
			tau = uu(:,end);
	end

	%
	% Calculated the equilibrium or periodic point.
	%
	switch sol_type

		case 1 % the equilibrium point.
			[s_ind,iterN,para,x,chara,det_value]=...
							Newton_fix_eq(para,x);

		case 2 % the limit cycle.
			[s_ind,iterN,para,x,tau,chara,det_value]=...
							Newton_fix(l,m,para,x,tau,dh,dhinv,dq);

	end

	switch s_ind

		case 0 % convergence case
			if sn_flag == 1
				switch sol_type
					case 1	
						[Y,idx] = min(abs(stok_chara));
						eig_dist = real(stok_chara(idx));
					case 2
						%常に１になる固有値を除去する
						discri_ch = stok_chara;
						[Y,idx] = min(abs(1.0 - abs(discri_ch)));
						discri_ch(idx,:) = [];
						[YY,udx] = min(abs(1.0 - abs(discri_ch)));
						eig_dist = abs(1.0 - abs(discri_ch(udx)));
				end	

				if abs(eig_dist) < seigtol
					fprintf('Get the initial values for a saddle-node bifurcation set.\n');
					backup_out(stok);
					break;
				end
			end

			% output_results
				switch sol_type
					case 1
						fresults_out(iterN,para,ip,x,chara,0,det_value);
					case 2
						fresults_out(iterN,para,ip,x,chara,tau,det_value);
				end

			% real-time display for the characteristic multiplier loci
			if iograph == 1
				if fig_flag == 0 && isequal(para(ip),ini_para)
				switch sol_type
					case 1
						locus_init_eq(chara); % initializing the graph
						fig_flag = 1;
					case 2
						locus_init(chara); % initializing the graph
						fig_flag = 1;
				end

				else
					locus_graph(chara); % real-time display of the result
				end	
			end

			%
			% Discrimination of initial stability and bifurcated values
			%
			switch sol_type 
				case 1
					[ddelta] = detectbf_eq(x,para,chara,istopbf,ip);
				case 2
					[ddelta] = detectbf(x,para,tau,chara,istopbf,ip);
			end

			%
			% In the cases of Hopf, PD, NS, and Pf bifurcations
			% 
				if ddelta == 1
					dip = -0.05*dip;
					para(ip) = para(ip) - dip;
					bf_flag=0;
					c_count = 0;
					switch sol_type
						case 1
							%store_p = zeros(5,N);
							flipud(store_p);
						case 2
							%store_p = zeros(5,N+1);
							flipud(store_p);
					end
			%
			% In the cases of Hopf, period-doubling, Neimark-Sacker,
			% and/or Pitch-fork bifurcation.
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

				switch sol_type
					case 1	
						[Y,idx] = min(abs(stok_chara));
						eig_dist = real(stok_chara(idx));
					case 2
						%常に１になる固有値を除去する
						discri_ch = stok_chara;
						[Y,idx] = min(abs(1.0 - abs(discri_ch)));
						discri_ch(idx,:) = [];
						[YY,udx] = min(abs(1.0 - abs(discri_ch)));
						eig_dist = abs(1.0 - abs(discri_ch(udx)));
				end	
				
				if abs(eig_dist) < seigtol
					fprintf('Get the initial values for a saddle-node bifurcation set.\n');
					backup_out(stok);
					break;
				else
					if isequal(para(ip),ini_para)
						fprintf('Please check the initial settings, e.g., Period, return time, initial states, parameter, etc.\n');
					end

					if sn_flag == 0 && kmax >= 10
						kmax = fix(kmax/2);
					end
					
					sn_flag = 1;
					dip = 0.05*dip;
					para = stok_para;
					x = stok_x;

					if sol_type == 2
						tau = stok_tau;
					else
						tau = 0;
					end

					c_count = 0;
					switch sol_type
						case 1
							store_p = zeros(5,N);
						case 2
							store_p = zeros(5,N+1);
					end
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

		case 3 % emergence of a problem on the numerical computation
			fprintf('\n');
			fprintf('Now, the calculation is terminated.\n');
			switch sol_type
				case 1
					fprintf('This is because the return values from the function f included an inf value.\n');
				case 2
					fprintf('This is because an error value from the ODE solver is returned.\n');
			end
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
	stok_tau = tau;

	switch sol_type
		case 1
			stok=[para x(1:N)];
		case 2 
			stok=[para x(1:N) tau];
	end

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

