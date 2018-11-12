function [s_ind,iterN,x,para,chara,det_value,theta]=...
							Newton_bf_HP(para,x,ip,theta)
%
% Get bifurcation points
%

global kmax emax gmax epsx feps 
global A N

s_ind=0; 
edist=0.0; 
iterN=1; 

% The matrix A denote the Jacobian matrix using the Newton's method.
	A=zeros(N+2,N+2);
	Df=zeros(N,N);
% 関数の omega(theta) による微分(これは常にゼロ)
	Aw(N,1)= 0;

while (1)  % Newton's Method

% The arguments x_n0 denote state vector x_0 of a one previous step.
%	xn0=[x(1);x(2)];

	xn0 = x;
	p0 = para(ip(1));
	theta0 = theta;
	hn0=[x p0 theta0];

% The function value f by making from Jacobian and characteristic equation  

	Df = DF_eq(para,xn0);
	f0 = f_eq(para,xn0);
	f1 = det(sqrt(-1)*theta*eye(N)-Df);
	f = [f0;real(f1);imag(f1)];

	%
	% If the ODE solver is returned a error, then the calculation
	% will be terminated here. The terminated information will be
	% returned to the main routine as s_ind = 3.
	%
	if find( isnan(f) == 1)
		s_ind = 3;
		chara = 0;
		det_value = 1E+100;
		return;
	end

% It calculates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.
	
	%A = DDF_HP(para,xn0,theta);
	%B = DF_eq(para,xn0);
	
	% parameter の微分
		A1 = dFdP_eq(para,xn0);
	
	% det(mu*eye(N)-Df) の状態微分とパラメータ微分
		[A2,A3,A4] = dChara_eq_hopf(para,xn0,theta,Df);

	% Jacobian matrix for using Newton's method
		A = [ Df A1 Aw; 
			  real(A2) real(A3) real(A4); 
			  imag(A2) imag(A3) imag(A4)
			]; 

	
% Convergence conditions (No.1)

	if sum(abs(f))/(N+2) < feps
		break;
	end
%
% The next step value of the states is calculated as follow:
%
% x(1:N)=xn0(:)+A\Fxn;
% 

	z = hn0(:) - A\f;

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
	x = z(1:N)';
	para(ip(1)) = z(N+1,:);
	theta = z(end,:);

%
% The distance between the before and after values
%
	
	% Convergence conditions (No.2)
	ddx = x - xn0; % distance of states.
	ddp = (para(ip(1)) - p0)/para(ip(1)); % distance of a parameter.
	dda = (theta - theta0)/theta; % distance of angle.
	ddu = [ddx ddp dda];
	dist = (sum(abs(ddu)))/(N+2);

	% Convergence conditions for Newton's method
	
	if dist < epsx  
		break;
	end
	
	% Divergence conditions from the value of some functions
	
	if(abs(xn0) < 1/emax)
		temp=abs(ddu*emax);
	else
		temp=abs(ddu./hn0);
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
		s_ind = 1; % sorry interating too much
		break;
	end

	iterN = iterN + 1;

end % here is the while end.

%
% Characteristic Multipliers
%

	[V,W] = eig(Df);
	chara = diag(W);
	det_value = det(A);

%
% 以下は Hopf 分岐の停止点の検出のための part
% chara 内から固有値の虚部が 0 になる index を検索．
%

%	id = find( abs(1.0 - abs(chara) ) < 10*epsx );
%	abs_ipart = abs(imag(chara(id)));

%
% 虚部が 0 でない固有値が幾つあるか．
% num1 にその個数が入る．Hopf の場合は通常 2 個
%

%	[num1,num2] = size(abs_ipart);

%
% Hopf 分岐が他の分岐曲線に接続する場合，固有値の虚部が
% 0 へと変化する．そこで，num1 が 2 より
% 小さくなったなら，そこで計算を強制終了させる．
% その際の flag を s_ind = 5 とする．

%	if num1 < 2
%		s_ind = 5;
%	end

%end function
