function [A,B]=loadfram(pth,fname,k)
%[A,B]=loadfram(pth,fname,k)
%
%Given the path, two file prefixes and the frame number (k),
%The function opens and reads the bitmap file and returns them
%as A and B.  The images are assumed to be
%of size m by n.  'm' and 'n' can be set internal to the function.
%'m' is 484 and 'n' is 684


m=484;							%The number of rows in each image
n=684;							%The number of columns in each image


file=[pth,fname,'_',int2str(k),'.bmp'];			%This line uses the naming convention of MaxLab from
							%Datacube.  This software uses a file convention like
							%file_1.bmp, file_2.bmp..., file_10.bmp,...file_100.bmp

%[new_image,map]=bmpread(file);				%Reads in the images
new_image=imread(file,'bmp');


A=new_image(1:m,1:645);					%Extracts the first m by n chunk from the new image.
B=new_image(1:m,646:1292);				%Extracts the second m by n chunk from the new image.
							%The numbers in the arguments were determined by looking
							%at the images and getting the dimensions from them.  It
							%would prove beneficial to get the system more automated
							%so that the progrma used the m by n method.