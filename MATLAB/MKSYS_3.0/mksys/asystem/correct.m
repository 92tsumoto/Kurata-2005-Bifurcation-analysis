function [para,x,tau,ip,dip,store_p,c_count,c_iter]=...
			correct(para,x,tau,nnn,store_p,ip,dip,c_count,c_iter)
%
% Prediction of the initial value for the next calculation.
%

global bf_type
global sol_type
global adj_step
global theta

	if c_count < 5

		if nnn < 5
			para(ip(2)) = para(ip(2)) + (dip(2)/nnn)/5;
		else
			para(ip(2)) = para(ip(2)) + dip(2)/nnn;
		end
		c_count = c_count + 1;

	elseif c_count >= 5
		if nnn > c_count
			para(ip(2)) = para(ip(2)) + dip(2)/nnn;
		else
			if adj_step == 1
				switch sol_type
					case 1
						if bf_type == 3
							store_tmp = [real(x) real(para(ip(1))) real(theta)];
						else
							store_tmp = [x para(ip(1))];
						end
					case 2
						if bf_type == 3
							store_tmp = [real(x) real(para(ip(1))) real(tau) real(theta)];
						else
							store_tmp = [x para(ip(1)) tau];
						end
				end

				%
				% corrector
				%
					corrector = ...
						-5*store_p(1,:) + 5*store_p(2,:) - ...
							10*store_p(3,:)/3 + 5*store_p(4,:)/4 - store_p(5,:)/5;

				%
				% distance between the predictor and the corrector
				%
					h = sqrt( sum( (137*store_tmp/60 + corrector).^2) );

					dist_tick = abs(abs(dip(2)) - h);

				%
				% adjust the ticks of the parameter variation
				%
					if dist_tick > 0.5
						dip = 0.5*dip;
						c_iter = 0;
					elseif dist_tick <= 0.2
						c_iter = c_iter + 1;
						if c_iter >= 5
							dip(2) = 2.0*dip(2);
							c_iter = 0;
						end
					end

					para(ip(2)) = para(ip(2)) + dip(2);
					c_count = c_count + 1;

			else
				para(ip(2)) = para(ip(2)) + dip(2);
				c_count = c_count + 1;

			end
		end
	end

%end function

