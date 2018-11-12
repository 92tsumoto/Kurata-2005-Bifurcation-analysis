function variational_Eq(ip) 
%
% Determination of which of their variational equations are used
%

global subptype M
    
	if ip(1) == M-1
		para_type = M-2;
	else
		para_type = ip(1);
	end

	switch ip(1) % a kinds of variational equations
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

