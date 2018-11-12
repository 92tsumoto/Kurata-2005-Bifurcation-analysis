function out_graph(out_dat1,out_dat2)
%
% Graphic display
%
% ��᤿�ѥ�᡼���ͤ�ʣ�ǿ��Ȥ���
% �����Ƥ��ޤ�������������(�ä� NS ��
% �׻�������)�����Τ��ᡤ��᤿�ѥ�᡼��
% ��¿���( real(para) ) ���ƥ����ɽ����
% �ԤäƤ��뤳�Ȥ���ա�
%

global reverse_sw

if reverse_sw == 1
	%
	% �ǡ�����Ǽ�ι��󥵥����� check
	% updat1 : �ǡ������Υ�����
	% dwdat1 : �ǡ������Υ�����
	%
	updat1 = size(out_dat1);
	dwdat1 = size(out_dat2);

	%
	% �������˷׻�������硧
	% �ǡ�����,�����ˣ��ʾ�ǡ�����������
	% ���Ĥζ����򥰥��ɽ�����롥
	%

	if updat1(:,1) > 1
		if dwdat1(:,1) > 1
			plot(real(out_dat1(:,1)),real(out_dat1(:,2)),...
				real(out_dat2(:,1)),real(out_dat2(:,2)));

			%
			% �ǡ������Τߣ��ʾ�ǡ�����������
			% ���Ĥζ����򥰥��ɽ�����롥
			%

		else
			plot(real(out_dat1(:,1)),real(out_dat1(:,2)));
		end
	else
		disp('Data can not calculated');
	end
	%
	% �������Τ߷׻��������
	%
elseif reverse_sw == 0
	%
	% �ǡ�����Ǽ�ι��󥵥����� check
	%
	updat1 = size(out_dat1);

	%
	% updat1 : �ǡ������Υ�����
	% �ǡ������ˣ��ʾ�ǡ����������
	% ����դ�ɽ�����롥
	%

	if updat1(:,1) > 1
		plot(real(out_dat1(:,1)),real(out_dat1(:,2)));
	else
		disp('Data can not calculated');
	end
end

%end function

