function [s_ind,iterN,x,para,tau,chara,det_value]=...
				Newton_bf(l,m,para,x,tau,ip,dh,dhinv,dq)
%
% Get bifurcation points
% Main function of Newton method
%

global kmax emax gmax epsx feps 
global psec_num
global A N
global bf_type
global x_eq eq_switch

s_ind=0; 
edist=0.0; 
iterN=1; 

%
% Initializing the Jacobian matrix Df using the Newton's method.
%
	Df = zeros(N+1,N+1);

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
	xn0=[(dh*x(1:N)')' p0 tau0];

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

	% Df の生成
	A = DF(xn1)+eye(N);
	dPdu = dh * A * dhinv - eye(N-1);
	dqdu = dq * A * dhinv;
	dPdtau = dh * f0(1:N);
	dqdtau = dq * f0(1:N);

	% パラメータの微分生成
	A1 = dTdP(xn1);
	dPdpara = dh * A1;
	dqdpara = dq * A1;

	% 特性方程式の微分
	% A2 => 特性方程式の状態微分
	% A3 => 特性方程式のパラメータ微分
	switch bf_type
		case 1
			[A2,A3,Fch] = dKaidxdp_SD(xn1);
			dkaidu = A2 * dhinv;
			dkaidpara = A3;
		case 2
			[A2,A3,Fch] = dKaidxdp(xn1);
			dkaidu = A2 * dhinv;
			dkaidpara = A3;
	end

	% 特性方程式の微分
	% A4 => 特性方程式の周期 tau 微分
	dkaidtau = dKaidtau(xn1,f0,0);

	Df = [dPdu dPdpara dPdtau;
		  dqdu dqdpara dqdtau;
		  dkaidu dkaidpara dkaidtau ]; % Newton法用の Jacobi 完成

	%%%%%%%%%%%%%%%%%%%%
	% making F
	%%%%%%%%%%%%%%%%%%%%

	Fxn = dh*(xn1(1:N) - x0(:)); % T(x0) - x0 = 0
	Ft = xn1(psec_num) - psec_loc;
	Fn = [Fxn;Ft;Fch];

% Convergence conditions (No.1)

	if sum(abs(Fn))/(N+1) < feps
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

	%
	% 以下，For を利用しないで書けないか？
	%
		jj = 1;
		for ii = 1:N
			if ii ~= psec_num
				x(ii) = xx(jj);
				jj = jj + 1;
			end
		end

	%
	% リミットサイクル周期の更新
	%
		tau = tau1;
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
	ddu=[ddx ddp ddt];
	dist=(sum(abs(ddu)))/(N+1);
	%dist=norm(abs(ddu),inf);

	% Convergence conditions for Newton's method
	
	if dist < epsx  
		break;
	end
	
	% Divergence conditions from the value of some functions
	
	if(abs(x0) < 1/emax)
		temp = abs(ddx*emax);
	else
		temp = abs(ddu./xn0);
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

	switch bf_type
		case 1
			[V,W] = eig(A,'nobalance');
		case 2
			[V,W] = eig(A);
	end
	chara = diag(W);
	det_value = det(Df);

%end function
