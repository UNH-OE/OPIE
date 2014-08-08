clear
pth=['d:\opie3d\video\'];
fname1=['c1'];
fname2=['c2'];
frame_end=14;
load c:\matlab\bin\opie3d\demodata;

%demodata --> save c:\matlab\bin\opie3d\demodata dot1 dot2 dot3 alpha beta cal area1 area2 area3



for frame_num=1:frame_end,

	[A,B,map_a,map_b]=loadfram(pth,fname1,fname2,frame_num);	%Loads the frames using "loadfram.m"

	[m1,n1]=size(A);

	dot1_3d=calc3d(dot1,cal,alpha,beta,m1,n1);
	dot2_3d=calc3d(dot2,cal,alpha,beta,m1,n1);
	dot3_3d=calc3d(dot3,cal,alpha,beta,m1,n1);

	A=xhair(A,dot1(frame_num,2),dot1(frame_num,1));				%Draws crosshairs on the selected point
	B=xhair(B,dot1(frame_num,4),dot1(frame_num,3));				%using "xhair.m".
	A=xhair(A,dot2(frame_num,2),dot2(frame_num,1));				%Draws crosshairs on the selected point
	B=xhair(B,dot2(frame_num,4),dot2(frame_num,3));				%using "xhair.m".
	A=xhair(A,dot3(frame_num,2),dot3(frame_num,1));				%Draws crosshairs on the selected point
	B=xhair(B,dot3(frame_num,4),dot3(frame_num,3));				%using "xhair.m".

	A=drawbox(A,area1(1,1),dot1(frame_num,2),dot1(frame_num,1));
	A=drawbox(A,area2(1,1),dot2(frame_num,2),dot2(frame_num,1));
	A=drawbox(A,area3(1,1),dot3(frame_num,2),dot3(frame_num,1));
	B=drawbox(B,area1(1,2),dot1(frame_num,4),dot1(frame_num,3));
	B=drawbox(B,area2(1,2),dot2(frame_num,4),dot2(frame_num,3));
	B=drawbox(B,area3(1,2),dot3(frame_num,4),dot3(frame_num,3));

	subplot(2,2,1),imshow(A,map_a);
	title('Camera 1');
	subplot(2,2,2),imshow(B,map_b);
	title('Camera 2');

	subplot(2,2,3),plot3(dot1_3d(1:frame_num,1),dot1_3d(1:frame_num,2),dot1_3d(1:frame_num,3),'y');
	hold on;
	axis('ij');
	plot3(dot2_3d(1:frame_num,1),dot2_3d(1:frame_num,2),dot2_3d(1:frame_num,3),'r');
	plot3(dot3_3d(1:frame_num,1),dot3_3d(1:frame_num,2),dot3_3d(1:frame_num,3),'w');
	xlabel('Y');
	ylabel('X');
	zlabel('Z');
	title('Target Trajectories');
	hold off;

		
	subplot(2,2,4),plot3(dot1_3d(1:frame_num,1),dot1_3d(1:frame_num,2),dot1_3d(1:frame_num,3),'y');
	hold on;
	axis('ij');
	plot3(dot2_3d(1:frame_num,1),dot2_3d(1:frame_num,2),dot2_3d(1:frame_num,3),'r');
	plot3(dot3_3d(1:frame_num,1),dot3_3d(1:frame_num,2),dot3_3d(1:frame_num,3),'w');
	xlabel('Y');
	ylabel('X');
	zlabel('Z');
	[m2 n2]=size(dot1_3d);
	for k=1:frame_num
		plane=[dot1_3d(k,:);dot2_3d(k,:);dot3_3d(k,:);dot1_3d(k,:)];
		fill3(plane(:,1),plane(:,2),plane(:,3),'b');
		end
	hold off;

	truesize(size(A)/2);	
	drawnow;						%Forces MATLAB to draw the picture
	pause;
	fprintf('\nHit any key to continue.\n');
	end