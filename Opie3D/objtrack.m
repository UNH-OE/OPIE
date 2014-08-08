function point_track=objtrack(dot1,dot2,dot3,user_point)
%point_track=objtrack(dot1,dot2,dot3,user_point)
%
%This function uses the position of the three markers to
%find the position of a point of intrest to the user defined by
%'user_point'.  All of the arguments passed to this function must
%be of size 1 by 3 only.

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

transpose_matrix=[dot(xa,i) dot(xa,j) dot(xa,k);...
		  dot(ya,i) dot(ya,j) dot(ya,k);...
		  dot(za,i) dot(za,j) dot(za,k)];

point_track=(transpose_matrix*user_point')'+dot1;