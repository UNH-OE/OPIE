function rot_center=rotcent(dot1,dot2,dot3,dt)
%rot_center=rotcent(dot1,dot2,dot3,dt)
%
%This function uses the marker locations to find the
%center of rotation of the object.  It also performs
%a check for no rotation and translation only.



%Compute the components of tangential velocity for each marker

for i=2:length(dot1')
	v1(i,1)= ( dot1(i+1,1) - dot1(i-1,1) ) / (2*dt);
	v1(i,2)= ( dot1(i+1,2) - dot1(i-1,2) ) / (2*dt);
	v1(i,3)= ( dot1(i+1,3) - dot1(i-1,3) ) / (2*dt);
	v2(i,1)= ( dot2(i+1,1) - dot2(i-1,1) ) / (2*dt);
	v2(i,2)= ( dot2(i+1,2) - dot2(i-1,2) ) / (2*dt);
	v2(i,3)= ( dot2(i+1,3) - dot2(i-1,3) ) / (2*dt);
	v3(i,1)= ( dot3(i+1,1) - dot3(i-1,1) ) / (2*dt);
	v3(i,2)= ( dot3(i+1,2) - dot3(i-1,2) ) / (2*dt);
	v3(i,3)= ( dot3(i+1,3) - dot3(i-1,3) ) / (2*dt);


	%Check for translation only

	if cross(v1(i,:),v2(i,:))==0
	
	elseif cross(v1(i,:),v2(i,:))==0

	elseif cross(v1(i,:),v3(i,:))==0


	%Else compute center of rotation

	else
		a=[ dot(v1(i,:),dot1(i,:));...
		    dot(v2(i,:),dot2(i,:));...
		    dot(v3(i,:),dot3(i,:))];

		b=[v1(i,1) v1(i,2) v1(i,3);...
		   v2(i,1) v2(i,2) v2(i,3);...
		   v3(i,1) v3(i,2) v3(i,3)];

		rot_center(i,:)=a*b^-1;

		end
		