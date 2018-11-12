function [ipx,ipy,dipx,dipy,endipx,endipy,tmp_mu,l,m,nnn,tau1] = init_binput(tmp_mu)
%
% inputs of various values of the initial setting
%
% If the calculated data are save to a text file, 
% then in the bf.in, the value, i.e., iosave, should be 1
% and a file name to save the calculated data must describe
% the next line from top of bf.in.
%

global iosave
global sname
global gmax emax kmax epsx feps
global reltol abstol
global solsw
global bf_type
global au adj_step reverse_sw
global fstop

try
% Detection of save data
[iosave]=textread('bf.in','%d',1,'commentstyle','c++','delimiter', ',','whitespace',' ');
%
% If the calculated data are save to a text file, 
% then the switch iosave should be 1.

if iosave==0
	sname='emptyfile';
	
	[gmax,emax,epsx,feps,reltol,abstol,solsw,ipx,ipy,dipx,endipx,dipy,endipy]=...
			textread('bf.in','%f %f %f %f %f %f %d %d %d %f %f %f %f',1,'headerlines',1,'commentstyle','c++','delimiter',',','whitespace',' ');
	
	[bf_type]=textread('bf.in','%d',1,'headerlines',8,'commentstyle','c++','delimiter', ',','whitespace',' ');
	
	if bf_type ~= 4 
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',9,'commentstyle','c++','delimiter',',','whitespace',' ');
	else
		[tmp_mu]=textread('bf.in','%f',1,'headerlines',9,'commentstyle','c++','delimiter',',','whitespace',' ');
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',10,'commentstyle','c++','delimiter',',','whitespace',' ');
	end

elseif iosave==1
	[sname]=textread('bf.in','%s',1,'headerlines',1,'commentstyle','c++','delimiter', ',','whitespace',' ');
	[gmax,emax,epsx,feps,reltol,abstol,solsw,ipx,ipy,dipx,endipx,dipy,endipy]=...
			textread('bf.in','%f %f %f %f %f %f %d %d %d %f %f %f %f',1,'headerlines',2,'commentstyle','c++','delimiter',',','whitespace',' ');
	
	[bf_type]=textread('bf.in','%d',1,'headerlines',9,'commentstyle','c++','delimiter', ',','whitespace',' ');

	if bf_type ~= 4 
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',10,'commentstyle','c++','delimiter',',','whitespace',' ');
	else
		[tmp_mu]=textread('bf.in','%f',1,'headerlines',10,'commentstyle','c++','delimiter',',','whitespace',' ');
		[l,m,kmax,au,nnn,tau1,adj_step,reverse_sw]=textread('bf.in','%d %d %d %f %d %f %d %d',1,'headerlines',11,'commentstyle','c++','delimiter',',','whitespace',' ');
	end

	if isempty(reverse_sw)
		%
		% If the variables can't read, the variables are input
		% mimicing values, and returned.
		% fstop : a flag for the forcing stop
		%
		ipx=-1;ipy=-1;dipx=-1;dipy=-1;endipx=-1;endipy=-1;
		tmp_mu=-1;l=-1;m=-1;nnn=-1;tau1=-1;

		fstop = 1;
		return;
	end

end

catch
	%
	% The case where there is an error for reading 
	% the initial setting file.
	%
	ipx=-1;ipy=-1;dipx=-1;dipy=-1;endipx=-1;endipy=-1;
	tmp_mu=-1;l=-1;m=-1;nnn=-1;tau1=-1;

	fstop = 1;
	return;
end

%end function

