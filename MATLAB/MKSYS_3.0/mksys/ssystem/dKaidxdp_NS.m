function [dkaidx,dkaidp,dkaidtheta,Fch]= dKaidxdp_NS(DT,d2soldx2,d2soldxdp,theta)
%
% Derivative of characteristic equation.
%

global N;

%xn = x;

%Dt = DF(xn);
%DT = DF(xn) + eye(N);

Fch = det( DT - exp(sqrt(-1)*theta)*eye(N) );

%
% 2nd Derivative with respect to state variables.
%

base = DT - exp(sqrt(-1)*theta)*eye(N);

%dkdxdp = dkaidx_dkaidp(xn);
dkdxdp = [d2soldx2; d2soldxdp];

dkaidx = zeros(1,N);
dkaidp = 0;
dkaidtheta = 0;

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
	Basic(i,:) = dkaidthe(i,:);				% permutation of columns
	dkaidtheta = dkaidtheta + det(Basic);	% derivation related to states in characteristic equation
end

%end function

