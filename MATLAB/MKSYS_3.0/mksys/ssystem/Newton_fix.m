function [s_ind,iterN,x,para,chara,det_value]=Newton_fix(l,m,x,para,tau1)
%
% Find fixed point or L-periodic point
%

global kmax emax gmax epsx feps 
global N M

s_ind=0; 
edist=0.0; 
iterN=1; 
store_DT = eye(N);
sig = 0;

% The matrix DT denote the Jacobian matrix using the Newton's method.
	
	DT0 = zeros(N);
	DT1 = zeros(N);
	DT = zeros(N);

while(1) % Newton's Method
	
	count = l; % period counter variable

% The arguments x_n0 denote state vector x_0 previous the one-step.
%	xn0=[x(1);x(2)];

	xn0=x(1:N);

% The value x_n1 of the states after t=2*l*pi  

	while count > 0

		sig = 0;
		store_min = para(M-2); % stok for the minimum value of s(t)
		xn1=fsysvar(l,m,x,para,tau1,sig); % numerical integration from 0 to tau1
		%
		% If the ODE solver is returned a error, then the calculation
		% will be terminated here. The terminated information will be
		% returned to the main routine as s_ind = 3.
		%
			if find( isnan(xn1)==1 )
				s_ind = 3;
				chara = 0;
				det_value = 1E+100;
				return;
			end
		
		DT0 = DF(xn1) + eye(N);

		tmp_xn1 = xn1(1:N).';

		sig = 1;
		para(M-2) = para(M-1); % minimum value to maximum value of s(t)
		xn2=fsysvar(l,m,tmp_xn1,para,tau1,sig); % numerical integration from tau1 to tau
		para(M-2) = store_min; % return to minimum value of s(t)
		%
		% If the ODE solver is returned a error, then the calculation
		% will be terminated here. The terminated information will be
		% returned to the main routine as s_ind = 3.
		%
			if find( isnan(xn2) == 1 )
				s_ind = 3;
				chara = 0;
				det_value = 1E+100;
				return;
			end

		DT1 = DF(xn2) + eye(N);

		DT = DT1*DT0*store_DT;

		count = count -1;

		if count > 0
			x = xn2(1:N).';
			store_DT = DT;	
		end
	end

% It calculates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.

	Fxn = xn2(1:N) - xn0(:);

%
% The next step value of the states is calculated as follow:
%
	x(1:N) = xn0(:) - (DT - eye(N))\Fxn;

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

% Convergence conditions for Newton's method
%
% The distance between the before and after values
%
% Convergence conditions (No.1)

	ddx=x(1:N)-xn0;
	dist=sum(abs(ddx))/N;

	if dist < epsx  
		break;
	end

% Convergence conditions (No.2)

	if sum(abs(Fxn))/N < feps
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
	
	ddg=sum(sum(abs( DT - eye(N) )))/(N*N);
	
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

	DT0 = zeros(N);
	DT1 = zeros(N);
	DT = zeros(N);
	store_DT = eye(N);

end % here is the while end.

%
% Characteristic Multipliers
%
% [V, W]=eig([x(3) x(5); x(4) x(6)]);
% chara=[W(1,1) W(2,2)]
	
	%[V, W] = eig( DT + eye(N) );
	[V, W] = eig( DT );
	chara = diag(W);
	det_value = det(DT - eye(N) );

%end function

