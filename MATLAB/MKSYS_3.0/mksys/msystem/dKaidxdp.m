function [dkaidx,dkaidp,Fch]= dKaidxdp(x)
%
% Derivative of characteristic equation.
%

global N;
global mu;

xn = x;

%Dt = DF(xn);
DT = DF(xn) + eye(N);

Fch = det( DT - mu*eye(N) ); % Kai(mu) = 0

%
% 2nd Derivative with respect to state variables.
%

base = DT - mu*eye(N);

dkdxdp = dkaidx_dkaidp(xn);

dkaidx=zeros(1,N);
dkaidp=0;

for i=1:N;
    for j=1:N;
		Basic=base;
		Basic(j,:) = dkdxdp(j+(i-1)*N,:); % 列の入れ換え
		dkaidx(i)=dkaidx(i)+det(Basic); % 特性方程式の状態に関する微分
    end
end

for i=1:N;
	Basic=base;
	Basic(i,:) = dkdxdp(N^2+i,:); % 列の入れ換え
	dkaidp=dkaidp+det(Basic); % 特性方程式の状態に関する微分
end

%end function

