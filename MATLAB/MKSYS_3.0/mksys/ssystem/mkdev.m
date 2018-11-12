function ddx1=mkdev(mkddx,ddx0,df0,Df0)
%
% Making the Poincare map of state variables
%

	q1 = mkddx(1:3,:);
	q2 = mkddx(4:6,:);
	q3 = mkddx(7:9,:);
	q0 = [q1(:) q2(:) q3(:)]*df0;

	q1 = Df0*ddx0(1:3,:);
	q2 = Df0*ddx0(4:6,:);
	q3 = Df0*ddx0(7:9,:);
	ddx1 = q0 + [q1;q2;q3];

%end function
