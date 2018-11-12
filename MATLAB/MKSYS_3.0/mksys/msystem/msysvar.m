function x=msysvar(l,x,para)
%
% Poincare map of states
%

global ptype
global N

switch ptype
	case 2 % fix program;	
		x=x(:);
		dx_init=eye(N);
		x=[x(1:N);dx_init(:)];
	
	case 3 % bf_program;
		x=x(:);
		dx_init=eye(N);
		ddx_init=zeros(N*N*N+N*N+N,1);	
		x=[x(1:N);dx_init(:);ddx_init];
end	

u=zeros(N);

for k=1:l
	[t,x]=mRK(k,x,para);
	u=x.';
end
x=u(end,:).';

%end function

