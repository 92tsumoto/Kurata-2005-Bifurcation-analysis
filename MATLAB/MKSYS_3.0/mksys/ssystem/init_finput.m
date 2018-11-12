function [sname,ipx,ipy,dipx,dipy,endipx,endipy,l,m,nnn,tau1,istopbf]=init_finput()
%
% inputs of various values of the initial setting
%
% If the calculated data are save to a text file, 
% then in the fix.in, the value, i.e., iosave, should be 1
% and a file name to save the calculated data must describe
% the next line from top of fix.in.
%

global iograph iosave
global kmax emax gmax epsx feps
global reltol abstol solsw
global seigtol
global fstop

try
% Detection of save data
[iograph]=textread('fix.in','%d',1,'commentstyle','c++','delimiter', ',','whitespace',' ');
[iosave]=textread('fix.in','%d',1,'headerlines',1,'commentstyle','c++','delimiter', ',','whitespace',' ');
%
% If the calculated data are save to a text file, 
% then the swithch iosave should be 1.

	if iosave==0
		sname='emptyfile';
		[gmax,emax,epsx,feps,reltol,abstol,solsw,ipx,ipy,dipx,endipx,dipy,endipy,l,m,kmax,nnn,tau1,istopbf,seigtol]=...
			textread('fix.in','%f %f %f %f %f %f %d %d %d %f %f %f %f %d %d %d %d %f %d %f',1,'headerlines',2,'commentstyle','c++','delimiter',',','whitespace',' ');

	elseif iosave==1
		[sname]=textread('fix.in','%s',1,'headerlines',2,'commentstyle','c++','delimiter', ',','whitespace',' ');
		[gmax,emax,epsx,feps,reltol,abstol,solsw,ipx,ipy,dipx,endipx,dipy,endipy,l,m,kmax,nnn,tau1,istopbf,seigtol]=...
			textread('fix.in','%f %f %f %f %f %f %d %d %d %f %f %f %f %d %d %d %d %f %d %f',1,'headerlines',3,'commentstyle','c++','delimiter',',','whitespace',' ');
	end

catch
	%
	% If the variables can't read, the variables are input
	% mimicing values, and returned.
	% fstop : a flag for the forcing stop
	%
	ipx=-1;ipy=-1;dipx=-1;dipy=-1;endipx=-1;endipy=-1;
	l=-1;m=-1;nnn=-1;tau1=-1;istopbf=-1;

	fstop = 1;
	return;
end

%end function

