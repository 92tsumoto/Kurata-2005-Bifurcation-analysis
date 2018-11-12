function rout_graph(out_dat1,out_dat2,pre_revsw)
%
% Graphic display at real time
%

global reverse_sw
global H

set(gca,'XLimMode','auto','YLimMode','auto');

%
% �������˷׻�������硧
% out_dat{1,2} ���� 1 �ʾ�ǡ��������Ѥ����
% ��硤2 �Ĥζ����򥰥��ɽ�����롥
%
	if reverse_sw == 1
		%
		% �ǡ�����Ǽ�ι��󥵥����� check
		% updat1 : out_dat1�Υ�����
		% dwdat1 : out_dat2�Υ�����
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
% �������Τ߷׻��������
%
	elseif reverse_sw == 0
		%
		% �ǡ�����Ǽ�ι��󥵥����� check
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

