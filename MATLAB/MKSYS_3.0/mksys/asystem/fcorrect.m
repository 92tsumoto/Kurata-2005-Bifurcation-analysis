%
% Prediction of the initial value for the next calculation.
%
function [para,x,ip,dip,store_p,c_count,c_iter]=...
			fcorrect(para,x,nnn,store_p,ip,dip,c_count,c_iter)

	if c_count < nnn

		para(ip) = para(ip) + dip/nnn;

		c_count = c_count + 1;

	elseif c_count >= nnn 

	%
	% corrector
	%
		corrector = ...
			-5*store_p(1,:) + 5*store_p(2,:) - ...
				10*store_p(3,:)/3 + 5*store_p(4,:)/4 - store_p(5,:)/5;

	%
	% distance between the predictor and the corrector
	%
		h = sqrt(sum( (137*x'/60 + corrector).^2));

		dist_tick = abs(max(abs(dip)) - h);
	%
	% adjust the ticks of the parameter variation
	%
		
		if dist_tick > 1.0
			dip = 0.5*dip;
			c_iter = 0;
		elseif dist_tick < 0.05
			c_iter = c_iter + 1;
			if c_iter >= 5
				dip = 2.0*dip;
				c_iter = 0;
			end
		end

		para(ip) = para(ip) + dip; 

		c_count = c_count + 1;

	end

%end function


