function rr = mkdev3(d2soldx2_0,dp0)
%
% Making the 2nd derivatives of Poincare map
% with respect to the state variables and paramter.
%

	r1 = d2soldx2_0(1:3,:)*dp0;
	r2 = d2soldx2_0(4:6,:)*dp0;
	r3 = d2soldx2_0(7:9,:)*dp0;
	rr = [r1 r2 r3];

%end function
