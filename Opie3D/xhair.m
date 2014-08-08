function B=xhair(A,col,row)
%B=xhair(A,i,j)
%
%This function draws cross-hairs at a point (row,col)

B=A;
[m n]=size(B);

x=round(col);
y=round(row);

if x-n/20<=0
	xlower=1;
else
	xlower=round(x-n/20);
	end

if x+n/20>n
	xupper=n;
else
	xupper=round(x+n/20);
	end

if y-m/20<=0
	ylower=1;
else
	ylower=round(y-m/20);
	end

if y+m/20>=m
	yupper=m;
else
	yupper=round(y+m/20);
	end

B(y,xlower:xupper)=zeros(1,xupper-xlower+1);
B(y+1,xlower:xupper)=zeros(1,xupper-xlower+1);

B(ylower:yupper,x)=zeros(yupper-ylower+1,1);
B(ylower:yupper,x+1)=zeros(yupper-ylower+1,1);