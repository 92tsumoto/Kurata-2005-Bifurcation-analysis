function [s_ind,iterN,para,x,tau,chara,det_value]=...
				Newton_fix(l,m,para,x,tau,dh,dhinv,dq)
%
% Find fixed point or L-periodic point
%

global kmax emax gmax epsx feps
global psec_num
global x_eq eq_switch
global N

s_ind=0; 
edist=0.0; 
iterN=1; 

%
% Initializing the Jacobian matrix Df using the Newton's method.
%	
	Df = zeros(N,N);
%
% Set the Poincare section.
%
	if eq_switch == 1
		[s_ind_eq] = fix_eq(para);
		if s_ind_eq == 0    
			psec_loc = x_eq(psec_num);
		else
			fprintf('Cannot get the information of an equilibrium point !/n');
			s_ind = 3;
			chara = 0;
			det_value = 1E+10;
			return;
		end
	else
		psec_loc = x_eq(psec_num);
	end

while(1) % Newton's Method
	
% The arguments x_n0 denote state vector x_0 previous the one-step.
%	xn0=[x(1);x(2)];

	xn0=x(1:N);

% The value x_n1 of the states after t = tau (period of LC) 
	
	xn1 = fsysvar(l,m,x,para,tau);

	f0 = Eq(0,xn1,para);
	%
	% If the ODE solver is returned a error, then the calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 3.
	%
	if find( isnan(xn1) == 1 )
		s_ind = 3;
		chara = 0;
		det_value = 1E+100;
		return;
	end

% It calculates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.

	% Df の生成
	A = DF(xn1)+eye(N);
	dPdu = dh * A * dhinv - eye(N-1);
	dqdu = dq * A * dhinv;
	dPdtau = dh * f0(1:N);
	dqdtau = dq * f0(1:N);
	Df = [ dPdu dPdtau; dqdu dqdtau ]; % Newton法用の Jacobi 完成

	%%%%%%%%%%%%%
	% making F
	%%%%%%%%%%%%%
	F1 = dh*(xn1(1:N) - xn0(:));
	F2 = xn1(psec_num) - psec_loc;

	Fxn = [F1;F2];

% Convergence conditions (No.1)

	if sum(abs(Fxn))/N < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
% 
	correct = -Df\Fxn;

	xx = dh*xn0(:) + correct(1:N-1);

%
% Updating the state variables, the period of the limit
% cycle, and the state of the Poincare section.
% 以下，For を利用しないで書けないか？
%
	jj = 1;
	for ii = 1:N
		if ii ~= psec_num
			x(ii) = xx(jj);
			jj = jj + 1;
		end
	end

	tau = tau + correct(N);
	x(psec_num) = psec_loc;

%
% If the Jacobian matrix using Newton's method becomes a singular matrix,
% then the next step value can not calculate. The calculation
% will be terminated here. The terminated information will be
% returned to the main routine as s_ind = 4.
%
	if find( isnan(x) == 1 )
		s_ind = 4;
		chara = 0;
		det_value = 1E+100;
		return;
	end

%
% The distance between the before and after values
%
	
	% Convergence conditions (No.2)

	ddx = x(1:N)-xn0;
	dist = sum(abs(ddx))/N;

	% Convergence conditions for Newton's method
	
	if dist < epsx  
		break;
	end
	
	% Divergence conditions from the value of some functions
	
	if(abs(xn0) < 1/emax)
		temp=abs(ddx*emax);
	else
		temp=abs(ddx./xn0);
	end
	rerror=min(temp,ddx);
	edist=edist+rerror;
	
	ddg=sum(sum(abs(Df)))/(N*N);
	
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
	[V, W] = eig(DF(xn1)+eye(N));
	chara = diag(W);
	det_value = det(Df);

%end function

