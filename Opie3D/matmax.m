function [maximum,i,j]=matmax(a)
%[maximum,i,j]=matmax(a)
%maximum is the largest value in the array
%i is the row of the minimum
%j is the column of the minimum
%If more than one entry are the same it will return the indices of
%the first one it finds.

[col_max,index]=max(a);
[maximum,j]=max(col_max);
i=index(j);