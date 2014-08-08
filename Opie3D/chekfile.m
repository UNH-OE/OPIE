function [a]=chekfile(pth,file)
%a=chekfile(pth,file)
%
%Given a path and filename (pth and file) this function
%Checks to see if the file exists in the format
%	path\file
%Returns 1 if file exists and 0 if it doesn't



fid=feval('fopen',[pth,file]);

if fid == -1
	a=0;
	
else
	fclose(fid);
	a=1;
	end