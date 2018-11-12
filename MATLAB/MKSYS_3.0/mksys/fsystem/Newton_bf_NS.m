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

% 関数の theta による微分(これは常にゼロ)
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
% 以下は NS 分岐の停止点の検出のための part
% chara 内から特性乗数の絶対値が 1 になる index を検索．
%

	abs_ipart = imag(chara(abs(1.0 - abs(chara))<10*epsx));

%
% 絶対値が 1 になる特性乗数の虚部が幾つあるか．
% num1 にその個数が入る．NS の場合は２個
%

	num1 = size(abs_ipart);

%
% NS 分岐が他の分岐曲線に接続する場合，特性乗数の虚部が
% 2 から 1 個へと変化する．そこで，num1 が 2 より
% 小さくなったなら，そこで計算を強制終了させる．
% その際の flag を s_ind = 5 とする．

	if num1(:,1) < 2
		s_ind = 5;
	end

%end function

