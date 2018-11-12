function out_graph(out_dat1,out_dat2)
%
% Graphic display
%
% 求めたパラメータ値が複素数として
% 扱われてしまうケースがある(特に NS を
% 計算する場合)．そのため，求めたパラメータ
% を実数化( real(para) ) してグラフ表示を
% 行っていることに注意．
%

global reverse_sw

if reverse_sw == 1
	%
	% データ格納の行列サイズの check
	% updat1 : データ１のサイズ
	% dwdat1 : データ２のサイズ
	%
	updat1 = size(out_dat1);
	dwdat1 = size(out_dat2);

	%
	% 双方向に計算した場合：
	% データ１,２共に１以上データがある場合
	% ２つの曲線をグラフ表示する．
	%

	if updat1(:,1) > 1
		if dwdat1(:,1) > 1
			plot(real(out_dat1(:,1)),real(out_dat1(:,2)),...
				real(out_dat2(:,1)),real(out_dat2(:,2)));

			%
			% データ１のみ１以上データがある場合
			% １つの曲線をグラフ表示する．
			%

		else
			plot(real(out_dat1(:,1)),real(out_dat1(:,2)));
		end
	else
		disp('Data can not calculated');
	end
	%
	% 一方向のみ計算した場合
	%
elseif reverse_sw == 0
	%
	% データ格納の行列サイズの check
	%
	updat1 = size(out_dat1);

	%
	% updat1 : データ１のサイズ
	% データ１に１以上データがあれば
	% グラフを表示する．
	%

	if updat1(:,1) > 1
		plot(real(out_dat1(:,1)),real(out_dat1(:,2)));
	else
		disp('Data can not calculated');
	end
end

%end function

