function [x_corr1,x_corr2,x_corr3]=opiecorr(a,b,c,a1,b1,c1)
%[x_corr1,x_corr2,x_corr3]=opiecorr(a,b,c,a1,b1,c1)
%
%This function cross correlate a with a1 etc.
%the cross correlation is then restructured so (0,0) is in the
%center of the matrix.


xc1=ifft2(conj(fft2(a1)).*fft2(a));
xc2=ifft2(conj(fft2(b1)).*fft2(b));		%Performs the cross correlation on each AOI
xc3=ifft2(conj(fft2(c1)).*fft2(c));



x_corr1=fftshift(xc1);
x_corr2=fftshift(xc2);			%Puts (1,1) in the center
x_corr3=fftshift(xc3);
