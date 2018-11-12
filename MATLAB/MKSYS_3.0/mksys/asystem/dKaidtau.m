function dkaidtau = dKaidtau(x,f0,theta)
%
% Derivative of characteristic equation
% with respect to the period tau.
%

global N;
global mu;
global bf_type;

xn = x;

switch bf_type
	case 1
		mu_1 = - eye(N);
		DT = DF(xn) + eye(N);
	case {2,3,4}
		DT = DF(xn) + eye(N);
end

%%%%%%%%%
% dchidt 
%%%%%%%%%

switch bf_type
	case 1
		base_1(:,:,N) = zeros(N);
		base = DT - mu*eye(N);
		for i=1:N;
			Basic = base;
			Basic(i,:) = mu_1(i,:); % 列の入れ換え
			base_1(:,:,i) = Basic;
		end
	case {2,4}
		base = DT - mu*eye(N);
	case 3
		base = DT - exp(sqrt(-1)*theta)*eye(N);
end

ff0 = F0(f0);
zero_1 = zeros(N);
dkaidtau = 0;

switch bf_type
	case 1
		for j = 1:N;
			for i = 1:N;
				Basic=base_1(:,:,j);
				if i == j
					Basic(i,:) = zero_1(i,:);
				else
					Basic(i,:) = ff0(i,:); % 列の入れ換え
				end
			dkaidtau = dkaidtau + det(Basic); % 特性方程式の tau に関する微分
			end
		end
	case {2,3,4}
		for i = 1:N;
			Basic = base;
			Basic(i,:) = ff0(i,:);
			dkaidtau = dkaidtau + det(Basic);
		end
end

%end function

