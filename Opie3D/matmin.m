function [minimum,i,j]=matmin(a)
%[minimum,i,j]=matmin(a)
%minimum is the smallest value in the array
%i is the row of the minimum
%j is the column of the minimum
%If more than one entry are the same it will return the indices of
%the first one it finds.

[col_min,index]=min(a);
[minimum,j]=min(col_min);
i=index(j);