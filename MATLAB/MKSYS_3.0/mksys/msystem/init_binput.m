function [ipx,ipy,dipx,dipy,endipx,endipy,tmp_mu,l,nnn] = init_binput(tmp_mu)
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
	
	[gmax,emax,epsx,feps,ipx,ipy,dipx,endipx,dipy,endipy]=...
			textread('bf.in','%f %f %f %f %d %d %f %f %f %f',1,'headerlines',1,'commentstyle','c++','delimiter',',','whitespace',' ');
	
	[bf_type]=textread('bf.in','%d',1,'headerlines',6,'commentstyle','c++','delimiter', ',','whitespace',' ');
	
	if bf_type ~= 4 
		[l,kmax,au,nnn,adj_step,reverse_sw]=textread('bf.in','%d %d %f %d %d %d',1,'headerlines',7,'commentstyle','c++','delimiter',',','whitespace',' ');
	else
		[tmp_mu]=textread('bf.in','%f',1,'headerlines',7,'commentstyle','c++','delimiter',',','whitespace',' ');
		[l,kmax,au,nnn,adj_step,reverse_sw]=textread('bf.in','%d %d %f %d %d %d',1,'headerlines',8,'commentstyle','c++','delimiter',',','whitespace',' ');
	end

elseif iosave==1
	[sname]=textread('bf.in','%s',1,'headerlines',1,'commentstyle','c++','delimiter', ',','whitespace',' ');
	[gmax,emax,epsx,feps,ipx,ipy,dipx,endipx,dipy,endipy]=...
			textread('bf.in','%f %f %f %f %d %d %f %f %f %f',1,'headerlines',2,'commentstyle','c++','delimiter',',','whitespace',' ');
	
	[bf_type]=textread('bf.in','%d',1,'headerlines',7,'commentstyle','c++','delimiter', ',','whitespace',' ');

	if bf_type ~= 4 
		[l,kmax,au,nnn,adj_step,reverse_sw]=textread('bf.in','%d %d %f %d %d %d',1,'headerlines',8,'commentstyle','c++','delimiter',',','whitespace',' ');
	else
		[tmp_mu]=textread('bf.in','%f',1,'headerlines',8,'commentstyle','c++','delimiter',',','whitespace',' ');
		[l,kmax,au,nnn,adj_step,reverse_sw]=textread('bf.in','%d %d %f %d %d %d',1,'headerlines',9,'commentstyle','c++','delimiter',',','whitespace',' ');
	end

	if isempty(reverse_sw)
		%
		% �ɤޤ�ʤ��ä��ѿ��˵������ͤ������ return.
		% fstop : ������λ�Ѥ� flag
		%
		ipx=-1;ipy=-1;dipx=-1;dipy=-1;endipx=-1;endipy=-1;tmp_mu=-1;l=-1;nnn=-1;

		fstop = 1;
		return;
	end

end

catch
	%
	% �ե�������ɤ߹��ߤ� error ͭ�ꡥ
	%
	ipx=-1;ipy=-1;dipx=-1;dipy=-1;endipx=-1;endipy=-1;tmp_mu=-1;l=-1;nnn=-1;

	fstop = 1;
	return;
end

