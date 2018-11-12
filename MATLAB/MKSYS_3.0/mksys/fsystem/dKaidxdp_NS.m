function [dkaidx,dkaidp,dkaidtheta,Fch]= dKaidxdp_NS(x,theta)
%
% Derivative of characteristic equation.
%

global N;

dkaidx = zeros(1,N);
dkaidp = 0;
dkaidtheta = 0;

xn = x;

%Dt = DF(xn);
DT = DF(xn) + eye(N);

Fch = det( DT - exp(sqrt(-1)*theta)*eye(N) );

%
% 2nd Derivative with respect to state variables.
%

base = DT - exp(sqrt(-1)*theta)*eye(N);

dkdxdp = dkaidx_dkaidp(xn);

for i = 1:N;
    for j = 1:N;
		Basic = base;
		Basic(j,:) = dkdxdp(j+(i-1)*N,:); % ������촹��
		dkaidx(i) = dkaidx(i) + det(Basic); % �����������ξ��֤˴ؤ�����ʬ
    end
end

for i = 1:N;
	Basic = base;
	Basic(i,:) = dkdxdp(N^2+i,:); % ������촹��
	dkaidp = dkaidp + det(Basic); % �����������ξ��֤˴ؤ�����ʬ
end

%
% Derivative with respect to imaginary part omega.
%

dkaidthe = -sqrt(-1)*exp(sqrt(-1)*theta)*eye(N);

for i = 1:N;
	Basic = base;
	Basic(i,:) = dkaidthe(i,:); % ������촹��
	dkaidtheta = dkaidtheta + det(Basic); 		 % �����������ξ��֤˴ؤ�����ʬ
end

%end function

