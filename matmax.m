function [i,j,max]=matmax(A)
%[i,j,max]=matmax(A)
%
%This function returns the maximum value of the 2-D array A and
%the row and column indecies (i,j respectively) of the maximum
%value.
%If there is more than one maximum value the left-most then
%upper-most indecies will be returned.

[max,i]=max(A);
[max,j]=max(max);
i=i(j);