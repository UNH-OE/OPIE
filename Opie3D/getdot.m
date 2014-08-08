function dot=getdot(dot,correlation,frame_num,camera_num,dot_num)
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

if camera_num==1
	dot(frame_num,2)=x+round(dot(frame_num-1,2));
	dot(frame_num,1)=y+round(dot(frame_num-1,1));
	end
if camera_num==2
	dot(frame_num,4)=x+round(dot(frame_num-1,4));
	dot(frame_num,3)=y+round(dot(frame_num-1,3));
	end

dot(frame_num,:)=round(dot(frame_num,:)*10)/10;