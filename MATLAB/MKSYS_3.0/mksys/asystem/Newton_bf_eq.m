function [s_ind,iterN,x,para,chara,det_value]=...
							Newton_bf_eq(para,x,ip)
%
% Get bifurcation points
%

global kmax emax gmax epsx feps 
global A N
global mu

s_ind=0; 
edist=0.0; 
iterN=1; 

% The matrix A denote the Jacobian matrix using the Newton's method.
	A=zeros(N+1,N+1);
	Df=zeros(N,N);

while (1)  % Newton's Method

% The arguments x_n0 denote state vector x_0 of a one previous step.
%	xn0=[x(1);x(2)];

	xn0 = x;
	p0 = para(ip(1));

	hn0=[xn0 p0];

% The function value f of u in R^(N+1) at the iteration

	Df = DF_eq(para,xn0);
	f0 = f_eq(para,xn0);
	f1 = det( mu*eye(N) -Df );
	f = [f0;f1];

	%
	% If the ODE solver is returned a error, then the calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 3.
	%
	if find( isnan(f) == 1)
		s_ind = 3;
		chara = 0;
		det_value = 1E+100;
		return;
	end

% It calculates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.
	
	A1 = dFdP_eq(para,xn0); % parameter の微分
	[A2,A3] = dChara_eq(para,xn0,Df); % det(mu*eye(N)-Df) の状態微分とパラメータ微分

	A = [Df A1; A2 A3]; % Jacobian matrix for using Newton's method


% Convergence conditions (No.1)

	if sum(abs(f))/(N+1) < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
%
% x(1:N)=xn0(:)+A\Fxn;
% 

		z = hn0(:) - A\f;

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
	
	x=z(1:N)';
	para(ip(1))=z(end,:);
	
%
% The distance between the before and after values
%
	
	% Convergence conditions (No.2)
	hn0 = [x para(ip(1))];
	ddx = x - xn0;
	ddp = (para(ip(1))-p0)/para(ip(1));
	ddu = [ddx ddp];
	dist=(sum(abs(ddu)))/(N+1);

	% Convergence conditions for Newton's method
	
	if dist < epsx  
		break;
	end
	
	% Divergence conditions from the value of some functions
	
	if( abs(xn0) < 1/emax )
		temp=abs(ddu*emax);
	else
		temp=abs(ddu./hn0);
	end
	rerror=min(temp,ddu);
	edist=edist+rerror;
	
	ddg=sum(sum(abs(A)))/(N*N);
	
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

	[V,W] = eig(Df);
	chara = diag(W);
	det_value = det(A);

%end function
