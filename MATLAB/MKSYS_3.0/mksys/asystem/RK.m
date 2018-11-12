%
% Runge-Kutta method
%
function [t, x]=RK(t,x,h,para)

	f1=Eq(t,x,para);
	f2=Eq(t+h/2,x+h*f1(:)/2,para);
	f3=Eq(t+h/2,x+h*f2(:)/2,para);
	f4=Eq(t+h,x+h*f3(:),para);
	t=t+h;
	x=x+h*(f1(:)+2*(f2(:)+f3(:))+f4(:))/6;

%end function
