function fBF()
%
% main program; BF
%

global ptype
global sol_type
global iosave
global sname sname2
global kmax emax gmax epsx feps
global reltol abstol pre_reltol pre_abstol
global psec_num
global fin fout bf_out1
global au reverse_sw
global bf_type
global ipara istate
global itau itheta
global theta
global x_eq eq_switch
global N M
global mu
global fstop

% program type switch
ptype=3;

% Whether the Bifurcation analysis of an equilibrium point 
% or a Limit cycle ?
% * Bifurcation analysis of an equilibrium point
% -> sol_type = 1; 
% * Bifurcation analysis of a Limit cycle
% -> sol_type = 2 
%

N; % Dimension of system.
M; % Dimension of parameters.

% state vector and parameter vector.
%	x=[]; para=[];

% parameter vectors of output results
	out_dat1=[]; out_dat2=[];

% argument of a temporary characteristic multiplier
	tmp_mu=0;

% flag of forcing termination (forcing_stop) and
% flag (cflag) when the parameter variation exchanges the direction.
	fstop = 0;
	forcing_stop=1;
	cflag = 0;

%
% Initial setting of program 
%

	fout = fopen('stop','wt');
	fprintf(fout,'%d',1);
	fclose(fout);

%
% Reading for the initial setting file.
%
	fin = fopen('bf.in','rt');
	
	if fin == -1
		
		disp('An initial setting file bf.in : no such file or directory.');
		return;
	
	else

		[ipx,ipy,dipx,dipy,endipx,endipy,tmp_mu,l,m,nnn] = init_binput(tmp_mu);

		if fstop
			disp('The program found a description error in bf.in.');
			disp('Please check bf.in and run this program again.');
			return;
		end

	end

	fclose(fin);

%
% Reading the initial file with the initial values.
% 1st, checking the existence of the initial file.
%
	fin = fopen('@.@','rt');

	if fin == -1
		disp('An initial file : no such file or directory.');
		return;
	else

		[init_val] = bpara_input();

		switch sol_type
			case 1
				para = init_val(1:M);
				x = init_val(M+1:M+N);
				if bf_type == 3
					theta = init_val(:,end);
					tau = 0;
				else
					theta = 0;
					tau = 0;
				end
			case 2
				para = init_val(1:M);
				x = init_val(M+1:M+N);
				tau = init_val(M+N+1:M+N+1);
				if bf_type == 3
					theta = init_val(:,end);
				else
					theta = 0;
				end
		end
	%
	% Store of parameters and initial values.
	%
		ipara = para;
		istate = x;
		%%%%%%
		% The case of Limit cycle
		%%%%%%
			if sol_type == 2
				itau = tau;
			end
		itheta = theta;
	end	
	
	fclose(fin);

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

	var1st = ip;
	dvar1st = dip;
	end1st = endip;

%
% Selection of variational equations, 
% depending on the number of parameters
%
	variational_Eq(ip)

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
				bf_out1 = fopen(char(sname),'wt');
				ssname='.1';
				sname2=[char(sname) char(ssname)];
				fclose(fid);
			else
				disp('Please change the save file name and run this program again.');
				fclose(fid);
				return; % The end of this program.
			end
		else 
			bf_out1 = fopen(char(sname),'wt');
			ssname='.1';
			sname2=[char(sname) char(ssname)];
		end
	
		fprintf('\n');
		fprintf('\n');
	end

%
% Determination of the bifurcation form.
%
	switch sol_type
		case 1
			switch bf_type
				case 1
					mu = 0.0;
					fprintf('The following set is Saddle-node bifurcation set.\n');
				case 3
					mu = sqrt(-1)*theta; % i*omega
					fprintf('The following set is Hopf bifurcation set. \n');
				case 4 
					mu = tmp_mu;
					fprintf('The following set is a parameter set with an arbitrary characteristic value ! \n');
				otherwise
					fprintf('What kind of the bifurcation do you calculate ?\n');
					return;
			end
		case 2
			switch bf_type
				case 1
					mu = 1.0;
					fprintf('The following set is a Saddle-node bifurcation set.\n');
				case 2
					mu = -1.0;
					fprintf('The following set is a Period-doubling bifurcation set. \n');
				case 3
					mu = exp(sqrt(-1)*theta);
					fprintf('The following set is a Neimark-Sacker bifurcation set. \n');
				case 4 
					mu = tmp_mu;
					fprintf('The following set is a parameter set with an arbitrary characteristic value ! \n');
				otherwise
					fprintf('What kind of the bifurcation do you calculate ?\n');
					return;
			end
	end

