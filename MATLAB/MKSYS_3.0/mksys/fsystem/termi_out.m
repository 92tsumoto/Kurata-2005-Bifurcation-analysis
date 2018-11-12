function termi_out(para,x,pre_revsw)
%
% program terminate check
%

global iosave
global bf_out1 bf_out2
global N
global reverse_sw
global bf_type
global theta

	if reverse_sw == 1
		if pre_revsw == 1
			fprintf('\n');
			fprintf('This program is forcibly terminated.\n');
		%
		% 停止点でのパラメータ，状態値のファイルへの保存
		%
			tmp = x(1:N);
			if bf_type == 3
				u=[para(:);tmp(:);theta];
			else
				u=[para(:);tmp(:)];
			end
		%
		% 初期値ファイルの backup
		%
			backup_out2(u,pre_revsw);

		%
		% ファイル出力がオンであれば file close
		%
			if iosave == 1
				fclose(bf_out1);
			end

		elseif pre_revsw == 0

			fprintf('\n');
			fprintf('This program is forcibly terminated.\n');
		%
		% ファイル出力がオンであれば file close
		%
			if iosave == 1
				fclose(bf_out2);
			end

		%
		% output the initial setting file
		%
			tmp = x(1:N);
			if bf_type == 3
				u=[para(:);tmp(:);theta];
			else
				u=[para(:);tmp(:)];
			end
		%
		% 初期値ファイルの backup
		%
			backup_out2(u,pre_revsw);

		end
	
	elseif reverse_sw == 0
		fprintf('\n');
		fprintf('This program is forcibly terminated.\n');
	%
	% ファイル出力がオンであれば file close
	%
		if iosave == 1
			fclose(bf_out1);
		end
	
	%
	% 停止点でのパラメータ，状態値のファイルへの保存
	%
		tmp = x(1:N);
		if bf_type == 3
			u=[para(:);tmp(:);theta];
		else
			u=[para(:);tmp(:)];
		end
	%
	% 初期値ファイルの backup
	%
		backup_out2(u,pre_revsw);

	end

%end function

