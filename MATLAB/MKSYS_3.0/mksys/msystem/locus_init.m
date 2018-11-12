function locus_init(chara)
%
% Initializing the real-time graph
%

global loci;

	%
	% initializing the graph
	%
		clf; % clear of the figure

	%
	% figure initialization
	%
		axis([-1.5 1.5 -1.5 1.5]); 
		axis square; 
		grid on;
		title 'Gauss plane'
		xlabel 'Re(mu)'
		ylabel 'Im(mu)'

	%
	% Drawing the unit circle
	%
		sita=0.0:0.01:2*pi;
		cir_x=sin(sita);
		cir_y=cos(sita);

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

