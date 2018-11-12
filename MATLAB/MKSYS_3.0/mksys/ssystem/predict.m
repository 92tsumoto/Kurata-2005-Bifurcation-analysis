function [para,x,ip,dip,store_p,c_count,c_iter]=...
			predict(para,x,store_p,ip,dip,c_count,c_iter)
%
% Prediction of the initial value for the next calculation.
%

global bf_type
global N
global theta
global mu
global predictor

	if c_count < 5

		if bf_type == 3
			store_tmp = [real(x(:));real(para(ip(1)));real(theta)];
		else
			store_tmp = [x(:);para(ip(1))];
		end

		store_p(1,:) = store_tmp';
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

		x = predictor(1:N);
		para(ip(1))=predictor(N+1:N+1);

		if bf_type == 3
			theta=predictor(:,end);
			mu = exp(sqrt(-1)*theta);
		end

		store_p = circshift(store_p,[1,0]);

	elseif c_count >= 5
		
		if bf_type == 3
			store_tmp = [real(x(:));real(para(ip(1)));real(theta)];
		else
			store_tmp = [x(:);para(ip(1))];
		end

		store_p(1,:) = store_tmp';
	
	%
	% predictor
	%
			predictor =...
				5*store_p(1,:) - 10*store_p(2,:) +...
					10*store_p(3,:) - 5*store_p(4,:) + store_p(5,:);
			
		x = predictor(1:N);
		para(ip(1))=predictor(N+1:N+1);
	
		if bf_type == 3
			theta=predictor(:,end);
			mu = exp(sqrt(-1)*theta);
		end	

		store_p = circshift(store_p,[1,0]);

	end

%end function

