function [s_ind,iterN,x,para,chara,det_value]=Newton_bf(l,m,x,para,ip,tau1)
%
% Get bifurcation points
%

global kmax emax gmax epsx feps 
global N M

s_ind=0; 
edist=0.0; 
iterN=1; 
%sig = 0;
df0 = eye(N);
dp0 = zeros(N,1);
ddx0 = zeros(N^2,N);
ddxp0 = zeros(N,N);

% The matrix DT denote the Jacobian matrix using the Newton's method.
	%DT0 = zeros(N);
	%DT1 = zeros(N);
	DT = zeros(N+1,N+1);

while (1)  % Newton's Method

	count = l; % period counter variable

% The arguments x_n0 denote state vector x_0 of a one previous step.
%	xn0=[x(1);x(2)];

	x=x(:);
	p0=para(ip(1));
	xn0=[x(1:N);p0];

% The value x_n1 of the states after t=2*l*pi  

	while count > 0

		sig = 0;
		store_min = para(M-2); % stok for the minimum value of s(t)
		xn1 = fsysvar(l,m,x,para,tau1,sig); % numerical integration from 0 to tau1

		d2tmp = dkaidx_dkaidp(xn1);
		d2soldx2_0 = d2tmp(1:N^2,1:N);
		d2soldxdp_0 = d2tmp(N^2+1:N^2+N,1:N);

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

		Df0 = DF(xn1) + eye(N);

		mkddx = d2soldx2_0*df0;
		
		ddx1 = mkdev(mkddx,ddx0,df0,Df0);


		if ip(1) == M-1 % case of the specific parameter 2 (vmax)
			%
			% mkdp1
			%
			dpara1 = Df0*dp0;

			%
			% mkdxdp1
			%
			r0 = mkdev3(d2soldx2_0,dp0);
			ddxp1 = r0*df0 + Df0*ddxp0;
		else
			%
			% mkdp1
			%
			dpara1 = dTdP(xn1) + Df0*dp0;

			%
			% mkdxdp1
			%
			r0 = mkdev3(d2soldx2_0,dp0);
			ddxp1 = d2soldxdp_0*df0 + r0*df0 + Df0*ddxp0;
		end

		tmp_xn1 = xn1(1:N).';
		sig = 1;
		para(M-2) = para(M-1); % minimum value to maximum value of s(t)
		xn2 = fsysvar(l,m,tmp_xn1,para,tau1,sig); % numerical integration from tau1 to tau
		para(M-2) = store_min; % return to minimum value of s(t)

		d2tmp = dkaidx_dkaidp(xn2);
		d2soldx2_1 = d2tmp(1:N^2,1:N);
		d2soldxdp_1 = d2tmp(N^2+1:N^2+N,1:N);

		%
		% If the ODE solver is returned a error, then the calculation
		% will be terminated here. The terminated information will be
		% returned to the main routine as s_ind = 3.
		%
			if find( isnan(xn2) == 1)
				s_ind = 3;
				chara = 0;
				det_value = 1E+100;
				return;
			end

		Df1 = DF(xn2) + eye(N);

		mkddx = d2soldx2_1*(Df0*df0);
		ddx2 = mkdev2(mkddx,ddx1,df0,Df0,Df1);

		if ip(1) == M-2 % case of the specific parameter 1 (vmin)
			%
			% mkdp2
			%
			dpara2 = Df1*dpara1;

			%
			% mkdxdp2
			%
			r0 = mkdev3(d2soldx2_1,dpara1);
			ddxp2 = r0*(Df0*df0) + Df1*ddxp1;
		else %ip(1) == M-1 % case of the specific parameter 2 (vmax)
			%
			% mkdp2
			%
			dpara2 = dTdP(xn2) + Df1*dpara1;

			%
			% mkdxdp2
			%
			r0 = mkdev3(d2soldx2_1,dpara1);
			ddxp2 = d2soldxdp_1*(Df0*df0) + r0*(Df0*df0) + Df1*ddxp1;
		end

		DT = Df1*Df0*df0;

		count = count - 1;

		if count > 0
			x = xn2;
			df0 = DT;
			dp0 = dpara2;
			ddx0 = ddx2;
			ddxp0 = ddxp2;
		end
	end

% It calvulates the values of Jacobian matrix using the Newton's method
% and a tolerance of the system functions.

	[dkaidx,dkaidp,Fch] = dKaidxdp(DT,ddx2,ddxp2);
	DF = [DT - eye(N) dpara2;
					dkaidx dkaidp];

	Fxn = xn2(1:N) - xn0(1:N); % T(x0) - x0 = 0
	Fn = [Fxn;Fch];

%
% The next step value of the states is calculated as follow:
%
% x(1:N)=xn0(:)+A\Fxn;
% 

	z = xn0(:) - DF\Fn;

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
	
	x=z(1:N);
	para(ip(1))=z(end,:);


% Convergence conditions for Newton's method
%
% The distance between the before and after values
%
% Convergence conditions (No.1)

	ddx=z(1:N)-xn0(1:N);
	ddp=(z(end,:)-p0)/z(end,:);
	ddu=[ddx;ddp];
	dist=(sum(abs(ddu)))/(N+1);

	if dist < epsx  
		break;
	end
	
% Convergence conditions (No.2)

	if sum(abs(Fn))/(N+1) < feps
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

	df0 = eye(N);
	dp0 = zeros(N,1);
	ddx0 = zeros(N^2,N);
	ddxp0 = zeros(N,N);

end % here is the while end.

%
% Characteristic Multipliers
%

	%[V,W] = eig( Df + eye(N) );
	[V,W] = eig( DT );
	chara = diag(W);
	det_value = det(DF);

%end function