%
% Display of the initial setting
%
	fprintf('k:%f c1:%f c3:%f B0:%f B:%f\n',para(1),para(2),para(3),para(4),para(5));
	fprintf('gmax emax: %e %e\n',gmax,emax);
	fprintf('epsx feps: %e %e\n',epsx,feps);

	switch sol_type
		case 1
			fprintf('kmax au nnn reverse: %d %f %d %d\n',kmax,au,nnn,reverse_sw);
		case 2
			fprintf('number h kmax au nnn reverse: %d %d %d %f %d %d\n',l,m,kmax,au,nnn,reverse_sw);
	end
	fprintf('x : %e, %e\n',x(1),x(2));
	switch sol_type
		case 1
			fprintf('i) para(1) para(2) / x | (c.m.)re im abs | (Jacobian)\n');
		case 2
			fprintf('The state variable of Poincare section: x(%d)\n',psec_num);
			fprintf('Then, The period of LC tau: (%f)\n',tau);
			fprintf('i) para(1) para(2) / x | (c.m.)re im abs | (Jacobian) Period\n');
	end
	fprintf('-------------------\n');
	if(iosave == 1)
		switch sol_type
			case 1
				fprintf(bf_out1,'# %d %d %d %e %e %d\n',ip(1),ip(2),bf_type,mu,epsx,kmax);
			case 2
				fprintf(bf_out1,'# %d %d %d %e %e %d %d %d\n',ip(1),ip(2),bf_type,mu,epsx,l,m,kmax);
		end
		fprintf(bf_out1,'# %f %f\n',para(ip(1)),para(ip(2)));
	end

%
% Start at main part.
%
	pre_revsw=reverse_sw;
	pre_reltol=reltol;
	pre_abstol=abstol;
	
	%ddip=dip;
	
	pre_para=para;
	pre_state=x;
	pre_tau = tau;
	pre_theta = theta;

	iter_case_count = 0;
	event_count = 0;
	c_count = 0;
	c_iter = 0;

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
			if bf_type == 3
				store_p=zeros(5,N+2);
			else
				store_p=zeros(5,N+1);
			end
		case 2
			if bf_type == 3
				store_p=zeros(5,N+3);
			else
				store_p=zeros(5,N+2);
			end
	end

%
% initializing the graph
%
	init_graph;
	hold on

