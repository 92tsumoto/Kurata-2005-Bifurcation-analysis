function sGGbf()
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

N=3; % Dimension of the system
M=3; % The number of the system parameters

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

		[ipx,ipy,dipx,dipy,endipx,endipy,tmp_mu,l,m,nnn,tau1] = init_binput(tmp_mu);

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

fprintf('smin:%f smax:%f omega:%f \n',para(1),para(2),para(3));

fprintf('gmax emax: %e %e\n',gmax,emax);
fprintf('epsx feps: %e %e\n',epsx,feps);
fprintf('period h kmax au nnn reverse: %d %d %d %f %d %d\n',l,m,kmax,au,nnn,reverse_sw);
fprintf('pulse duration tau1: %f\n',tau1);
fprintf('x : %e, %e, %e\n',x(1),x(2),x(3));

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
		[s_ind,iterN,x,para,chara,det_value]=Newton_bf(l,m,x,para,ip,tau1);
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


function [init_val]=bpara_input()
%
% inputs of the values of the state variables and their parameters
%

global fin
global N M
global bf_type

	if bf_type == 3
		num = N + M + 1;
	else
		num = N + M;
	end
	init_val = fscanf(fin,'%e\n',[1,num]);
	
%end function


function [ipx,ipy,dipx,dipy,endipx,endipy,tmp_mu,l,m,nnn,tau1] = init_binput(tmp_mu)
%
% inputs of various values of the initial setting
%
% If the calculated data are save to a text file, 
% then in the bf.in, the value, i.e., iosave, should be 1
% and a file name to save the calculated data must describe
% the next line from top of bf.in.
%

global iosave
global sname
global gmax emax kmax epsx feps
global reltol abstol
global solsw
global bf_type
global au adj_step reverse_sw
global fstop

try
% Detection of save data
[iosave]=textread('bf.in','%d',1,'commentstyle','c++','delimiter', ',','whitespace',' ');
%
% If the calculated data are save to a text file, 
% then the switch iosave should be 1.

if iosave==0
	sname='emptyfile';
	
	[gmax,emax,epsx,feps,reltol,abstol,solsw,ipx,ipy,dipx,endipx,dipy,endipy]=...
			textread('bf.in','%f %f %f %f %f %f %d %d %d %f %f %f %f',1,'headerlines',1,'commentstyle','c++','delimiter',',','whitespace',' ');
	
	[bf_type]=textread('bf.in','%d',1,'headerlines',8,'commentstyle','c++','delimiter', ',','whitespace',' ');
	
	if bf_type ~= 4 
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',9,'commentstyle','c++','delimiter',',','whitespace',' ');
	else
		[tmp_mu]=textread('bf.in','%f',1,'headerlines',9,'commentstyle','c++','delimiter',',','whitespace',' ');
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',10,'commentstyle','c++','delimiter',',','whitespace',' ');
	end

elseif iosave==1
	[sname]=textread('bf.in','%s',1,'headerlines',1,'commentstyle','c++','delimiter', ',','whitespace',' ');
	[gmax,emax,epsx,feps,reltol,abstol,solsw,ipx,ipy,dipx,endipx,dipy,endipy]=...
			textread('bf.in','%f %f %f %f %f %f %d %d %d %f %f %f %f',1,'headerlines',2,'commentstyle','c++','delimiter',',','whitespace',' ');
	
	[bf_type]=textread('bf.in','%d',1,'headerlines',9,'commentstyle','c++','delimiter', ',','whitespace',' ');

	if bf_type ~= 4 
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',10,'commentstyle','c++','delimiter',',','whitespace',' ');
	else
		[tmp_mu]=textread('bf.in','%f',1,'headerlines',10,'commentstyle','c++','delimiter',',','whitespace',' ');
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',11,'commentstyle','c++','delimiter',',','whitespace',' ');
	end

	if isempty(reverse_sw)
		%
		% If the variables can't read, the variables are input
		% mimicing values, and returned.
		% fstop : a flag for the forcing stop
		%
		ipx=-1;ipy=-1;dipx=-1;dipy=-1;endipx=-1;endipy=-1;
		tmp_mu=-1;l=-1;m=-1;nnn=-1;tau1=-1;

		fstop = 1;
		return;
	end

end

catch
	%
	% The case where there is an error for reading 
	% the initial setting file.
	%
	ipx=-1;ipy=-1;dipx=-1;dipy=-1;endipx=-1;endipy=-1;
	tmp_mu=-1;l=-1;m=-1;nnn=-1;tau1=-1;

	fstop = 1;
	return;
end

%end function


function [s_ind,iterN,x,para,chara,det_value]=Newton_bf(l,m,x,para,ip,tau1)
%
% Get bifurcation points
%

global kmax emax gmax epsx feps 
global N M

s_ind=0; 
edist=0.0; 
iterN=1; 
%sig = 0;
df0 = eye(N);
dp0 = zeros(N,1);
ddx0 = zeros(N^2,N);
ddxp0 = zeros(N,N);

% The matrix DT denote the Jacobian matrix using the Newton's method.
	%DT0 = zeros(N);
	%DT1 = zeros(N);
	DT = zeros(N+1,N+1);

while (1)  % Newton's Method

	count = l; % period counter variable

% The arguments x_n0 denote state vector x_0 of a one previous step.
%	xn0=[x(1);x(2)];

	x=x(:);
	p0=para(ip(1));
	xn0=[x(1:N);p0];

