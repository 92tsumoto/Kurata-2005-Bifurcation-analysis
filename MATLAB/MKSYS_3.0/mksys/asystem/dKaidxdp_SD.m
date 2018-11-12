function [A2,A3,Fch]= dKaidxdp_SD(x)
%
% Derivative of characteristic equation.
%
% 接線分岐だと1が重複根になる．これが問題を非正則にしてしまう．
% それで特性方程式は一旦 1 を因数分解し，(mu - 1)以外に残った多項式
% を新たな特性方程式として用いなければならない．代数的に解いて新特性方程式
% の係数を決定することと，元の特性方程式を mu で微分して出た方程式は，
% 接線分岐の場合は等価な条件になる．-mu I を mu で微分することで，元の
% Jacobi行列の対角成分には，-1 が入る．
% 「非線形現象」7章，pp.148--149 参照．

global N;
global mu;

xn = x;

Dt = DF(xn);
DT = Dt + eye(N);
base = DT - mu*eye(N);

Fch = 0; % 特性方程式の値の初期化
mu_1 = - eye(N); % mu での微分用の行列
base_1(:,:,N) = zeros(N); % mu で微分後の特性方程式の行列

for i=1:N;
	Basic=base;
	Basic(i,:) = mu_1(i,:); % 列の入れ換え
	base_1(:,:,i) = Basic;
	Fch = Fch + det(Basic); % 特性方程式の mu に関する微分, Kai_a(mu) = 0
end

%
% 2nd Derivative with respect to state variables.
%

dkdxdp = dkaidx_dkaidp(xn);

zero_1 = zeros(N);
A2=zeros(1,N);
A3=0;

for i=1:N;
	for k=1:N;
		for j=1:N;
			Basic=base_1(:,:,k);
			if j == k
				Basic(j,:) = zero_1(j,:);
			else
				Basic(j,:) = dkdxdp(j+(i-1)*N,:); % 列の入れ換え
			end
			A2(i)=A2(i)+det(Basic); % 特性方程式の状態に関する微分
		end
	end
end

for j=1:N;
	for i=1:N;
		Basic=base_1(:,:,j);
		if i == j
			Basic(i,:) = zero_1(i,:);
		else
			Basic(i,:) = dkdxdp(N^2+i,:); % 列の入れ換え
		end
		A3=A3+det(Basic); % 特性方程式の状態に関する微分
	end
end

%end function