%
% the following main routein for calculation 
%
	while forcing_stop

		pre = para(ip); % stok parameter's information

		[para,x,tau,ip,dip,store_p,c_count,c_iter]=...
			predict(para,x,tau,store_p,ip,dip,c_count,c_iter);

	%
	% Main function of the Newton method.
	% For Equilibrium point or Limit cycle.
	%
		switch sol_type
			case 1
				if bf_type == 3
					[s_ind,iterN,x,para,chara,det_value,theta]=...
						Newton_bf_HP(para,x,ip,theta);
				else	
					[s_ind,iterN,x,para,chara,det_value]=...
						Newton_bf_eq(para,x,ip);
				end
			case 2
				if bf_type == 3
					[s_ind,iterN,x,para,tau,chara,det_value,theta]=...
						Newton_bf_NS(l,m,para,x,tau,ip,theta,dh,dhinv,dq);
				else	
					[s_ind,iterN,x,para,tau,chara,det_value]=...
						Newton_bf(l,m,para,x,tau,ip,dh,dhinv,dq);
				end
		end

		switch s_ind
			case 0 % Convergence
				[out_dat1,out_dat2]=bdisp_out(iterN,para,x,tau,...
					chara,det_value,var1st,pre_revsw,out_dat1,out_dat2);

			case 1 % Many iterations
				switch sol_type
					case 1
						[para,x,tau,dip,pre_revsw,iter_case_count,event_count]=...
							width_adjust_eq(iterN,para,x,tau,out_dat1,out_dat2,det_value,...
								ip,dip,pre_para,pre_state,pre_tau,pre_theta,...
									pre_revsw,iter_case_count,event_count);
					case 2
						[para,x,tau,dip,pre_revsw,iter_case_count,event_count]=...
							width_adjust(iterN,para,x,tau,out_dat1,out_dat2,det_value,...
								ip,dip,pre_para,pre_state,pre_tau,pre_theta,...
									pre_revsw,iter_case_count,event_count);
				end

				if event_count == 3
					if sol_type == 2
						reltol=pre_reltol;
						abstol=pre_abstol;
					end
					[para,x,tau,ip,dip,endip,pre_revsw,forcing_stop]=iter_case(...
						iterN,para,x,tau,ip,dip,endip,...
							pre_para,pre_state,pre_tau,pre_theta,...
								var1st,dvar1st,end1st,pre_revsw);
				%
				% resetting various setting initial parameters.
				%
					iter_case_count = 0;
					event_count = 0;
					c_count = 0;
					c_iter = 0;
				%
				% clear the matrix of predictor
				%
					switch sol_type
						case 1
							if bf_type == 3
								store_p = zeros(5,N+2);
							else
								store_p = zeros(5,N+1);
							end
						case 2
							if bf_type == 3
								store_p = zeros(5,N+3);
							else
								store_p = zeros(5,N+2);
							end
					end
				end	

			otherwise % divergent, ODE solver error, etc.
				[para,x,tau,ip,dip,endip,pre_revsw,forcing_stop]=div_case(...
					s_ind,para,x,tau,ip,dip,endip,...
						pre_para,pre_state,pre_tau,pre_theta,...
							var1st,dvar1st,end1st,pre_revsw);
			%
			% resetting various setting initial parameters.
			%
				iter_case_count = 0;
				event_count = 0;
				c_count = 0;
				c_iter = 0;
				%ddip=dip;
			%
			% clear the matrix of predictor
			%
				switch sol_type
					case 1
						if bf_type == 3
							store_p = zeros(5,N+2);
						else
							store_p = zeros(5,N+1);
						end
					case 2
						if bf_type == 3
							store_p = zeros(5,N+3);
						else
							store_p = zeros(5,N+2);
						end
				end

		end % end switch

		pre_para = para;
		pre_state = x;
		pre_tau = tau;
		if bf_type == 3
			pre_theta = theta;
		else
			pre_theta = 0;
		end

	%
	% real-time display of the calculation result
	%
		rout_graph(out_dat1,out_dat2,pre_revsw);

	%
	%  A function for Emergency stop
	%
		[termi_stop]=termi_ch();
		
		if termi_stop == 0 
			termi_out(para,x,tau,pre_revsw);

			fprintf('\n');	
			reply = input('Do you want to display the calculated bifurcation curve ? Y/N [Y]: ', 's');
			
			if strcmp(reply,'y') || strcmp(reply,'Y')
				forcing_stop = 0;
			else
				return; % The end of this program.
			end
		end

	%
	% Adjustment of parameter step size.
	%

		if s_ind == 0

		%
		% Checking the gradient of the bifurcation curve.
		%

			if ( abs( para(ip(1)) - pre(1) ) < au*abs(dip(1)) )

			%
			% check whether the parameter reaches the end-parameter value
			%

				if find( abs( endip - para(ip) ) <= 0.5*abs(dip) )

			%
			% In case that the parameter reaches the end-parameter,
			% the parameters and state variables at the point are saved.
			%
					[para,x,tau,ip,dip,endip,pre_revsw,forcing_stop]=epara_out(...
						para,x,tau,ip,dip,endip,var1st,dvar1st,end1st,pre_revsw);

					%
					% resetting various setting initial parameters.
					%
						iter_case_count = 0;
						event_count = 0;
						c_count = 0;
						c_iter = 0;
						%ddip=dip;

						switch sol_type
							case 1
								if bf_type == 3
									store_p = zeros(5,N+2);
								else
									store_p = zeros(5,N+1);
								end
							case 2
								if bf_type == 3
									store_p = zeros(5,N+3);
								else
									store_p = zeros(5,N+2);
								end
						end
				else
					% If the variational parameter does not reached
					% the user setting end-parameter value, the parameter para(ip(2))
					% is changed to para(ip(2))+dip(2).

					[para,x,tau,ip,dip,store_p,c_count,c_iter]=...
						correct(para,x,tau,nnn,store_p,ip,dip,c_count,c_iter);
				end

			else

			%
			% According to the gradient, the unknown parameter variable is
			% changed with the increment parameter.
			%

				[para,ip,dip,endip] = grad_ch(para,ip,dip,endip,pre);
				c_count = 0;
				c_iter = 0;
			end

		end % endif s_ind

	% 
	% In the case that the calculated process doesnot pass through the
	% function ``iter_case.m''to satisfy a terminated condition, a counter
	% with respect to the adjustment of step size must reset.
	%
		if reverse_sw ~= pre_revsw
			if cflag == 0
				iter_case_count = 0;
				event_count = 0;
				%dip=ddip;
				cflag = 1;
			end
		end

	end % end while

%
% resetting the window of the realtime displaying graph
%
	hold off

% Graph display 
%
	out_graph(out_dat1,out_dat2);

%End of main program