% The value x_n1 of the states after t=2*l*pi  

	while count > 0

		sig = 0;
		store_min = para(M-2); % stok for the minimum value of s(t)
		xn1 = fsysvar(l,m,x,para,tau1,sig); % numerical integration from 0 to tau1

		d2tmp = dkaidx_dkaidp(xn1);
		d2soldx2_0 = d2tmp(1:N^2,1:N);
		d2soldxdp_0 = d2tmp(N^2+1:N^2+N,1:N);

		%
		% If the ODE solver is returned a error, then the calculation
		% will be terminated here. The terminated information will be
		% returned to the main routine as s_ind = 3.
		%
			if find( isnan(xn1) == 1)
				s_ind = 3;
				chara = 0;
				det_value = 1E+100;
				return;
			end

		Df0 = DF(xn1) + eye(N);

		mkddx = d2soldx2_0*df0;
		q1 = mkddx(1:3,:);
		q2 = mkddx(4:6,:);
		q3 = mkddx(7:9,:);
		q0 = [q1(:) q2(:) q3(:)]*df0;
		q1 = Df0*ddx0(1:3,:);
		q2 = Df0*ddx0(4:6,:);
		q3 = Df0*ddx0(7:9,:);
		ddx1 = q0 + [q1;q2;q3];

		if ip(1) == M-2 % case of the specific parameter 1 (vmin)
			%
			% mkdp1
			%
			dpara1 = dTdP(xn1) + Df0*dp0;

			%
			% mkdxdp1
			%
			r1 = d2soldx2_0(1:3,:)*dp0;
			r2 = d2soldx2_0(4:6,:)*dp0;
			r3 = d2soldx2_0(7:9,:)*dp0;
			r0 = [r1 r2 r3];
			ddxp1 = d2soldxdp_0*df0 + r0*df0 + Df0*ddxp0;

		elseif ip(1) == M-1 % case of the specific parameter 2 (vmax)
			%
			% mkdp1
			%
			dpara1 = Df0*dp0;

			%
			% mkdxdp1
			%
			r1 = d2soldx2_0(1:3,:)*dp0;
			r2 = d2soldx2_0(4:6,:)*dp0;
			r3 = d2soldx2_0(7:9,:)*dp0;
			r0 = [r1 r2 r3];
			ddxp1 = r0*df0 + Df0*ddxp0;

		else
			%
			% mkdp1
			%
			dpara1 = dTdP(xn1) + Df0*dp0;

			%
			% mkdxdp1
			%
			r1 = d2soldx2_0(1:3,:)*dp0;
			r2 = d2soldx2_0(4:6,:)*dp0;
			r3 = d2soldx2_0(7:9,:)*dp0;
			r0 = [r1 r2 r3];
			ddxp1 = d2soldxdp_0*df0 + r0*df0 + Df0*ddxp0;
		end

		tmp_xn1 = xn1(1:N).';
		sig = 1;
		para(M-2) = para(M-1); % minimum value to maximum value of s(t)
		xn2 = fsysvar(l,m,tmp_xn1,para,tau1,sig); % numerical integration from tau1 to tau
		para(M-2) = store_min; % return to minimum value of s(t)

		d2tmp = dkaidx_dkaidp(xn2);
		d2soldx2_1 = d2tmp(1:N^2,1:N);
		d2soldxdp_1 = d2tmp(N^2+1:N^2+N,1:N);

		%
		% If the ODE solver is returned a error, then the calculation
		% will be terminated here. The terminated information will be
		% returned to the main routine as s_ind = 3.
		%
			if find( isnan(xn2) == 1)
				s_ind = 3;
				chara = 0;
				det_value = 1E+100;
				return;
			end

		Df1 = DF(xn2) + eye(N);

		mkddx = d2soldx2_1*(Df0*df0);
		q1 = mkddx(1:3,:);
		q2 = mkddx(4:6,:);
		q3 = mkddx(7:9,:);
		q0 = [q1(:) q2(:) q3(:)]*(Df0*df0);
		q1 = Df1*ddx1(1:3,:);
		q2 = Df1*ddx1(4:6,:);
		q3 = Df1*ddx1(7:9,:);
		ddx2 = q0 + [q1;q2;q3];

		if ip(1) == M-2 % case of the specific parameter 1 (vmin)
			%
			% mkdp2
			%
			dpara2 = Df1*dpara1;

			%
			% mkdxdp2
			%
			r1 = d2soldx2_1(1:3,:)*dpara1;
			r2 = d2soldx2_1(4:6,:)*dpara1;
			r3 = d2soldx2_1(7:9,:)*dpara1;
			r0 = [r1 r2 r3];
			ddxp2 = r0*(Df0*df0) + Df1*ddxp1;

		elseif ip(1) == M-1 % case of the specific parameter 2 (vmax)
			%
			% mkdp2
			%
			dpara2 = dTdP(xn2) + Df1*dpara1;

			%
			% mkdxdp2
			%
			r1 = d2soldx2_1(1:3,:)*dpara1;
			r2 = d2soldx2_1(4:6,:)*dpara1;
			r3 = d2soldx2_1(7:9,:)*dpara1;
			r0 = [r1 r2 r3];
			ddxp2 = d2soldxdp_1*(Df0*df0) + r0*(Df0*df0) + Df1*ddxp1;

		else
			%
			% mkdp2
			%
			dpara2 = dTdP(xn2) + Df1*dpara1;

			%
			% mkdxdp2
			%
			r1 = d2soldx2_1(1:3,:)*dpara1;
			r2 = d2soldx2_1(4:6,:)*dpara1;
			r3 = d2soldx2_1(7:9,:)*dpara1;
			r0 = [r1 r2 r3];
			ddxp2 = d2soldxdp_1*(Df0*df0) + r0*(Df0*df0) + Df1*ddxp1;
		end

		DT = Df1*Df0*df0;

		count = count - 1;

		if count > 0
			x = xn2;
			df0 = DT;
			dp0 = dpara2;
			ddx0 = ddx2;
			ddxp0 = ddxp2;
		end
	end

% It calculates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.

	[dkaidx,dkaidp,Fch] = dKaidxdp(DT,ddx2,ddxp2);
	DF = [DT - eye(N) dpara2;
				dkaidx dkaidp];

	Fxn = xn2(1:N) - xn0(1:N); % T(x0) - x0 = 0
	Fn = [Fxn;Fch];

%
% The next step value of the states is calculated as follow:
%
% x(1:N)=xn0(:)+A\Fxn;
% 

	z = xn0(:) - DF\Fn;

	%
	% If the Jacobian matrix using Newton's method becomes a singular matrix,
	% then the next step value can not calculate. The calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 4.
	%
	if find( isnan(z) == 1)
		s_ind = 4;
		chara = 0;
		det_value = 1E+100;
		return;
	end
	
	x=z(1:N);
	para(ip(1))=z(end,:);


% Convergence conditions for Newton's method
%
% The distance between the before and after values
%
% Convergence conditions (No.1)

	ddx=z(1:N)-xn0(1:N);
	ddp=(z(end,:)-p0)/z(end,:);
	ddu=[ddx;ddp];
	dist=(sum(abs(ddu)))/(N+1);

	if dist < epsx  
		break;
	end
	
% Convergence conditions (No.2)

	if sum(abs(Fn))/(N+1) < feps
		break;
	end

% Divergence conditions from the value of some functions
	
	if(abs(xn0) < 1/emax)
		temp=abs(ddx*emax);
	else
		temp=abs(ddu./xn0(:));
	end
	rerror=min(temp,ddu);
	edist=edist+rerror;
	
	ddg=sum(sum(abs(DT)))/(N*N);
	
	if ddg > gmax 
		s_ind = 2; % divergence of system
		break;
	elseif edist > emax
		s_ind = 2; % divergence
		break;
	end

	% Divergence condition of the number of iterations

	if iterN >= kmax - 1
		s_ind = 1; % sorry iterating too much
		break;
	end

	iterN = iterN + 1;

	df0 = eye(N);
	dp0 = zeros(N,1);
	ddx0 = zeros(N^2,N);
	ddxp0 = zeros(N,N);

end % here is the while end.

%
% Characteristic Multipliers
%

	%[V,W] = eig( Df + eye(N) );
	[V,W] = eig( DT );
	chara = diag(W);
	det_value = det(DF);

%end function

function [s_ind,iterN,x,para,chara,det_value,theta]=Newton_bf_NS(l,m,x,para,ip,theta)
%
% Get bifurcation points
%

global kmax emax gmax epsx feps 
global N

s_ind=0; 
edist=0.0; 
iterN=1; 

% The matrix DT denote the Jacobian matrix using the Newton's method.
	DT = zeros(N+2,N+2);

% derivative related to theta in a function F (This value is always zero)
	dTdtheta(N,1)= 0;

while (1)  % Newton's Method

% The arguments x_n0 denote state vector x_0 of a one previous step.
%	xn0=[x(1);x(2)];

	x=x(:);
	p0=para(ip(1));
	theta0=theta;
	xn0=[x(1:N);p0;theta0];

