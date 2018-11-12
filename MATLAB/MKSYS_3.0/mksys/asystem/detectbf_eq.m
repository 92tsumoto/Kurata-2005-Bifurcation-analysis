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
	% ��ͭ�ͤμ����� 0 ��ۤ��Ƥ���Ŀ����Ѳ�
	%
	if not(isequal(para(ip),ini_para))

		if pre_ind(:,1) ~= size_idx(:,1)
			% ���Ф��줿�顤���θ�ͭ�ͤ� index ��õ��
			[Y,idx] = min(abs(real(chara)));

			fprintf('Pass through a bifurcation !\n');
			bf_flag = 1;
			pre_ind = size_idx;

			%
			% Determination of the kind of the bifurcation.
			% ���Ф��줿 index �θ�ͭ�ͤε���������Ǥʤ����
			% Hopf ʬ���β�ǽ��
			%
			if imag(chara(idx)) ~= 0
				fprintf('The bifurcation is Hopf bifurcation\n');
			%
			% ���Ф��줿 index �θ�ͭ�ͤε���������ξ��
			% Tangent, Pitch-fork ʬ���β�ǽ������
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
	% ʬ���θ��и塤ʬ���ͤض�Ť�����
	%
	if istopbf == 2

		%
		% ��ͭ�ͤμ����� 0 �˶ᤤ��Τ򸡽�
		% �ѥ�᡼���ι�ߤ�Ĵ�����ʤ��餳���ϰϤ�
		% �������������ޤǷ����֤���
		%
		
		if find(min(abs(real(chara(idx)))) < 1E-6 )
			%[Y idx] = min(abs(real(chara)));
			%
			% Hopf ʬ��
			%
			if imag(chara(idx)) ~= 0
				omega = imag(chara(idx));
				ns_para_out(x,para,omega,0);

			%
			% Pitch-fork ʬ��
			%
			else
				stok = [para x];
				backup_out(stok);
			end
		%
		% ddelta = 1 �ΤȤ����ѥ�᡼���ݹ�ߤ򾮤�������
		% �������˷׻����롥ʬ�����θ��Ф���λ�������ᡤddelta = -1 �Ȥ���
		% �׻���λ�����롥
		%
			ddelta = -1;
			return;

		%
		% ��ͭ�ͤ��礭����ʬ�����˶�Ť��Ƥ��ʤ���
		% ���Τ��� ddelta = 1 ���֤����ѥ�᡼���ݹ�ߤ򾮤�������
		% �������˷׻����롥
		%
		
		else

			ddelta = 1;

		end % istopbf = 2 �� case �ν�λ

	%
	% ʬ���θ��и塤�׻���ߤξ��
	% bf_stop case 1
	
	elseif istopbf == 1
	
		%
		% �׻�������ޤǤ��ͤ� backup file ����¸
		%
		stok=[para x];
		backup_out(stok);
	
		%
		% ʬ�����θ��Ф���λ�������ᡤddelta = -1 �Ȥ���
		% �׻���λ�����롥
		%		
			ddelta=-1;
			return;
	
	%
	% ʬ���θ��ФϹԤʤ������׻���³��
	% bf_stop case 0
	
	elseif istopbf == 0
	
		return;
	
	end

end


%end function

