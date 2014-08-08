function c=makesame(a,b)
%[c,d]=makesame[a,b]
%Given matricies a and b 'makesame' extracts the upper left hand area
%of b if it is larger and pads it with zeros to it if it is smaller.

[ma na]=size(a);
[mb nb]=size(b);

c=zeros(size(a));

c(1:min(ma,mb),1:min(na,nb))=b(1:min(ma,mb),1:min(na,nb));