function [ddelta] = detectbf_eq(x,para,chara,istopbf,ip)
%
% Discrimination of initial stability and bifurcated values
%

global bf_flag
global ini_para
global pre_ind

ddelta=0;

%
% Discrimination of initial stability and bifurcated values
%
	if isequal(para(ip),ini_para)
		
		iidx = find( real(chara) >= 0.0 );
		pre_ind = size(iidx);

	else
		iidx = find ( real(chara) >= 0.0 );
		size_idx = size(iidx);

	end

	%
	% 固有値の実部が 0 を越えている個数の変化
	%
	if not(isequal(para(ip),ini_para))

		if pre_ind(:,1) ~= size_idx(:,1)
			% 検出されたら，その固有値の index を探す
			[Y,idx] = min(abs(real(chara)));

			fprintf('Pass through a bifurcation !\n');
			bf_flag = 1;
			pre_ind = size_idx;

			%
			% Determination of the kind of the bifurcation.
			% 検出された index の固有値の虚部がゼロでない場合
			% Hopf 分岐の可能性
			%
			if imag(chara(idx)) ~= 0
				fprintf('The bifurcation is Hopf bifurcation\n');
			%
			% 検出された index の固有値の虚部がゼロの場合
			% Tangent, Pitch-fork 分岐の可能性あり
			%
			else
				fprintf('A pitch-fork bifurcation is generated.\n');
			end

		else
			bf_flag = 0;
		end
	else
		bf_flag = 0;
	end

if bf_flag == 1

	%
	% 分岐の検出後，分岐値へ近づける場合
	%
	if istopbf == 2

		%
		% 固有値の実部が 0 に近いものを検出
		% パラメータの刻みを調整しながらこの範囲に
		% 特性乗数が入るまで繰り返す．
		%
		
		if find(min(abs(real(chara(idx)))) < 1E-6 )
			%[Y idx] = min(abs(real(chara)));
			%
			% Hopf 分岐
			%
			if imag(chara(idx)) ~= 0
				omega = imag(chara(idx));
				ns_para_out(x,para,omega,0);

			%
			% Pitch-fork 分岐
			%
			else
				stok = [para x];
				backup_out(stok);
			end
		%
		% ddelta = 1 のとき，パラメータ−刻みを小さくして
		% 逆方向に計算する．分岐点の検出が終了したため，ddelta = -1 として
		% 計算を終了させる．
		%
			ddelta = -1;
			return;

		%
		% 固有値の大きさが分岐条件に近づいていない．
		% そのため ddelta = 1 を返し，パラメータ−刻みを小さくして
		% 逆方向に計算する．
		%
		
		else

			ddelta = 1;

		end % istopbf = 2 の case の終了

	%
	% 分岐の検出後，計算停止の場合
	% bf_stop case 1
	
	elseif istopbf == 1
	
		%
		% 計算した所までの値を backup file に保存
		%
		stok=[para x];
		backup_out(stok);
	
		%
		% 分岐点の検出が終了したため，ddelta = -1 として
		% 計算を終了させる．
		%		
			ddelta=-1;
			return;
	
	%
	% 分岐の検出は行なうが，計算は続行
	% bf_stop case 0
	
	elseif istopbf == 0
	
		return;
	
	end

end


%end function