% The value x_n1 of the states after t=2*l*pi  

	xn1 = fsysvar(l,m,x,para);

	%
	% If the ODE solver is returned a error, then the calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 3.
	%
	if find( isnan(xn1) == 1)
		s_ind = 3;
		chara = 0;
		det_value = 1E+100;
		return;
	end

% It calculates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.

	Df = DF(xn1);
	dTdpara = dTdP(xn1);
	[dkaidx,dkaidp,dkaidtheta,Fch] = dKaidxdp_NS(xn1,theta);
	DT = [ Df dTdpara dTdtheta; 
			real(dkaidx) real(dkaidp) real(dkaidtheta);
			imag(dkaidx) imag(dkaidp) imag(dkaidtheta) ];

	Fxn = xn1(1:N) - xn0(1:N); % T(x0) - x0 = 0
	Fn = [Fxn;real(Fch);imag(Fch)];

% Convergence conditions (No.1)

	if sum(abs(Fn))/(N+2) < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
%
% x(1:N)=xn0(:)+A\Fxn;
% 

	z = xn0(:) + DT\Fn;

	%
	% If the Jacobian matrix using Newton's method becomes a singular matrix,
	% then the next step value can not calculate. The calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 4.
	%
	if find( isnan(z) == 1)
		s_ind = 4;
		chara = 0;
		det_value = 1E+100;
		return;
	end

%
% The independent variables are (x1,...xn, bif_para(1),theta).
%
	x=z(1:N);
	para(ip(1))=z(N+1,:);
	theta=z(end,:);

%
% The distance between the before and after values
%
	
	% Convergence conditions (No.2)

	ddx=z(1:N)-xn0(1:N); % distance of states.
	ddp=(z(N+1,:)-p0)/z(N+1,:); % distance of a parameter.
	dda=(z(end,:)-theta0)/z(end,:); % distance of angle.
	ddu=[ddx;ddp;dda];
	dist=(sum(abs(ddu)))/(N+2);

	% Convergence conditions for Newton's method
	
	if dist < epsx  
		break;
	end
	
	% Divergence conditions from the value of some functions
	
	if(abs(xn0) < 1/emax)
		temp=abs(ddx*emax);
	else
		temp=abs(ddu./xn0(:));
	end
	rerror=min(temp,ddu);
	edist=edist+rerror;
	
	ddg=sum(sum(abs(DT)))/(N*N);
	
	if ddg > gmax 
		s_ind = 2; % divergence of system
		break;
	elseif edist > emax
		s_ind = 2; % divergence
		break;
	end

	% Divergence condition of the number of iterations

	if iterN >= kmax - 1
		s_ind = 1; % sorry iterating too much
		break;
	end

	iterN = iterN + 1;

end % here is the while end.

%
% Characteristic Multipliers
%

	[V,W] = eig( Df + eye(N) );
	chara = diag(W);
	det_value = det(DT);

%
% The following part is to detect a terminated point by generated NS bifurcation.
% Search an index of absolute value 1 in characteristic multipliers in characteristic equation.
%

	abs_ipart = imag(chara(abs(1.0 - abs(chara))<10*epsx));

%
% How many the number of the imaginary part of characteristic multipliers of abs(1)?
% The number set to the variable, num1, i.e. in the case of NS, num1 is two.
%

	num1 = size(abs_ipart);

%
% In the case that NS bifurcation set joints other bifurcation set, the number of imaginary parts
% of characteristic multiplier changes from 2 to 1. Thus, if the variable, num1, is lower than 2,
% then the calculation is terminated. Then, the flag, s_ind, sets 5.
%

	if num1(:,1) < 2
		s_ind = 5;
	end

%end function


function x=fsysvar(l,m,x,para,tau1,sig)
%
% Poincare map of states
%

global debug_sw
global reltol abstol solsw
global ptype
global N

switch ptype
	case 2 % fix program;	
		x=x(:);
		dx_init=eye(N);
		x=[x(1:N);dx_init(:)];
        options = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m);
        options1 = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m,'Jacobian',@Fj);
	
	case 3 % bf_program;
		x=x(:);
		dx_init=eye(N);
		ddx_init=zeros(N*N*N+N*N+N,1);	
		x=[x(1:N);dx_init(:);ddx_init];
        options = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m);
        options1 = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m);
end	

	switch sig
		case 0
			t0=[0 2*pi*tau1];
			x0=x.';
		case 1
			t0=[2*pi*tau1 2*pi];
			x0=x.';
	end	

	switch solsw
    	case 1 % ode45
        	[t,u]=ode45(@Eq,t0,x0,options,para);

    	case 2 % ode23
        	[t,u]=ode23(@Eq,t0,x0,options,para);

    	case 3 % ode113
        	[t,u]=ode113(@Eq,t0,x0,options,para);

    	case 4 % ode23s
        	[t,u]=ode23s(@Eq,t0,x0,options1,para);

    	case 5 % ode15s
        	[t,u]=ode15s(@Eq,t0,x0,options1,para);

    	otherwise % Myself Runge-Kutta method
        	h=2.0*pi/m;
        	u=zeros(N,m);
        	for kkk=1:l
            	for j=0:m-1
                	t=j*h;
                	[t,x]=RK(t,x,h,para);
                	u=x.';
            	end
        	end
	end

% for debug
	%if debug_sw == 1
	%	hold on
	%	plot(t,u(:,1),t,u(:,2),t,u(:,3));
	%end

x=u(end,:).';

%end function

function [t, x]=RK(t,x,h,para)
%
% Runge-Kutta method
%

	f1=Eq(t,x,para);
	f2=Eq(t+h/2,x+h*f1(:)/2,para);
	f3=Eq(t+h/2,x+h*f2(:)/2,para);
	f4=Eq(t+h,x+h*f3(:),para);
	t=t+h;
	x=x+h*(f1(:)+2*(f2(:)+f3(:))+f4(:))/6;

%end function


function backup_out2(stok,pre_revsw)
%
% output of various values
%

global f2out
global N M
global bf_type
global reverse_sw

	cut=stok(:);

	if bf_type == 3

		% When the bifurcation is Neimark-Sacker bifurcation,
		% the angler information of characteristic multiplier
		% is needed.

		num = M + N + 1;

	else

		% In general, the number of initial values is M( dimension
		% of parameter) + N (dimension of system).

		num = M + N;
	end

	if reverse_sw == 1
		if pre_revsw == 1
			if bf_type == 3
				f2out = fopen('_.bak.ns','wt');
				strings = '_.bak.ns';
			else
				f2out = fopen('_.bak','wt');
				strings = '_.bak';
			end
		elseif pre_revsw == 0
			if bf_type == 3
				f2out = fopen('_.bak.ns.1','wt');
				strings = '_.bak.ns.1';
			else
				f2out = fopen('_.bak.1','wt');
				strings = '_.bak.1';
			end
		end

	elseif reverse_sw == 0
		if bf_type == 3
			f2out = fopen('_.bak.ns','wt');
			strings = '_.bak.ns';
		else
			f2out = fopen('_.bak','wt');
			strings = '_.bak';
		end
	end

	fprintf(f2out,'%16.16E\n',cut(1:num));
	fclose(f2out);

	fprintf('\n');
	fprintf('save as %s\n',char(strings));

%end function


