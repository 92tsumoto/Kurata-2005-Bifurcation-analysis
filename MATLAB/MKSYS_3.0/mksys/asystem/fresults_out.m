function fresults_out(iterN,para,ip,x,chara,tau,det_value)
%
% output of results
%

global f3out 
global iosave
global sol_type

switch sol_type
	case 1
		fprintf('%d %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e ) %e\n',iterN,para(ip(1)),para(ip(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value);

		if iosave==1
			fprintf(f3out,'%d %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e ) %e\n',iterN,para(ip(1)),para(ip(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value);
		end
	case 2
		fprintf('%d %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e ) %e\n',iterN,para(ip(1)),para(ip(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value,tau);

		if iosave==1
			fprintf(f3out,'%d %e  %e / %e  %e | %e  %e  %e | %e  %e  %e | ( %e ) %e\n',iterN,para(ip(1)),para(ip(2)),x(1),x(2),real(chara(1)),imag(chara(1)),abs(chara(1)),real(chara(2)),imag(chara(2)),abs(chara(2)),det_value,tau);
		end
end

%end function

