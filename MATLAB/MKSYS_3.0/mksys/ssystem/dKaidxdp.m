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

%dkdxdp = dkaidx_dkaidp(xn);
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

