function [xc,yc]=subpixel(A)
%[xc,yc]=subpixel(A)
%Needs a square 5 by 5 neighborhood

[m,n]=size(A);
if m~=n
	error('This is not a square neighbor hood');
	end



[xi,yi]=meshgrid(-m/2+1/2:m/2-1/2,-m/2+1/2:m/2-1/2);

B=[sum(sum(-xi.^4))	sum(sum(-xi.^2 .* yi.^2))	sum(sum(xi.^3))	sum(sum(xi.^2 .* yi))	sum(sum(xi.^2));...
   sum(sum(-xi.^2 .* yi.^2))	sum(sum(-yi.^4))	sum(sum(xi .* yi.^2))	sum(sum(yi.^3))	sum(sum(yi.^2));...
   sum(sum(xi.^3))	sum(sum(xi .* yi.^2))		sum(sum(-xi.^2))	sum(sum(-xi .* yi))	sum(sum(-xi));...
   sum(sum(xi.^2 .* yi))	sum(sum(yi.^3))		sum(sum(-xi .* yi))	sum(sum(-yi.^2))	sum(sum(-yi));...
   sum(sum(-xi.^2))	sum(sum(-yi.^2))	sum(sum(xi))	sum(sum(yi))	m*m];

C=[sum(sum(A .* xi.^2));...
   sum(sum(A .* yi.^2));...
   sum(sum(A .* xi));...
   sum(sum(A .* yi));...
   sum(sum(A))];

D=B\C;

a=D(1);
b=D(2);
xc=D(3)/2/a;
yc=D(4)/2/b;
const=-a*xc^2-b*yc^2-D(5);

a=-a;
b=-b;
xc=-xc;
yc=-yc;
const=-const;

%z=a(x-xc).^2+b(y-yc).^2+const

%E=a*(xi-xc).^2+b*(yi-yc).^2+const;

%fprintf('z=%g*(x-%g)^2 + %g*(y-%g)^2 +%g',a,xc,b,yc,const);