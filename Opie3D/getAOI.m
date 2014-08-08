function xarea=getAOI(A,a,dot)
%xarea=getAOI(A,area,dot)
%
%Uses the size of the search area size defined in 'area' and the location 
%of the last known position (dot(frame_num)) to extract the area of intrest from
%the current frames for the dot

[m n]=size(A);


y=round(dot(1,1));
x=round(dot(1,2));

if x-round(a/2)<=0
	xlower=1;
else
	xlower=x-round(a/2);
	end

if x+round(a/2)>n
	xupper=n;
else
	xupper=x+round(a/2);
	end

if y-round(a/2)<=0
	ylower=1;
else
	ylower=y-round(a/2);
	end

if y+round(a/2)>m
	yupper=m;
else
	yupper=y+round(a/2);
	end

xarea=A(ylower:yupper,xlower:xupper); 	%Always gives an odd sized area