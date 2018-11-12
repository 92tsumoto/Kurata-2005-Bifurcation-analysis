function variational_Eq(ip) 
%
% Determination of which of their variational equations are used
%

global subptype
    
	switch ip(1) % 変分方程式の種類
		case 1
			subptype=31;
		case 2
			subptype=32;
		case 3
			subptype=33;
		case 4
			subptype=34;
		case 5
			subptype=35;
		case 6
			subptype=36;
	end

%end function

