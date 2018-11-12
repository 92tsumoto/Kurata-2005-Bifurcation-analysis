function [x,store_p] = fpredict(x,store_p,c_count)
%
% Prediction of the initial value for the next calculation.
%

global sol_type
global N

	if c_count < 5 
		
		switch sol_type
			case 1
				store_p(1,:) = x(1:N);
			case 2
				store_p(1,:) = x(1:N+1);
		end	
		switch c_count
			case 0
				predictor = store_p(1,:);
			case 1
				predictor = 2*store_p(1,:) - store_p(2,:);
			case 2
				predictor = 3*store_p(1,:) - 3*store_p(2,:) + store_p(3,:);
			case 3
				predictor = 4*store_p(1,:) - 6*store_p(2,:) +...
							4*store_p(3,:) - store_p(4,:);
			case 4
				predictor = 5*store_p(1,:) - 10*store_p(2,:) +...
							10*store_p(3,:) - 5*store_p(4,:) + store_p(5,:);
		end

		%
		% predicted initial values
		%
			switch sol_type
				case 1
					x = predictor(1:N);
				case 2
					x = predictor(1:N+1);
			end

		store_p = circshift(store_p,[1,0]);

	elseif c_count >= 5 
	
		switch sol_type
			case 1
				store_p(1,:) = x(1:N);
			case 2
				store_p(1,:) = x(1:N+1);
		end
	
		%
		% predictor
		%
			predictor =...
				5*store_p(1,:) - 10*store_p(2,:) +...
					10*store_p(3,:) - 5*store_p(4,:) + store_p(5,:);

		%
		% predicted inital values
		%

		switch sol_type
			case 1
				x = predictor(1:N);
			case 2
				x = predictor(1:N+1);
		end

		store_p = circshift(store_p,[1,0]);

	end

%end function

