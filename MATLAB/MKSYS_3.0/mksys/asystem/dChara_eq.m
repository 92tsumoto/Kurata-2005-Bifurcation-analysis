%
% Derivative of characteristic equation.
%
function [A2,A3]=dChara_eq(para,x,Df)
global N;

%
% 2nd Derivative with respect to state variables.
%
base = -Df;

d2fdxdx = d2fdxdx_eq(para,x);

A2=zeros(1,N);

for i=0:N-1;
	for j=1:N;
		Basic=base;
		Basic(j,:) = -d2fdxdx(j+i*N,:); % ������촹��
		A2(i+1)=A2(i+1)+det(Basic); % �����������ξ��֤˴ؤ�����ʬ
	end
end

%
% 2nd Derivative with respect to state variables and parameters.
%

d2fdxdp = d2fdxdp_eq(para,x);

A3=0;

for i=1:N;
	Basic=base;
	Basic(i,:) = -d2fdxdp(i,:); % ������촹��
	A3=A3+det(Basic); 		% �����������ξ��֤˴ؤ�����ʬ
end

%end function
