function fBF()
%
% main program; BF
%

global ptype
global iosave
global sname sname2
global kmax emax gmax epsx feps
global reltol abstol pre_reltol pre_abstol
global fin fout bf_out1
global au reverse_sw
global bf_type
global ipara istate
global itheta theta
global N M
global mu
global fstop

% program type switch
%
ptype=3;

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
	fin = fopen('_._','rt');

	if fin == -1

		disp('An initial file : no such file or directory.');
		return;

	else

		[init_val] = bpara_input();

		para = init_val(1:M);
		x = init_val(M+1:M+N);

		if bf_type == 3
			theta = init_val(:,end);
		else
			theta = 0;
		end

	%
	% Store of parameters and initial values.
	%
		ipara = para;
		istate = x;
		itheta = theta;
	end	

	fclose(fin);

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
	switch	bf_type
		case 1
			mu=1.0;
			fprintf('The following set is a Saddle-node bifurcation set.\n');
		case 2
			mu=-1.0;
			fprintf('The following set is a Period-doubling bifurcation set. \n');
		case 3
			mu= exp(sqrt(-1)*theta);
			fprintf('The following set is a Neimark-Sacker bifurcation set. \n');
		case 4 
			mu= tmp_mu;
			fprintf('The following set is a parameter set with an arbitrary characteristic value ! \n');
		otherwise
			fprintf('What kind of the bifurcation do you calculate ?\n');
			return;
	end

%
% Display of the initial setting
%

fprintf('k:%f c1:%f c3:%f B0:%f B:%f\n',para(1),para(2),para(3),para(4),para(5));
fprintf('gmax emax: %e %e\n',gmax,emax);
fprintf('epsx feps: %e %e\n',epsx,feps);
fprintf('period h kmax au nnn reverse: %d %d %d %f %d %d\n',l,m,kmax,au,nnn,reverse_sw);
fprintf('x : %e, %e\n',x(1),x(2));
fprintf('i) para(1) para(2) / x | (c.m.)re im abs | (Jacobian)\n');
fprintf('-------------------\n');
if(iosave == 1)
	fprintf(bf_out1,'# %d %d %d %f %f %d %d %d\n',ip(1),ip(2),bf_type,mu,epsx,l,m,kmax);
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
	if bf_type == 3
		pre_theta = theta;
	else
		pre_theta = 0;
	end

	iter_case_count = 0;
	event_count = 0;
	c_count = 0;
	c_iter = 0;

%
% temporary matrix of the state and parameter.
%

	if bf_type == 3
		store_p=zeros(5,N+2);
	else
		store_p=zeros(5,N+1);
	end

%
% initializing the graph
%
	init_graph;
	hold on

%
% the following main routine for calculation 
%
while forcing_stop

	pre = para(ip);	% stok parameter's information

	[para,x,ip,dip,store_p,c_count,c_iter]=...
		predict(para,x,store_p,ip,dip,c_count,c_iter);

	% update of the characteristic multiplier
	% in the case of the NS bifurcation. 

	if bf_type == 3
		[s_ind,iterN,x,para,chara,det_value,theta]=Newton_bf_NS(l,m,x,para,ip,theta);
	else	
		[s_ind,iterN,x,para,chara,det_value]=Newton_bf(l,m,x,para,ip);
	end

	switch s_ind
		case 0 % Convergence

			[out_dat1,out_dat2]=bdisp_out(iterN,para,x,...
				chara,det_value,var1st,pre_revsw,out_dat1,out_dat2);

		case 1 % Many iterations
			
			[para,x,dip,pre_revsw,iter_case_count,event_count]=...
				width_adjust(iterN,para,x,out_dat1,out_dat2,det_value,...
					ip,dip,pre_para,pre_state,pre_theta,pre_revsw,...
						iter_case_count,event_count);

			if event_count == 3
				reltol=pre_reltol;
				abstol=pre_abstol;
				[para,x,ip,dip,endip,pre_revsw,forcing_stop]=iter_case(...
					iterN,para,x,ip,dip,endip,pre_para,pre_state,pre_theta,...
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
					if bf_type == 3
						store_p = zeros(5,N+2);
					else
						store_p = zeros(5,N+1);
					end
			end

		otherwise % divergence, ODE solver error, etc.

			[para,x,ip,dip,endip,pre_revsw,forcing_stop]=div_case(...
				s_ind,para,x,ip,dip,endip,pre_para,pre_state,pre_theta,...
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
					if bf_type == 3
						store_p = zeros(5,N+2);
					else
						store_p = zeros(5,N+1);
					end

		end % end switch

	pre_para = para;
	pre_state = x;
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
			termi_out(para,x,pre_revsw);
			
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
			% check whether the parameter reaches the end parameter
			%

				if find( abs( endip - para(ip) ) <= 0.5*abs(dip) )

				%
				% In case that the parameter reaches the end-parameter,
				% the parameters and state variables at the point are saved.
				%

					[para,x,ip,dip,endip,pre_revsw,forcing_stop]=...
						epara_out(para,x,ip,dip,endip,var1st,dvar1st,end1st,pre_revsw);

					%
					% resetting various setting initial parameters.
					%
						iter_case_count = 0;
						event_count = 0;
						c_count = 0;
						c_iter = 0;
						%ddip=dip;

						if bf_type == 3
							store_p = zeros(5,N+2);
						else
							store_p = zeros(5,N+1);
						end

				else
					% If the variational parameter does not reached
					% the user setting end-parameter value, the parameter para(ip(2))
					% is changed to para(ip(2))+dip(2).

					[para,x,ip,dip,store_p,c_count,c_iter]=...
						correct(para,x,nnn,store_p,ip,dip,c_count,c_iter);
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
				%ddip=dip;
				cflag = 1;
			end
		end

end % end while

%
% resetting the window of the real-time displaying graph
%
	hold off

% Graph display 
%
	out_graph(out_dat1,out_dat2);

%End of main program

