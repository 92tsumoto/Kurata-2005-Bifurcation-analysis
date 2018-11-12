function [para,x,ip,dip,endip,pre_revsw,forcing_stop]=...
			epara_out(para,x,ip,dip,endip,var1st,dvar1st,end1st,pre_revsw)
%
% End-parameter check
%

global iosave
global sname2
global bf_out1 bf_out2
global reverse_sw
global bf_type
global ipara istate
global itheta theta
global mu N

	if reverse_sw == 1
		if pre_revsw == 1
			fprintf('\n');
			fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
		%
		% 停止点でのパラメータ，状態値のファイルへの保存
		%
			tmp = x(1:N);
			if bf_type == 3
				u=[para(:);tmp(:);theta];
			else
				u=[para(:);tmp(:)];
			end
			backup_out2(u,pre_revsw);

		%
		% ファイル出力がオンであれば file close
		%
			if iosave == 1
				fclose(bf_out1);
			end

		%
		% 初期設定を元に戻す.
		%
			para=ipara;
			x=istate;

			if bf_type == 3
				theta = itheta;
				mu = exp(sqrt(-1)*theta);
			else
				theta = 0;
			end

		%
		% パラメータの変分を初期設定に戻す．
		%
			ip=var1st;
			endip=end1st;
			variational_Eq(ip);

			dip=-1.0*dvar1st;

		%
		% 変化パラメータの向きを変更した後の
		% save file を open
		%
			if iosave == 1
				bf_out2 = fopen(sname2,'wt');
			end
		%
		% pre_revsw を変更.
		%
			pre_revsw = 0;

		%
		% forcibly finish this routine, but the calculation continues,
		% i.e., forcing_stop to ``1''
		%
			fprintf('\n');
			fprintf('Next, the bifurcation set will be calculated to inverted direction: dip(2)=%e\n',dip(2));
			forcing_stop = 1;
			return;

		elseif pre_revsw == 0

			fprintf('\n');
			fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
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
			backup_out2(u,pre_revsw);

		%
		% forcibly finish this routine and the calculation is stopped,
		% i.e., forcing_stop to ``0''
		%
			forcing_stop = 0;
			return;
		end
	elseif reverse_sw == 0
		fprintf('\n');
		fprintf('The value of the changing parameter reached your setting end-parameter value.\n');
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
		backup_out2(u,pre_revsw);

		%
		% forcibly finish this routine and the calculation is stopped,
		% i.e., forcing_stop to ``0''
		%
			forcing_stop = 0;
			return;
	end

%end function

