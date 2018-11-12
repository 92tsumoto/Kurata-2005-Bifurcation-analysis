function locus_graph(chara)
%
% Graphic display at real time
%

global loci

	tmp1 = real(chara);
	tmp2 = imag(chara);

	set(loci,'XData',real(tmp1),'YData',real(tmp2));
	drawnow;

%end function

