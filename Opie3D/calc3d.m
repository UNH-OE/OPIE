function pos3d=calc3d(pos2d,cal,alpha,beta,m,n)
%pos3d=calc3d(pos2d,cal,alpha,beta,m,n)
%
%Returns in the form X Y Z by number of frames


B=[cal(1,1)*(pos2d(1,2)-n/2);cal(1,3)*(pos2d(1,4)-n/2)];
A=[cos(alpha) -sin(alpha);cos(beta) sin(beta)];

X=A\B;

pos3d(1,1)=X(1,1);
pos3d(1,2)=X(2,1);
pos3d(1,3)=mean([-cal(1,2)*(pos2d(1,1)-m/2);-cal(1,4)*(pos2d(1,3)-m/2)]);	

