function [A2,A3,Fch]= dKaidxdp_SD(x)
%
% Derivative of characteristic equation.
%
% ����ʬ������1����ʣ���ˤʤ롥���줬���������§�ˤ��Ƥ��ޤ���
% ����������������ϰ�ö 1 �����ʬ�򤷡�(mu - 1)�ʳ��˻Ĥä�¿�༰
% �򿷤��������������Ȥ����Ѥ��ʤ���Фʤ�ʤ������Ū�˲򤤤ƿ�����������
% �η�������ꤹ�뤳�Ȥȡ����������������� mu ����ʬ���ƽФ��������ϡ�
% ����ʬ���ξ��������ʾ��ˤʤ롥-mu I �� mu ����ʬ���뤳�Ȥǡ�����
% Jacobi������г���ʬ�ˤϡ�-1 �����롥
% �����������ݡ�7�ϡ�pp.148--149 ���ȡ�

global N;
global mu;

xn = x;

Dt = DF(xn);
DT = Dt + eye(N);
base = DT - mu*eye(N);

Fch = 0; % �������������ͤν����
mu_1 = - eye(N); % mu �Ǥ���ʬ�Ѥι���
base_1(:,:,N) = zeros(N); % mu ����ʬ��������������ι���

for i=1:N;
	Basic=base;
	Basic(i,:) = mu_1(i,:); % ������촹��
	base_1(:,:,i) = Basic;
	Fch = Fch + det(Basic); % ������������ mu �˴ؤ�����ʬ, Kai_a(mu) = 0
end

%
% 2nd Derivative with respect to state variables.
%

dkdxdp = dkaidx_dkaidp(xn);

zero_1 = zeros(N);
A2=zeros(1,N);
A3=0;

for i=1:N;
	for k=1:N;
		for j=1:N;
			Basic=base_1(:,:,k);
			if j == k
				Basic(j,:) = zero_1(j,:);
			else
				Basic(j,:) = dkdxdp(j+(i-1)*N,:); % ������촹��
			end
			A2(i)=A2(i)+det(Basic); % �����������ξ��֤˴ؤ�����ʬ
		end
	end
end

for j=1:N;
	for i=1:N;
		Basic=base_1(:,:,j);
		if i == j
			Basic(i,:) = zero_1(i,:);
		else
			Basic(i,:) = dkdxdp(N^2+i,:); % ������촹��
		end
		A3=A3+det(Basic); % �����������ξ��֤˴ؤ�����ʬ
	end
end

%end function
