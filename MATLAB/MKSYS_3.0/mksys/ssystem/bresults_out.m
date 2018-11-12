function bresults_out(iterN,para,x,chara,det_value,var1st,pre_revsw)
%
% output of results
%
         
global iosave
global bf_out1 bf_out2
global reverse_sw

	fprintf('%d ) %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e )\n',iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value);

	if iosave == 1
		if reverse_sw == 1
			if pre_revsw == 1
				fprintf(bf_out1,'%d) %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e )\n',iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value);
			elseif pre_revsw == 0
				fprintf(bf_out2,'%d) %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e )\n',iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value);
			end
		elseif reverse_sw == 0
			fprintf(bf_out1,'%d) %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e )\n',iterN,para(var1st(1)),para(var1st(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value);
		end
	end

%end function

