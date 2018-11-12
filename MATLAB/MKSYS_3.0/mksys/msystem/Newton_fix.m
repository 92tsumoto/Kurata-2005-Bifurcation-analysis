function [s_ind,iterN,x,para,chara,det_value]=Newton_fix(l,x,para)
%
% Find fixed point or L-periodic point
%

global kmax emax gmax epsx feps 
global N

s_ind=0; 
edist=0.0; 
iterN=1; 

% The matrix DT denote the Jacobian matrix using the Newton's method.
	
	DT = zeros(N,N);

while(1) % Newton's Method
	
% The arguments x_n0 denote state vector x_0 previous the one-step.
%	xn0=[x(1);x(2)];

	xn0=x(1:N);

% The value x_n1 of the states after t=t+1  
	
	xn1=msysvar(l,x,para);

	%
	% If the function msysvar returned a error value, then the calculation
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

	DT = DF(xn1);
	Fxn = xn1(1:N) - xn0(:);

% Convergence conditions (No.1)

	if sum(abs(Fxn))/N < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
% 
	x(1:N) = xn0(:) - DT\Fxn;
	
	%
	% If the Jacobian matrix using Newton's method becomes a singular matrix,
	% then the next step value can not calculate. The calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 4.
	%
	if find( isnan(x) == 1)
		s_ind = 4;
		chara = 0;
		det_value = 1E+100;
		return;
	end

%
% The distance between the before and after values
%
	
	% Convergence conditions (No.2)

	ddx=x(1:N)-xn0;
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
% [V, W]=eig([x(3) x(5); x(4) x(6)]);
% chara=[W(1,1) W(2,2)]
	
	[V, W] = eig( DT + eye(N) );
	chara = diag(W);
	det_value = det(DT);

%end function

