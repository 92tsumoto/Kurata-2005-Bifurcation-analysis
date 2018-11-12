function [s_ind,iterN,para,x,chara,det_value] = Newton_fix_eq(para,x)
%
% Equilibrium point
%

global kmax emax gmax
global epsx feps 
global N

s_ind=0; 
edist=0.0; 
iterN=1; 

% The matrix Df denote the Jacobian matrix using the Newton's method.
	
	Df = zeros(N,N);

while(1) % Newton's Method
	
% The arguments x_n0 denote state vector x_0 previous the one-step.
%	xn0=[x(1);x(2)];

	xn0 = x;

% Enter here the function value of the differential equation
% sample BVP 
%	f(1)=para(3)*(xn0(2)+xn0(1)-1/3*xn0(1)^3);
%	f(2)=(-xn0(1)-para(2)*xn0(2)+para(1))/para(3);
% The function value f of the system equation
	
	f = f_eq(para,xn0);

	%
	% If the function f_eq returned a error, i.e., NaN, then the calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 3.
	%
	if find( isnan(f) == 1 )
		s_ind = 3;
		chara = 0;
		det_value = 1E+100;
		return;
	end

% It calculates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.

	Df = DF_eq(para,xn0);

% Convergence conditions (No.1)

	if sum(abs(f))/N < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
% 
	x(:) = xn0(:) - Df\f;
	
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

	ddx = x-xn0;
	dist=sum(abs(ddx))/N;

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
% [V, W]=eig([x(3) x(5); x(4) x(6)]);
% chara=[W(1,1) W(2,2)]
	
	[V, W]=eig(Df);
	chara=diag(W);
	det_value=det(Df);

%end function

