function [A,B,C]=lawofcos(a,b,c)
%[A,B,C]=lawofcos(a,b,c)
%
%Given the sides of any triangle a, b and c, this function
%returns the angles opposite the entries a, b and c as
%A, B and C.

A=acos((b^2+c^2-a^2)/2/b/c);
B=acos((c^2+a^2-b^2)/2/c/a);
C=acos((a^2+b^2-c^2)/2/a/b);