function [para,ip,dip,endip] = grad_ch(para,ip,dip,endip,pre)
%
% Alternation of variational equations, 
% depending on the gradient of the bifurcation set.
%

	%
	% If the gradient with respect to pre_para and para exceed au,
	%
	fprintf('auto change on\n');

	if ( para(ip(1))-pre(1) > 0 && dip(2) > 0 )
		if dip(1) > 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	elseif ( para(ip(1))-pre(1) < 0 && dip(2) < 0 )
		if dip(1) < 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	elseif ( para(ip(1))-pre(1) < 0 && dip(2) > 0 )
		if dip(1) < 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	elseif ( para(ip(1))-pre(1) > 0 && dip(2) < 0 )
		if dip(1) > 0
			ch_sw = 1;
		else
			ch_sw = -1;
		end
	end

	ip=fliplr(ip);
	dip=fliplr(dip);
	endip=fliplr(endip);
	dip(2)=ch_sw*dip(2);
	fprintf('para(%d) = %f, dpara(%d) = %f\n',ip(2),para(ip(2)),ip(2),dip(2));
	variational_Eq(ip);

%end function


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


function [para,x,dip,pre_revsw,iter_case_count,event_count]=...
	width_adjust(iterN,para,x,out_dat1,out_dat2,det_value,ip,dip,...
		pre_para,pre_state,pre_theta,pre_revsw,iter_case_count,event_count)
%
% This function is for an adjustment of the stop size control of 
% the variational parameter. When the calculation returns an error,
% to solve some problem, this function is used.
%

global reltol abstol pre_reltol pre_abstol

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
	if(abs(det_value) < 1E-4) % <-- We must consider the detected method of caspidal point��

		event_count = 3;
		return;	
	end

	%
	% In other case, it is possible to be the problem of tolerance of ODE solver
	% or step size of the variational parameter. So try again the calculation by
	% changing the smoller tolerance and/or the smoller step size.
	%
		
	switch iter_case_count 
		case {0,1} % try tiwce to change to small value of solver tolerance
			%
			% get back the parameter to previous 1-step value.
			%
			[para,x] = recover_state(pre_para,pre_state,pre_theta,ip,dip,pre_revsw,tmp1,tmp2);

			reltol=0.01*reltol; % 0.01 times tolerance.
			abstol=0.01*abstol;
			fprintf('There is a possibility that this stopped case has\n');
			fprintf('a problem with the tolerance of the ODE solver.\n');
			fprintf('Now tolerance values change: reltol=%e and abstol=%e\n',reltol,abstol);
			fprintf('\n');
			
			iter_case_count = iter_case_count + 1;

		case 2 % try tiwce to change to small value of solver tolerance
			%
			% get back the parameter to previous 1-step value.
			%
			[para,x] = recover_state(pre_para,pre_state,pre_theta,ip,dip,pre_revsw,tmp1,tmp2);
			
			pre_dip = dip(2);
			dip(2)=0.01*dip(2); % 0.01 times variational step of parameter.
			fprintf('iterations >= %d:\n',iterN);
			fprintf('Now, changing to more small step size: %e to %e\n',pre_dip,dip(2));
			fprintf('\n');
			
			reltol = pre_reltol;
			abstol = pre_abstol;
			iter_case_count = 0; % reset counter
			event_count = event_count + 1;
	end

%end function


function [para,x] = recover_state(pre_para,pre_state,pre_theta,ip,dip,pre_revsw,tmp1,tmp2)

global reverse_sw
global bf_type
global theta

	if reverse_sw == 1	
		if pre_revsw == 1 && tmp1(:,1) > 1
			[para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip);

		elseif pre_revsw == 0 && tmp2(:,1) > 1
			[para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip);

		else
			para = pre_para;
			x = pre_state;
			if bf_type == 3
				theta = pre_theta;
			else
				theta = 0;
			end
		end
	elseif reverse_sw == 0
		if tmp1(:,1) > 1
			[para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip);

		else
			para = pre_para;
			x = pre_state;
			if bf_type == 3
				theta = pre_theta;
			else
				theta = 0;
			end
		end
	end

% end function

function [para,x] = reset_pre(pre_para,pre_state,pre_theta,ip,dip)

global bf_type theta

	para = pre_para;
	para(ip(2)) = para(ip(2)) - dip(2);
	x = pre_state;
	if bf_type == 3
		theta = pre_theta;
	else
		theta = 0;
	end

%end function


function [para,x,ip,dip,store_p,c_count,c_iter]=...
			predict(para,x,store_p,ip,dip,c_count,c_iter)
%
% Prediction of the initial value for the next calculation.
%

global bf_type
global N
global theta
global mu
global predictor

	if c_count < 5

		if bf_type == 3
			store_tmp = [real(x(:));real(para(ip(1)));real(theta)];
		else
			store_tmp = [x(:);para(ip(1))];
		end

		store_p(1,:) = store_tmp';
			switch c_count
				case 0
					predictor = store_p(1,:);
				case 1
					predictor = 2*store_p(1,:) - store_p(2,:);
				case 2
					predictor = 3*store_p(1,:) - 3*store_p(2,:) + store_p(3,:);
				case 3
					predictor = 4*store_p(1,:) - 6*store_p(2,:) +...
								4*store_p(3,:) - store_p(4,:);
				case 4
					predictor = 5*store_p(1,:) - 10*store_p(2,:) +...
								10*store_p(3,:) - 5*store_p(4,:) + store_p(5,:);
			end

		x = predictor(1:N);
		para(ip(1))=predictor(N+1:N+1);

		if bf_type == 3
			theta=predictor(:,end);
			mu = exp(sqrt(-1)*theta);
		end

		store_p = circshift(store_p,[1,0]);

	elseif c_count >= 5
		
		if bf_type == 3
			store_tmp = [real(x(:));real(para(ip(1)));real(theta)];
		else
			store_tmp = [x(:);para(ip(1))];
		end

		store_p(1,:) = store_tmp';
	
	%
	% predictor
	%
			predictor =...
				5*store_p(1,:) - 10*store_p(2,:) +...
					10*store_p(3,:) - 5*store_p(4,:) + store_p(5,:);
			
		x = predictor(1:N);
		para(ip(1))=predictor(N+1:N+1);
	
		if bf_type == 3
			theta=predictor(:,end);
			mu = exp(sqrt(-1)*theta);
		end	

		store_p = circshift(store_p,[1,0]);

	end

%end function


function [para,x,ip,dip,store_p,c_count,c_iter]=...
			correct(para,x,nnn,store_p,ip,dip,c_count,c_iter)
%
% Prediction of the initial value for the next calculation.
%

