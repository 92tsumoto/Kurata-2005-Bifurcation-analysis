%
% Derivative of characteristic equation.
%
function [A2,A3,A4,Fch]= dKaidxdp_NS(x,theta)
global N;

A2=zeros(1,N);
A3 = 0;
A4 = 0;

xn = x;

%Dt = DF(xn);
DT = DF(xn) + eye(N);

base = DT - exp(sqrt(-1)*theta)*eye(N);

Fch = det( base ); % Kai(mu) = 0

%
% 2nd Derivative with respect to state variables.
%

dkdxdp = dkaidx_dkaidp(xn);

for i = 1:N;
    for j = 1:N;
		Basic = base;
		Basic(j,:) = dkdxdp(j+(i-1)*N,:); % 列の入れ換え
		A2(i) = A2(i) + det(Basic); % 特性方程式の状態に関する微分
    end
end

for i = 1:N;
	Basic = base;
	Basic(i,:) = dkdxdp(N^2+i,:); % 列の入れ換え
	A3 = A3 + det(Basic); % 特性方程式の状態に関する微分
end

%
% Derivative with respect to imaginary part omega.
%

dkaidthe = -sqrt(-1)*exp(sqrt(-1)*theta)*eye(N);

for i = 1:N;
	Basic = base;
	Basic(i,:) = dkaidthe(i,:); % 列の入れ換え
	A4 = A4 + det(Basic); 		 % 特性方程式の状態に関する微分
end

%end function

