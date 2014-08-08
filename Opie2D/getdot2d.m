function [x,y]=getdot2d(correlation)
%dot_a=getdot(dot,correlation,frame_num,camera_num,dot_num)
%
%Finds the peak of the correlation and gets the new location
%from it.
%Fills dot(i) in the form Y1 X1 Y2 X2

[max_,i,j]=matmax(correlation);
[m n]=size(correlation);

if i-2<1 | j-2<1 | i+2>m | j+2>n
   xc=0;
   yc=0;

else   
   [xc,yc]=subpixel(real(correlation(i-2:i+2,j-2:j+2)));
end

   
x=j+xc-round(n/2);
y=i+yc-round(m/2);

x=round(x*10)/10;
y=round(y*10)/10;