global bf_type
global theta
global adj_step

	if c_count < 5

		if nnn < 5
			para(ip(2)) = para(ip(2)) + (dip(2)/nnn)/5;
		else
			para(ip(2)) = para(ip(2)) + dip(2)/nnn;
		end

		c_count = c_count + 1;

	elseif c_count >= 5
		if nnn > c_count
			para(ip(2)) = para(ip(2)) + dip(2)/nnn;
			c_count = c_count + 1;
		else
			if adj_step == 1 % the case that the adaptive step size control is ``ON''
				if bf_type == 3
					store_tmp = [real(x);real(para(ip(1)));real(theta)];
				else
					store_tmp = [x;para(ip(1))];
				end

			%
			% corrector
			%
				corrector = ...
					-5*store_p(1,:) + 5*store_p(2,:) - ...
						10*store_p(3,:)/3 + 5*store_p(4,:)/4 - store_p(5,:)/5;
	
			%
			% distance between the predictor and the corrector
			%
				h = sqrt( sum( (137*store_tmp'/60 + corrector).^2) );

				dist_tick = abs(abs(dip(2)) - h);

			%
			% adjust the ticks of the parameter variation
			%
				if dist_tick > 0.5
					dip = 0.5*dip;
					c_iter = 0;
				elseif dist_tick <= 0.2
					c_iter = c_iter + 1;
					if c_iter >= 5
						dip(2) = 2.0*dip(2);
						c_iter = 0;
					end
				end
				para(ip(2)) = para(ip(2)) + dip(2);
				c_count = c_count + 1;

			else % the case that the adaptive step size control is ``OFF''

				para(ip(2)) = para(ip(2)) + dip(2);
				c_count = c_count + 1;
			end	
		end

	end

%end function


function [para,x,ip,dip,endip,pre_revsw,forcing_stop]=...
			iter_case(iterN,para,x,ip,dip,endip,...
				pre_para,pre_state,pre_theta,var1st,dvar1st,end1st,pre_revsw)
%
% Treatments of the cases that the Newton method couldn't converge.
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
		% recover the ODE solver setting to an initial state
		%
			abstol = pre_abstol;
			reltol = pre_reltol;

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


function [para,x,ip,dip,endip,pre_revsw,forcing_stop]=div_case(...
			s_ind,para,x,ip,dip,endip,pre_para,pre_state,pre_theta,...
				var1st,dvar1st,end1st,pre_revsw)
%
% Treatments of the cases that Newton method diverged,
% the ode solver is returned error values, and the
% Jacobian matrix becomes a singular matrix.
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
	%
	% print out an error message to standard output.
	%
		fprintf('\n');
		switch s_ind
			case 2 % Divergence
				fprintf('States are divergent.\n');
			case 3 % the ODE solver is returned a error.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('This is because an error value from the ODE solver is returned.\n');
			case 4 % the Jacobian matrix became a singular matrix.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('This is because the Jacobian using Newton''s method became a singular matrix.\n');
			case 5 % the occurrence of a co-dimension two bifurcation point.
				fprintf('Now, the calculation is terminated. At the terminated\n');
				fprintf('point, it is possible that a co-dimension two bifurcation occurred.\n');
				fprintf('Please check the characteristic multipliers.\n');
			otherwise % another case.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('this is because the bifurcation condition wasn''t satisfied.\n');
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
		% recover the ODE solver setting to an initial state
		%
			abstol = pre_abstol;
			reltol = pre_reltol;

		%
		% forcibly finish this routine, but the calculation continue,
		% i.e., forcing_stop to ``1''
		%
			fprintf('\n');
			fprintf('Next, calculates the bifurcation set for inverted direction: dip(2)\n');
			fprintf('now here\n');
			forcing_stop = 1;
			return;

		elseif pre_revsw == 0
	%
	% print out an error message to standard output.
	%
		fprintf('\n');
		switch s_ind
			case 2 % Divergence
				fprintf('States are divergent.\n');
			case 3 % the ODE solver is returned a error.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('This is because an error value from the ODE solver is returned.\n');
			case 4 % the Jacobian matrix became a singular matrix.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('This is because the Jacobian using Newton''s method became a singular matrix.\n');
			case 5 % the occurrence of a co-dimension two bifurcation point.
				fprintf('Now, the calculation is terminated. At the terminated\n');
				fprintf('point, it is possible that a co-dimension two bifurcation occurred.\n');
				fprintf('Please check the characteristic multipliers.\n');
			otherwise % another case.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('this is because the bifurcation condition wasn''t satisfied.\n');
		end
		%
		% If iosave is ``on'', initial data file is closed.
		%
			if iosave == 1
				fclose(bf_out2);
			end

		%
		% save the parameters and the state values at the terminated point
		% to the initial value file.
		% output the initial setting file
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

		%
		% print out an error message to standard output.
		%

		fprintf('\n');
		switch s_ind
			case 2 % Divergence
				fprintf('States are divergent.\n');
			case 3 % the ODE solver is returned a error.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('This is because an error value from the ODE solver is returned.\n');
			case 4 % the Jacobian matrix became a singular matrix.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('This is because the Jacobian using Newton''s method became a singular matrix.\n');
			case 5 % the occurrence of a co-dimension two bifurcation point.
				fprintf('Now, the calculation is terminated. At the terminated\n');
				fprintf('point, it is possible that a co-dimension two bifurcation occurred.\n');
				fprintf('Please check the characteristic multipliers.\n');
			otherwise % another case.
				fprintf('Now, the calculation is terminated.\n');
				fprintf('This is because the bifurcation condition wasn''t satisfied.\n');
		end

		%
		% If iosave is ``on'', initial data file is closed.
		%
			if iosave == 1
				fclose(bf_out1);
			end

		%
		% save the parameters and the state values at the terminated point
		% to the initial value file.
		% output the initial setting file
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


function termi_out(para,x,pre_revsw)
%
% program terminate check
%

global iosave
global bf_out1 bf_out2
global N
global reverse_sw
global bf_type
global theta

	if reverse_sw == 1
		if pre_revsw == 1
			fprintf('\n');
			fprintf('This program is forcibly terminated.\n');
		%
		% parameter at the terminated point. save in initial state file.
		%
			tmp = x(1:N);
			if bf_type == 3
				u=[para(:);tmp(:);theta];
			else
				u=[para(:);tmp(:)];
			end
		%
		% backup of initial values.
		%
			backup_out2(u,pre_revsw);

		%
		% If file output is on, then the file is closed.
		%
			if iosave == 1
				fclose(bf_out1);
			end

		elseif pre_revsw == 0

			fprintf('\n');
			fprintf('This program is forcibly terminated.\n');
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
		%
		% backup of initial values.
		%
			backup_out2(u,pre_revsw);

		end
	
	elseif reverse_sw == 0
		fprintf('\n');
		fprintf('This program is forcibly terminated.\n');
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
	%
	% backup of initial values.
	%
		backup_out2(u,pre_revsw);

	end

%end function


function [termi_stop]=termi_ch()
%
% output of various values
%
% open-close of the stop file
% 0 or 1 is described in the stop file.
% it read the stop file. After that,
% it inputs to the termi_stop.
%

	ftermi = fopen('stop','rt');

		termi_stop=fscanf(ftermi,'%d\n',1);

	fclose(ftermi);

%end function


function [dkaidx,dkaidp,Fch] = dKaidxdp(DT,d2soldx2,d2soldxdp)
%
% Derivative of characteristic equation.
%

global N;
global mu;

%xn = x;

%Dt = DF(xn);
%DT = DF(xn) + eye(N);

Fch = det( DT - mu*eye(N) ); % Kai(mu) = 0

%
% 2nd Derivative with respect to state variables.
%

base = DT - mu*eye(N);

%dkdxdp = (dkaidx_dkaidp(xn)*Df0')
dkdxdp = [d2soldx2; d2soldxdp];

dkaidx=zeros(1,N);
dkaidp=0;

for i=1:N;
    for j=1:N;
		Basic=base;
		Basic(j,:) = dkdxdp(j+(i-1)*N,:); % permutation of columns
		dkaidx(i)=dkaidx(i)+det(Basic); % derivation related to states in characteristic equation
    end
end

for i=1:N;
	Basic=base;
	Basic(i,:) = dkdxdp(N^2+i,:); % permutation of columns
	dkaidp=dkaidp+det(Basic); % derivation related to states in characteristic equation
end

%end function


function [dkaidx,dkaidp,dkaidtheta,Fch]= dKaidxdp_NS(x,theta)
%
% Derivative of characteristic equation.
%

global N;

dkaidx = zeros(1,N);
dkaidp = 0;
dkaidtheta = 0;

xn = x;

%Dt = DF(xn);
DT = DF(xn) + eye(N);

Fch = det( DT - exp(sqrt(-1)*theta)*eye(N) );

%
% 2nd Derivative with respect to state variables.
%

base = DT - exp(sqrt(-1)*theta)*eye(N);

dkdxdp = dkaidx_dkaidp(xn);

for i = 1:N;
    for j = 1:N;
		Basic = base;
		Basic(j,:) = dkdxdp(j+(i-1)*N,:); % permutation of columns
		dkaidx(i) = dkaidx(i) + det(Basic); % derivation related to states in characteristic equation
    end
end

for i = 1:N;
	Basic = base;
	Basic(i,:) = dkdxdp(N^2+i,:); % permutation of columns
	dkaidp = dkaidp + det(Basic); % derivation related to states in characteristic equation
end

%
% Derivative with respect to imaginary part omega.
%

dkaidthe = -sqrt(-1)*exp(sqrt(-1)*theta)*eye(N);

for i = 1:N;
	Basic = base;
	Basic(i,:) = dkaidthe(i,:); 			% permutation of columns
	dkaidtheta = dkaidtheta + det(Basic);	% derivation related to states in characteristic equation
end

%end function


function init_graph
%
% Initializing the real-time graph
%
% clear of the figure

	figure(1);
	set(gca,'XLimMode','auto','YLimMode','auto');
	clf;    

%end function


function rout_graph(out_dat1,out_dat2,pre_revsw)
%
% Graphic display at real time
%

global reverse_sw
global H

set(gca,'XLimMode','auto','YLimMode','auto');

%
% ??????????????????????
% out_dat{1,2} ???? 1 ??????????????????????
% ??????2 ??????????????????????????
%
	if reverse_sw == 1
		%
		% ???????????????????????? check
		% updat1 : out_dat1????????
		% dwdat1 : out_dat2????????
		%
		updat1 = size(out_dat1);
		dwdat1 = size(out_dat2);

		if pre_revsw == 1

			if updat1(:,1) == 1
				H=plot(real(out_dat1(:,1)),real(out_dat1(:,2)),'b.-','EraseMode','none');
			elseif updat1(:,1) > 1
				set(H,'XData',real(out_dat1(:,1)),'YData',real(out_dat1(:,2)));
			end

		elseif pre_revsw == 0

			if dwdat1(:,1) == 1
				set(H,'XData',real(out_dat2(:,1)),'YData',real(out_dat2(:,2)));
			elseif dwdat1(:,1) > 1
				set(H,'XData',real(out_dat2(:,1)),'YData',real(out_dat2(:,2)));
			end	
		else    
			display('Data can not calculated');
		end
%
% ??????????????????????
%
	elseif reverse_sw == 0
		%
		% ???????????????????????? check
		%
		updat1 = size(out_dat1);
		
		if updat1(:,1) == 1
			H=plot(real(out_dat1(:,1)),real(out_dat1(:,2)),'b.-','EraseMode','none');
		elseif updat1(:,1) > 1
			set(H,'XData',real(out_dat1(:,1)),'YData',real(out_dat1(:,2)));
		else
			display('Data can not calculated');
		end
	end

	drawnow;

%end function


function out_graph(out_dat1,out_dat2)
%
% Graphic display
%
% ????????????????????????????????
% ??????????????????????????(???? NS ??
% ????????????)????????????????????????????
% ????????( real(para) ) ????????????????
% ??????????????????????
%

global reverse_sw

if reverse_sw == 1
	%
	% ???????????????????????? check
	% updat1 : ????????????????
	% dwdat1 : ????????????????
	%
	updat1 = size(out_dat1);
	dwdat1 = size(out_dat2);

	%
	% ??????????????????????
	% ????????,????????????????????????????
	% ????????????????????????????
	%

	if updat1(:,1) > 1
		if dwdat1(:,1) > 1
			plot(real(out_dat1(:,1)),real(out_dat1(:,2)),...
				real(out_dat2(:,1)),real(out_dat2(:,2)));
			%
			% ??????????????????????????????????
			% ????????????????????????????
			%
		else
			plot(real(out_dat1(:,1)),real(out_dat1(:,2)));
		end
	else
		disp('Data can not calculated');
	end
	%
	% ??????????????????????
	%
elseif reverse_sw == 0
	%
	% ???????????????????????? check
	%
	updat1 = size(out_dat1);

	%
	% updat1 : ????????????????
	% ??????????????????????????????
	% ??????????????????
	%

	if updat1(:,1) > 1
		plot(real(out_dat1(:,1)),real(out_dat1(:,2)));
	else
		disp('Data can not calculated');
	end
end

%end function


function [out_dat1,out_dat2]=bdisp_out(iterN,para,x,...
			chara,det_value,var1st,pre_revsw,out_dat1,out_dat2)
%
% output results
%

global reverse_sw

	%
	% Output of calculated results
	%
		bresults_out(iterN,para,x,chara,det_value,var1st,pre_revsw);

	%
	% The graphic data of a two-parameter bifurcation
	% diagram are held to out_dat1 and/or out_dat2.
	%
	if reverse_sw == 1 % ????????????????
		if pre_revsw==1

			out_dat1=[out_dat1; para(var1st)];

		elseif pre_revsw==0

			out_dat2=[out_dat2; para(var1st)];

		end

	elseif reverse_sw == 0 % ????????????????

		out_dat1=[out_dat1; para(var1st)];
	end

%end function


function bresults_out(iterN,para,x,chara,det_value,var1st,pre_revsw)
%
% output of results
%
         
global iosave
global bf_out1 bf_out2
global reverse_swq

	 fprintf('%d ) %e %e / %e %e %e | %e %e %e | %e %e %e | %e %e %e | ( %e )\n',...
		 	 iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),x(3),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),real(chara(3)),imag(chara(3)),abs(chara(3)),det_value);
	

	if iosave == 1
		if reverse_sw == 1
			if pre_revsw == 1
	 fprintf(bf_out1,'%d) %e %e / %e %e %e | %e %e %e | %e %e %e | %e %e %e | ( %e )\n',...
		 	 iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),x(3),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),real(chara(3)),imag(chara(3)),abs(chara(3)),det_value);
				
			elseif pre_revsw == 0
	 fprintf(bf_out2,'%d) %e %e / %e %e %e | %e %e %e | %e %e %e | %e %e %e | ( %e )\n',...
		 	 iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),x(3),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),real(chara(3)),imag(chara(3)),abs(chara(3)),det_value);
				
			end
		elseif reverse_sw == 0
	 fprintf(bf_out1,'%d) %e %e / %e %e %e | %e %e %e | %e %e %e | %e %e %e | ( %e )\n',...
		 	 iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),x(3),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),real(chara(3)),imag(chara(3)),abs(chara(3)),det_value);
			
		end
	end

