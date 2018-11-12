function [t, x]=mRK(k,x,para)
%
% Next value
%

	t=k;
	
	f=Eq(t,x,para);
	
	x=f(:);

%end function
