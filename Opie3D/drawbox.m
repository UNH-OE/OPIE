function B=drawbox(A,n,y,x)
%B=drawbox(A,n,y,x)
%
%This function draws an n by n box centered on (row,col)



[m1,n1]=size(A);

if x-n/2<=0
	xlower=1;
else
	xlower=round(x-n/2);
	end

if x+n/2>m1
	xupper=m1;
else
	xupper=round(x+n/2);
	end

if y-n/2<=0
	ylower=1;
else
	ylower=round(y-n/2);
	end

if y+n/2>=n1
	yupper=n1;
else
	yupper=round(y+n/2);
	end

A(xlower:xupper,ylower)=zeros(size(A(xlower:xupper,ylower)));
A(xlower:xupper,ylower+1)=zeros(size(A(xlower:xupper,ylower+1)));
A(xlower:xupper,yupper)=zeros(size(A(xlower:xupper,yupper)));
A(xlower:xupper,yupper+1)=zeros(size(A(xlower:xupper,yupper+1)));
A(xlower,ylower:yupper)=zeros(size(A(xlower,ylower:yupper)));
A(xlower+1,ylower:yupper)=zeros(size(A(xlower+1,ylower:yupper)));
A(xupper,ylower:yupper)=zeros(size(A(xupper,ylower:yupper)));
A(xupper+1,ylower:yupper)=zeros(size(A(xupper+1,ylower:yupper)));

B=A;