%end function


%
% Jacobian matrix using at Newton's method
%
function A = DF(x)

A(1,1)=x(4)-1.0;
A(1,2)=x(7);
A(1,3)=x(10);
A(2,1)=x(5);
A(2,2)=x(8)-1.0;
A(2,3)=x(11);
A(3,1)=x(6);
A(3,2)=x(9);
A(3,3)=x(12)-1.0;

%end function

%
% Derivative of parameters.
%
function A1 = dTdP(x)

	 A1(1,1)=x(13);
	 A1(2,1)=x(14);
	 A1(3,1)=x(15);

%end function

%
% 2nd Derivative of state variables and a parameter.
%
function dKaidxdKaidp=dkaidx_dkaidp(x)

	 dKaidxdKaidp(1,1)=x(16);
	 dKaidxdKaidp(1,2)=x(19);
	 dKaidxdKaidp(1,3)=x(22);
	 dKaidxdKaidp(2,1)=x(17);
	 dKaidxdKaidp(2,2)=x(20);
	 dKaidxdKaidp(2,3)=x(23);
	 dKaidxdKaidp(3,1)=x(18);
	 dKaidxdKaidp(3,2)=x(21);
	 dKaidxdKaidp(3,3)=x(24);
	 dKaidxdKaidp(4,1)=x(25);
	 dKaidxdKaidp(4,2)=x(28);
	 dKaidxdKaidp(4,3)=x(31);
	 dKaidxdKaidp(5,1)=x(26);
	 dKaidxdKaidp(5,2)=x(29);
	 dKaidxdKaidp(5,3)=x(32);
	 dKaidxdKaidp(6,1)=x(27);
	 dKaidxdKaidp(6,2)=x(30);
	 dKaidxdKaidp(6,3)=x(33);
	 dKaidxdKaidp(7,1)=x(34);
	 dKaidxdKaidp(7,2)=x(37);
	 dKaidxdKaidp(7,3)=x(40);
	 dKaidxdKaidp(8,1)=x(35);
	 dKaidxdKaidp(8,2)=x(38);
	 dKaidxdKaidp(8,3)=x(41);
	 dKaidxdKaidp(9,1)=x(36);
	 dKaidxdKaidp(9,2)=x(39);
	 dKaidxdKaidp(9,3)=x(42);
	 dKaidxdKaidp(10,1)=x(43);
	 dKaidxdKaidp(10,2)=x(46);
	 dKaidxdKaidp(10,3)=x(49);
	 dKaidxdKaidp(11,1)=x(44);
	 dKaidxdKaidp(11,2)=x(47);
	 dKaidxdKaidp(11,3)=x(50);
	 dKaidxdKaidp(12,1)=x(45);
	 dKaidxdKaidp(12,2)=x(48);
	 dKaidxdKaidp(12,3)=x(51);
    
