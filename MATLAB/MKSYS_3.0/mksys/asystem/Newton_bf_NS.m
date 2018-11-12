function [s_ind,iterN,x,para,tau,chara,det_value,theta]=...
			Newton_bf_NS(l,m,para,x,tau,ip,theta,dh,dhinv,dq)
%
% Get bifurcation points
%

global kmax emax gmax
global epsx feps 
global psec_num
global N
global x_eq eq_switch

s_ind=0; 
edist=0.0; 
iterN=1; 

%
% Initializing the Jacobian matrix Df using the Newton's method.
%
	Df = zeros(N+2,N+2);

% �ؿ��� theta �ˤ����ʬ(����Ͼ�˥���)
	Athe(N,1)= 0;

%
% Set the Poincare section.
%
	if eq_switch == 1
		[s_ind_eq] = fix_eq(para);
		if s_ind_eq == 0    
			psec_loc = x_eq(psec_num);
		else
			fprintf('Cannot get the information of an equilibrium point !/n');
			s_ind = 5;
			chara = 0;
			det_value = 1E+10;
			return;
		end
	else
		psec_loc = x_eq(psec_num);
	end


while (1)  % Newton's Method

% The arguments x_n0 denote state vector x_0 of a one previous step.
%	xn0=[x(1);x(2)];

	x0 = x;
	p0 = para(ip(1));
	tau0 = tau;
	theta0 = theta;
	xn0=[(dh*x(1:N)')' p0 tau0 theta0];

% The value x_n1 of the states after t = tau (period of LC)

	xn1 = fsysvar(l,m,x,para,tau);

	f0 = Eq(0,xn1,para);
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

	% Df ������
	A = DF(xn1)+eye(N);
	dPdu = dh * A * dhinv - eye(N-1);
	dPdtau = dh * f0(1:N);
	dPdtheta = dh * Athe;

	dqdu = dq * A * dhinv;
	dqdtau = dq * f0(1:N);
	dqdtheta = dq * Athe;

	% �ѥ�᡼������ʬ����
	A1 = dTdP(xn1);
	dPdpara = dh * A1;
	dqdpara = dq * A1;

	% ��������������ʬ
	% A2 => �����������ξ�����ʬ
	% A3 => �����������Υѥ�᡼����ʬ
	% A4 => �������������г���ʬ
	[A2,A3,A4,Fch] = dKaidxdp_NS(xn1,theta);
	dkaidu = A2 * dhinv;
	dkaidpara = A3;
	dkaidtheta = A4;

	% �����������μ��� tau ��ʬ
	dkaidtau = dKaidtau(xn1,f0,theta);

	Df = [dPdu dPdpara dPdtau dPdtheta;
		dqdu dqdpara dqdtau dqdtheta;
		real(dkaidu) real(dkaidpara) real(dkaidtau) real(dkaidtheta);
		imag(dkaidu) imag(dkaidpara) imag(dkaidtau) imag(dkaidtheta) ];

	%%%%%%%%%%%%%%%%%%%%
	% making F
	%%%%%%%%%%%%%%%%%%%%

	Fxn = dh*(xn1(1:N) - x0(:)); % T(x0) - x0 = 0
	Ft = xn1(psec_num) - psec_loc;
	%Fre = real( det( A - exp(sqrt(-1)*theta)*eye(N) ) ); % Kai(mu) = 0
	%Fim = imag( det( A - exp(sqrt(-1)*theta)*eye(N) ) ); % Kai(mu) = 0
	Fn = [Fxn;Ft;real(Fch);imag(Fch)];

% Convergence conditions (No.1)

	if sum(abs(Fn))/(N+2) < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
%
% x(1:N)=xn0(:)+A\Fxn;
% 

	correct = - Df\Fn;

	xx = dh*x0(:) + correct(1:N-1);
	p1 = p0 + correct(N);
	tau1 = tau0 + correct(N+1);
	theta1 = theta0 + correct(N+2);

	%
	% ���֤ι���
	% �ʲ���For �����Ѥ��ʤ��ǽ񤱤ʤ�����
	%
	jj = 1;
	for ii = 1:N
		if ii ~= psec_num
			x(ii) = xx(jj);
			jj = jj + 1;
		end
	end

	%
	% ��ߥåȥ�������������гѡ��ѥ�᡼���ι���
	%
		tau = tau1;
		theta = theta1;
		para(ip(1))=p1;
		x(psec_num) = psec_loc;


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

%
% The distance between the before and after values
%
	
	% Convergence conditions (No.2)

	ddx=(dh*(x(1:N)-x0(1:N))')'; % distance of states.
	ddp=(p1-p0)/p1; % distance of a parameter.
	ddt=(tau1-tau0)/tau1; % distance of period.
	dda=(theta1-theta0)/theta1; % distance of angle.
	ddu=[ddx ddp ddt dda];
	
	dist=(sum(abs(ddu)))/(N+2);
	%dist=norm(abs(ddu),inf);

	% Convergence conditions for Newton's method
	
	if dist < epsx  
		break;
	end
	
	% Divergence conditions from the value of some functions
	
	if(abs(xn0) < 1/emax)
		temp=abs(ddx*emax);
	else
		temp=abs(ddu./xn0);
	end
	rerror=min(temp,ddu);
	edist=edist+rerror;
	
	ddg=sum(sum(abs(A)))/(N*N);
	
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

	[V,W] = eig(A);
	chara = diag(W);
	det_value = det(Df);

%
% �ʲ��� NS ʬ����������θ��ФΤ���� part
% chara �⤫����������������ͤ� 1 �ˤʤ� index �򸡺���
%
% ��ˣ��ˤʤ��ͭ�ͤ�����
	discri_ch = chara;
	[YY,iidx] = min( abs(1.0 - real(chara)) ); % ����������˶ᤤ��Τ򸡺�
	discri_ch(iidx,:) = [];
	
	abs_ipart = imag(discri_ch(abs(1.0 - abs(discri_ch))<1E-6));

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

