function ddx2=mkdev2(mkddx,ddx1,df0,Df0,Df1)
%
% Making the 2nd derivatives of the Poincare map
% with respect to the state variables
%

	q1 = mkddx(1:3,:);
	q2 = mkddx(4:6,:);
	q3 = mkddx(7:9,:);
	q0 = [q1(:) q2(:) q3(:)]*(Df0*df0);

	q1 = Df1*ddx1(1:3,:);
	q2 = Df1*ddx1(4:6,:);
	q3 = Df1*ddx1(7:9,:);
	ddx2 = q0 + [q1;q2;q3];
				        
%end function
