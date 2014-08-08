function [i,j,mmin]=matmin(A)
%[i,j,min]=matmin(A)
%
%This function returns the minimum value of the 2-D array A and
%the row and column indecies (i,j respectively) of the minimum
%value.
%If there is more than one minimum value the left-most then
%upper-most indecies will be returned.

[mmin,i]=min(A);
[mmin,j]=min(mmin);
i=i(j);