%end function


%
% Determination of which the variational equations are used
%
function variational_Eq(ip)

global subptype M

    if ip(1) == M-1
        para_type = M-2;
	else
		para_type = ip(1);
    end
    
	switch para_type
		 case 1
			 subptype=31
		 case 2
			 subptype=31
		 case 3
			 subptype=33
	 end

%endfunctions

%
% system equations; Eq.m 
%
function xdot=Eq(t,x,para)
global ptype subptype
global N
%
switch ptype
	 case 1 % PP
		 xdot=zeros(N,1); % Initializing state
		 xdot(1)=(para(1)/(1+x(3)^4)-101/200*x(1)/(1/2+x(1)))/para(3);
		 xdot(2)=(1/2*x(1)-7/5*x(2)/(13/100+x(2))-1/2*x(2)+3/5*x(3))/para(3);
		 xdot(3)=(1/2*x(2)-3/5*x(3))/para(3);
		 
	 case 2 % FIX
		 xdot=zeros(N*(N+1),1); % Initializing state
		 xdot(1)=(para(1)/(1+x(3)^4)-101/200*x(1)/(1/2+x(1)))/para(3);
		 xdot(2)=(1/2*x(1)-7/5*x(2)/(13/100+x(2))-1/2*x(2)+3/5*x(3))/para(3);
		 xdot(3)=(1/2*x(2)-3/5*x(3))/para(3);
		 xdot(4)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(4)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(6);
		 xdot(5)=1/2/para(3)*x(4)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(5)+3/5/para(3)*x(6);
		 xdot(6)=1/2/para(3)*x(5)-3/5/para(3)*x(6);
		 xdot(7)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(7)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(9);
		 xdot(8)=1/2/para(3)*x(7)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(8)+3/5/para(3)*x(9);
		 xdot(9)=1/2/para(3)*x(8)-3/5/para(3)*x(9);
		 xdot(10)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(10)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(12);
		 xdot(11)=1/2/para(3)*x(10)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(11)+3/5/para(3)*x(12);
		 xdot(12)=1/2/para(3)*x(11)-3/5/para(3)*x(12);
		 
	 case 3 % BF
		 xdot=zeros(N*(N+1)*(N+1)+N,1); % Initializing state
		 xdot(1)=(para(1)/(1+x(3)^4)-101/200*x(1)/(1/2+x(1)))/para(3);
		 xdot(2)=(1/2*x(1)-7/5*x(2)/(13/100+x(2))-1/2*x(2)+3/5*x(3))/para(3);
		 xdot(3)=(1/2*x(2)-3/5*x(3))/para(3);
		 xdot(4)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(4)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(6);
		 xdot(5)=1/2/para(3)*x(4)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(5)+3/5/para(3)*x(6);
		 xdot(6)=1/2/para(3)*x(5)-3/5/para(3)*x(6);
		 xdot(7)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(7)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(9);
		 xdot(8)=1/2/para(3)*x(7)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(8)+3/5/para(3)*x(9);
		 xdot(9)=1/2/para(3)*x(8)-3/5/para(3)*x(9);
		 xdot(10)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(10)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(12);
		 xdot(11)=1/2/para(3)*x(10)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(11)+3/5/para(3)*x(12);
		 xdot(12)=1/2/para(3)*x(11)-3/5/para(3)*x(12);
		 xdot(16)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)^2+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(6)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(6))*x(6)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(16)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(18);
		 xdot(17)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)^2+1/2/para(3)*x(16)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(17)+3/5/para(3)*x(18);
		 xdot(18)=1/2/para(3)*x(17)-3/5/para(3)*x(18);
		 xdot(19)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)*x(7)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(9)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(9))*x(6)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(19)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(21);
		 xdot(20)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)*x(8)+1/2/para(3)*x(19)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(20)+3/5/para(3)*x(21);
		 xdot(21)=1/2/para(3)*x(20)-3/5/para(3)*x(21);
		 xdot(22)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)*x(10)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(12)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(12))*x(6)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(22)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(24);
		 xdot(23)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)*x(11)+1/2/para(3)*x(22)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(23)+3/5/para(3)*x(24);
		 xdot(24)=1/2/para(3)*x(23)-3/5/para(3)*x(24);
		 xdot(25)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)*x(7)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(6)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(6))*x(9)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(25)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(27);
		 xdot(26)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)*x(8)+1/2/para(3)*x(25)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(26)+3/5/para(3)*x(27);
		 xdot(27)=1/2/para(3)*x(26)-3/5/para(3)*x(27);
		 xdot(28)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(7)^2+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(9)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(9))*x(9)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(28)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(30);
		 xdot(29)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(8)^2+1/2/para(3)*x(28)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(29)+3/5/para(3)*x(30);
		 xdot(30)=1/2/para(3)*x(29)-3/5/para(3)*x(30);
		 xdot(31)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(7)*x(10)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(12)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(12))*x(9)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(31)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(33);
		 xdot(32)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(8)*x(11)+1/2/para(3)*x(31)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(32)+3/5/para(3)*x(33);
		 xdot(33)=1/2/para(3)*x(32)-3/5/para(3)*x(33);
		 xdot(34)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)*x(10)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(6)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(6))*x(12)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(34)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(36);
		 xdot(35)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)*x(11)+1/2/para(3)*x(34)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(35)+3/5/para(3)*x(36);
		 xdot(36)=1/2/para(3)*x(35)-3/5/para(3)*x(36);
		 xdot(37)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(7)*x(10)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(9)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(9))*x(12)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(37)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(39);
		 xdot(38)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(8)*x(11)+1/2/para(3)*x(37)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(38)+3/5/para(3)*x(39);
		 xdot(39)=1/2/para(3)*x(38)-3/5/para(3)*x(39);
		 xdot(40)=(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(10)^2+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(12)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(12))*x(12)+(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(40)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(42);
		 xdot(41)=(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(11)^2+1/2/para(3)*x(40)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(41)+3/5/para(3)*x(42);
		 xdot(42)=1/2/para(3)*x(41)-3/5/para(3)*x(42);
		 
		 switch subptype % BF
			 case 31
			 	xdot(13)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(13)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(15)+1/(1+x(3)^4)/para(3);
			 	xdot(14)=1/2/para(3)*x(13)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(14)+3/5/para(3)*x(15);
			 	xdot(15)=1/2/para(3)*x(14)-3/5/para(3)*x(15);
			 	xdot(43)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(43)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(45)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(6)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(6))*x(15)-4/(1+x(3)^4)^2*x(3)^3/para(3)*x(6);
			 	xdot(44)=1/2/para(3)*x(43)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(44)+3/5/para(3)*x(45)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)*x(14);
			 	xdot(45)=1/2/para(3)*x(44)-3/5/para(3)*x(45);
			 	xdot(46)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(46)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(48)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(7)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(9)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(9))*x(15)-4/(1+x(3)^4)^2*x(3)^3/para(3)*x(9);
			 	xdot(47)=1/2/para(3)*x(46)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(47)+3/5/para(3)*x(48)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(8)*x(14);
			 	xdot(48)=1/2/para(3)*x(47)-3/5/para(3)*x(48);
			 	xdot(49)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(49)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(51)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(10)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(12)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(12))*x(15)-4/(1+x(3)^4)^2*x(3)^3/para(3)*x(12);
			 	xdot(50)=1/2/para(3)*x(49)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(50)+3/5/para(3)*x(51)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(11)*x(14);
			 	xdot(51)=1/2/para(3)*x(50)-3/5/para(3)*x(51);
			 
			 case 32
			 	xdot(13)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(13)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(15);
			 	xdot(14)=1/2/para(3)*x(13)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(14)+3/5/para(3)*x(15);
			 	xdot(15)=1/2/para(3)*x(14)-3/5/para(3)*x(15);
			 	xdot(43)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(43)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(45)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(6)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(6))*x(15);
			 	xdot(44)=1/2/para(3)*x(43)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(44)+3/5/para(3)*x(45)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)*x(14);
			 	xdot(45)=1/2/para(3)*x(44)-3/5/para(3)*x(45);
			 	xdot(46)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(46)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(48)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(7)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(9)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(9))*x(15);
			 	xdot(47)=1/2/para(3)*x(46)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(47)+3/5/para(3)*x(48)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(8)*x(14);
			 	xdot(48)=1/2/para(3)*x(47)-3/5/para(3)*x(48);
			 	xdot(49)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(49)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(51)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(10)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(12)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(12))*x(15);
			 	xdot(50)=1/2/para(3)*x(49)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(50)+3/5/para(3)*x(51)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(11)*x(14);
			 	xdot(51)=1/2/para(3)*x(50)-3/5/para(3)*x(51);
			 
			 case 33
			 	xdot(13)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(13)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(15)-(para(1)/(1+x(3)^4)-101/200*x(1)/(1/2+x(1)))/para(3)^2;
			 	xdot(14)=1/2/para(3)*x(13)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(14)+3/5/para(3)*x(15)-(1/2*x(1)-7/5*x(2)/(13/100+x(2))-1/2*x(2)+3/5*x(3))/para(3)^2;
			 	xdot(15)=1/2/para(3)*x(14)-3/5/para(3)*x(15)-(1/2*x(2)-3/5*x(3))/para(3)^2;
			 	xdot(43)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(43)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(45)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(4)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(6)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(6))*x(15)-(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)^2*x(4)+4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)^2*x(6);
			 	xdot(44)=1/2/para(3)*x(43)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(44)+3/5/para(3)*x(45)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(5)*x(14)-1/2/para(3)^2*x(4)-(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)^2*x(5)-3/5/para(3)^2*x(6);
			 	xdot(45)=1/2/para(3)*x(44)-3/5/para(3)*x(45)-1/2/para(3)^2*x(5)+3/5/para(3)^2*x(6);
			 	xdot(46)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(46)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(48)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(7)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(9)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(9))*x(15)-(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)^2*x(7)+4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)^2*x(9);
			 	xdot(47)=1/2/para(3)*x(46)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(47)+3/5/para(3)*x(48)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(8)*x(14)-1/2/para(3)^2*x(7)-(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)^2*x(8)-3/5/para(3)^2*x(9);
			 	xdot(48)=1/2/para(3)*x(47)-3/5/para(3)*x(48)-1/2/para(3)^2*x(8)+3/5/para(3)^2*x(9);
			 	xdot(49)=(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)*x(49)-4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)*x(51)+(101/100/(1/2+x(1))^2-101/100*x(1)/(1/2+x(1))^3)/para(3)*x(10)*x(13)+(32*para(1)/(1+x(3)^4)^3*x(3)^6/para(3)*x(12)-12*para(1)/(1+x(3)^4)^2*x(3)^2/para(3)*x(12))*x(15)-(-101/200/(1/2+x(1))+101/200*x(1)/(1/2+x(1))^2)/para(3)^2*x(10)+4*para(1)/(1+x(3)^4)^2*x(3)^3/para(3)^2*x(12);
			 	xdot(50)=1/2/para(3)*x(49)+(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)*x(50)+3/5/para(3)*x(51)+(14/5/(13/100+x(2))^2-14/5*x(2)/(13/100+x(2))^3)/para(3)*x(11)*x(14)-1/2/para(3)^2*x(10)-(-7/5/(13/100+x(2))+7/5*x(2)/(13/100+x(2))^2-1/2)/para(3)^2*x(11)-3/5/para(3)^2*x(12);
			 	xdot(51)=1/2/para(3)*x(50)-3/5/para(3)*x(51)-1/2/para(3)^2*x(11)+3/5/para(3)^2*x(12);
			 
		 end
end

