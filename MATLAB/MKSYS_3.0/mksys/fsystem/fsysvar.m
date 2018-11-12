function x=fsysvar(l,m,x,para)
%
% Poincare map of states
%

global reltol abstol solsw
global ptype
global N

switch ptype
	case 2 % fix program;	
		x=x(:);
		dx_init=eye(N);
		x=[x(1:N);dx_init(:)];
        options = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m);
        options1 = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m,'Jacobian',@Fj);
	
	case 3 % bf_program;
		x=x(:);
		dx_init=eye(N);
		ddx_init=zeros(N*N*N+N*N+N,1);	
		x=[x(1:N);dx_init(:);ddx_init];
        options = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m);
        options1 = odeset('RelTol',reltol,'AbsTol',abstol,'InitialStep',2*pi/m);
end	

t0=[0 2*l*pi];
x0=x.';

switch solsw
    case 1 % ode45
        [t,u]=ode45(@Eq,t0,x0,options,para);

    case 2 % ode23
        [t,u]=ode23(@Eq,t0,x0,options,para);

    case 3 % ode113
        [t,u]=ode113(@Eq,t0,x0,options,para);

    case 4 % ode23s
        [t,u]=ode23s(@Eq,t0,x0,options1,para);

    case 5 % ode15s
        [t,u]=ode15s(@Eq,t0,x0,options1,para);

    otherwise % Myself Runge-Kutta method
        h=2.0*pi/m;
        u=zeros(N,m);
        for kkk=1:l
            for j=0:m-1
                t=j*h;
                [t,x]=RK(t,x,h,para);
                u=x.';
            end
        end
end
x=u(end,:).';

%end function
