function [s_ind,iterN,x,para,chara,det_value,theta]=Newton_bf_NS(l,m,x,para,ip,theta)
%
% Get bifurcation points
%

global kmax emax gmax epsx feps 
global N

s_ind=0; 
edist=0.0; 
iterN=1; 

% The matrix DT denote the Jacobian matrix using the Newton's method.
	DT = zeros(N+2,N+2);

% �ؿ��� theta �ˤ����ʬ(����Ͼ�˥���)
	dTdtheta(N,1)= 0;

while (1)  % Newton's Method

% The arguments x_n0 denote state vector x_0 of a one previous step.
%	xn0=[x(1);x(2)];

	x=x(:);
	p0=para(ip(1));
	theta0=theta;
	xn0=[x(1:N);p0;theta0];

% The value x_n1 of the states after t=2*l*pi  

	xn1 = fsysvar(l,m,x,para);

	%
	% If the ODE solver is returned a error, then the calculation
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

	Df = DF(xn1);
	dTdpara = dTdP(xn1);
	[dkaidx,dkaidp,dkaidtheta,Fch] = dKaidxdp_NS(xn1,theta);
	DT = [ Df dTdpara dTdtheta; 
			real(dkaidx) real(dkaidp) real(dkaidtheta);
			imag(dkaidx) imag(dkaidp) imag(dkaidtheta) ];

	Fxn = xn1(1:N) - xn0(1:N); % T(x0) - x0 = 0
	Fn = [Fxn;real(Fch);imag(Fch)];

% Convergence conditions (No.1)

	if sum(abs(Fn))/(N+2) < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
%
% x(1:N)=xn0(:)+A\Fxn;
% 

	z = xn0(:) - DT\Fn;

	%
	% If the Jacobian matrix using Newton's method becomes a singular matrix,
	% then the next step value can not calculate. The calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 4.
	%
	if find( isnan(z) == 1)
		s_ind = 4;
		chara = 0;
		det_value = 1E+100;
		return;
	end

%
% The independent variables are (x1,...xn, bif_para(1),theta).
%
	x=z(1:N);
	para(ip(1))=z(N+1,:);
	theta=z(end,:);

%
% The distance between the before and after values
%
	
	% Convergence conditions (No.2)

	ddx=z(1:N)-xn0(1:N); % distance of states.
	ddp=(z(N+1,:)-p0)/z(N+1,:); % distance of a parameter.
	dda=(z(end,:)-theta0)/z(end,:); % distance of angle.
	ddu=[ddx;ddp;dda];
	dist=(sum(abs(ddu)))/(N+2);

	% Convergence conditions for Newton's method
	
	if dist < epsx  
		break;
	end
	
	% Divergence conditions from the value of some functions
	
	if(abs(xn0) < 1/emax)
		temp=abs(ddx*emax);
	else
		temp=abs(ddu./xn0(:));
	end
	rerror=min(temp,ddu);
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

	[V,W] = eig( Df + eye(N) );
	chara = diag(W);
	det_value = det(DT);

%
% �ʲ��� NS ʬ����������θ��ФΤ���� part
% chara �⤫����������������ͤ� 1 �ˤʤ� index �򸡺���
%

	abs_ipart = imag(chara(abs(1.0 - abs(chara))<10*epsx));

%
% �����ͤ� 1 �ˤʤ���������ε��������Ĥ��뤫��
% num1 �ˤ��θĿ������롥NS �ξ��ϣ���
%

	num1 = size(abs_ipart);

%
% NS ʬ����¾��ʬ����������³�����硤��������ε�����
% 2 ���� 1 �Ĥؤ��Ѳ����롥�����ǡ�num1 �� 2 ���
% �������ʤä��ʤ顤�����Ƿ׻�������λ�����롥
% ���κݤ� flag �� s_ind = 5 �Ȥ��롥

	if num1(:,1) < 2
		s_ind = 5;
	end

%end function

