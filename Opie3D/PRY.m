function [pitch,roll,yaw]=PRY(dot1,dot2,dot3)
%[pitch,roll,yaw]=PRY(dot1,dot2,dot3)
%
%This function uses the 3-D position in dot1, dot2 and dot3
%to find the pitch, roll and yaw angles of the object.
%Pitch is the angle the relative (fixed to the body) x-axis makes 
%with the rigid x-axis.
%Likewise Roll is the angle between the relative z-axis and the
%fixed z-axis and Yaw the between the relative y-axis and the y-axis.

X1=dot1-dot1;
X2=dot2-dot1;				%These lines remove the translation from the three markers
X3=dot3-dot1;

xa=X2-X1;				%The x' axis = vector 1-2
ya=cross(X3-X1,xa);			%The y' axis = the cross product of x' and vector 1-3
za=cross(xa,ya);			%The z' axis = the cross product of x' and y'

xa=xa/sqrt(xa(1)^2+xa(2)^2+xa(3)^2);
ya=ya/sqrt(ya(1)^2+ya(2)^2+ya(3)^2);	%These lines get the unit vectors of the x',y' and z' axes
za=za/sqrt(za(1)^2+za(2)^2+za(3)^2);

i=[1 0 0];
j=[0 1 0];				%These lines give the unit normal vectors
k=[0 0 1];

XxK=cross(xa,k);
YxK=cross(ya,k);
XxXxK=cross(i,cross(xa,k));
XxKm=sqrt(XxK(1)^2+XxK(2)^2+XxK(3)^2);
YxKm=sqrt(YxK(1)^2+YxK(2)^2+XxK(3)^2);
XxXxKm=sqrt(XxXxK(1)^2+XxXxK(2)^2+XxXxK(3)^2);


pitch=pi/2-asin(XxKm);
roll=pi/2-asin(YxKm);
yaw=pi/2-asin(XxXxKm/XxKm);

pitch=pitch*180/pi;
roll=roll*180/pi;
yaw=yaw*180/pi;