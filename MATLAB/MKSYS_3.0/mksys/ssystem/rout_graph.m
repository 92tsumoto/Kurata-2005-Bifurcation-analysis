function rout_graph(out_dat1,out_dat2,pre_revsw)
%
% Graphic display at real time
%

global reverse_sw
global H

set(gca,'XLimMode','auto','YLimMode','auto');

%
% 双方向に計算した場合：
% out_dat{1,2} 共に 1 以上データが蓄積される
% 場合，2 つの曲線をグラフ表示する．
%
	if reverse_sw == 1
		%
		% データ格納の行列サイズの check
		% updat1 : out_dat1のサイズ
		% dwdat1 : out_dat2のサイズ
		%
		updat1 = size(out_dat1);
		dwdat1 = size(out_dat2);

		if pre_revsw == 1

			if updat1(:,1) == 1
				H=plot(real(out_dat1(:,1)),real(out_dat1(:,2)),'b.-','EraseMode','none');
			elseif updat1(:,1) > 1
				set(H,'XData',real(out_dat1(:,1)),'YData',real(out_dat1(:,2)));
			end

		elseif pre_revsw == 0

			if dwdat1(:,1) == 1
				set(H,'XData',real(out_dat2(:,1)),'YData',real(out_dat2(:,2)));
			elseif dwdat1(:,1) > 1
				set(H,'XData',real(out_dat2(:,1)),'YData',real(out_dat2(:,2)));
			end	
		else    
			display('Data can not calculated');
		end
%
% 一方向のみ計算した場合
%
	elseif reverse_sw == 0
		%
		% データ格納の行列サイズの check
		%
		updat1 = size(out_dat1);
		
		if updat1(:,1) == 1
			H=plot(real(out_dat1(:,1)),real(out_dat1(:,2)),'b.-','EraseMode','none');
		elseif updat1(:,1) > 1
			set(H,'XData',real(out_dat1(:,1)),'YData',real(out_dat1(:,2)));
		else
			display('Data can not calculated');
		end
	end

	drawnow;

%end function

