function [A2,A3,Fch]= dKaidxdp(x)
%
% Derivative of characteristic equation.
%

global N;
global mu;

xn = x;

Dt = DF(xn);
DT = Dt + eye(N);

Fch = det( DT - mu*eye(N) ); % Kai(mu) = 0

%
% 2nd Derivative with respect to state variables.
%

base = DT - mu*eye(N);

dkdxdp = dkaidx_dkaidp(xn);

A2=zeros(1,N);
A3=0;

for i=1:N;
    for j=1:N;
		Basic=base;
		Basic(j,:) = dkdxdp(j+(i-1)*N,:); % ������촹��
		A2(i)=A2(i)+det(Basic); % �����������ξ��֤˴ؤ�����ʬ
    end
end

for i=1:N;
	Basic=base;
	Basic(i,:) = dkdxdp(N^2+i,:); % ������촹��
	A3=A3+det(Basic); % �����������ξ��֤˴ؤ�����ʬ
end

%end function
