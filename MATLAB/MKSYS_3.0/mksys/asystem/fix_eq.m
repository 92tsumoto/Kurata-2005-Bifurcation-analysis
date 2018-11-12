function [s_ind_eq] = fix_eq(para)
%
% Equilibrium point
%

global kmax emax gmax
global epsx feps 
global N x_eq

	s_ind_eq=0; 
	edist=0.0; 
	iterN=1; 

	while(1) % Newton's Method
	
		xn0 = x_eq;
		F_eq = f_eq(para,xn0);
		Df_eq = DF_eq(para,xn0);

		if find( isnan(F_eq) == 1 )
			s_ind_eq = 3;
			fprintf('There is an error in the returned value of the function F.\n');	
			return;
		end

		if sum(abs(F_eq))/N < feps
			break;
		end

		x_eq(:) = xn0(:) - Df_eq\F_eq; % Newton method main
	
		if find( isnan(x_eq) == 1 )
			s_ind_eq = 4;
			fprintf('The Jacobian matrix DF_eq becomes a singular matirx');
			return;
		end

		ddx = x_eq - xn0;
		dist = sum(abs(ddx))/N;

		if dist < epsx  
			break;
		end
	
		if(abs(xn0) < 1/emax)
			temp=abs(ddx*emax);
		else
			temp=abs(ddx./xn0);
		end
		rerror=min(temp,ddx);
		edist=edist+rerror;

		ddg=sum(sum(abs(Df_eq)))/(N*N);

		if ddg > gmax 
			s_ind_eq = 2; % divergence of system
			break;
		elseif edist > emax
			s_ind_eq = 2; % divergence
			break;
		end

		if iterN >= kmax - 1
			s_ind_eq = 1; % sorry iterating too much
			break;
		end

		iterN = iterN + 1;

	end % here is the while end.

%end function

