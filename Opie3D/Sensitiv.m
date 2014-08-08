i=1:81;
j=1:81;
k=0:5;
l=0:5;

a(i)=(i+9)*pi/180;
b(j)=(j+9)*pi/180;
da(k+1)=(k-2)*pi/180;
db(l+1)=(l-2)*pi/180;

for i=1:81,
for j=1:81,
for k=1:6,
for l=1:6,

		x(i,j)=( sin (b(j)+db(l)) + sin (a(i)+da(k)) ) /...
		     ( cos (a(i)+da(k)) * sin (b(j)+db(l)) + sin (a(i)+da(l)) * cos (b(j)+db(l)) );
	end
	end
	end
	end