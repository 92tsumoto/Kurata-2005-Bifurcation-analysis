function locus_init_eq(chara)
%
% Initializing the real-time graph
%

global loci;

%
% initializing the graph
%
%	figure(1);
%	set(gca,'XLimMode','auto','YLimMode','auto');
	clf;    

%
% figure initialization
%
	grid on;
	title 'Gauss plane'
	xlabel 'Re(mu)'
	ylabel 'Im(mu)'
	
%
% Drawing the unit circle
%
	%
	% 一時的に設定．この辺うまくやる方法は無いものか？
	%
	cir_x=[-5 0; 5 0];
	cir_y=[0 -2.5; 0 2.5];
    
	hold on 
	plot(cir_x,cir_y,'m'); 

%
% initial point of characteristic multipliers
%
	init_x=real(chara);
	init_y=imag(chara);

% function handle
	loci=plot(real(init_x),real(init_y),'bo','EraseMode','none');		

%end function

