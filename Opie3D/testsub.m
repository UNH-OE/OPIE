clear
clc

pth=['d:\fishfarm\'];
fname1=['np06'];
cal_file_1=['c06'];
frame_end=190;

frame_start=1;
fname2=fname1;
cal_file_2=cal_file_1;

[cal1xc,cal1yc,cal2xc,cal2yc] = cal3d (cal_file_1,cal_file_2,pth);	%Calibrates using "cal3d.m"
cal=[cal1xc cal1yc cal2xc cal2yc];

[A,B,map_a,map_b]=loadfram(pth,fname1,fname2,frame_start);		%Loads the first frame using "loadfram.m"
[dot1,dot2,dot3]=pikpoint(A,B,map_a,map_b);				%Has the user pick the points from the first frame
[area1,area2,area3]=setAOI(A,B,map_a,map_b,dot1,dot2,dot3);		%Obtains user defined areas of interest using "areaint.m"
xareaC1=getAOI(A,area1(1,1),dot1(1,1:2));		%Extracts the area of intrest from the image
xareaC2=getAOI(A,area2(1,1),dot2(1,1:2));		%Extracts the area of intrest from the image
xareaC3=getAOI(A,area3(1,1),dot3(1,1:2));		%Extracts the area of intrest from the image
xareaD1=getAOI(B,area1(1,2),dot1(1,3:4));		%Extracts the area of intrest from the image
xareaD2=getAOI(B,area2(1,2),dot2(1,3:4));		%Extracts the area of intrest from the image
xareaD3=getAOI(B,area3(1,2),dot3(1,3:4));		%Extracts the area of intrest from the image


C=A;
D=B;
for frame_num=2:1:frame_end-frame_start+1,				%For k from "Starting Frame" to "Ending Frame"

	[A,B,map_a,map_b]=loadfram(pth,fname1,fname2,frame_num+frame_start-1);	%Loads the frames using "loadfram.m"

	xareaA1=getAOI(A,area1(1,1),dot1(frame_num-1,1:2));		%Extracts the area of intrest from the image
	xareaA2=getAOI(A,area2(1,1),dot2(frame_num-1,1:2));		%Extracts the area of intrest from the image
	xareaA3=getAOI(A,area3(1,1),dot3(frame_num-1,1:2));		%Extracts the area of intrest from the image
	xareaB1=getAOI(B,area1(1,2),dot1(frame_num-1,3:4));		%Extracts the area of intrest from the image
	xareaB2=getAOI(B,area2(1,2),dot2(frame_num-1,3:4));		%Extracts the area of intrest from the image
	xareaB3=getAOI(B,area3(1,2),dot3(frame_num-1,3:4));		%Extracts the area of intrest from the image


	xarea_C1=makesame(xareaA1,xareaC1);		%Makes them the same size by padding the new argument with zeros
	xarea_C2=makesame(xareaA2,xareaC2);
	xarea_C3=makesame(xareaA3,xareaC3);


	xarea_D1=makesame(xareaB1,xareaD1);		%Makes them the same size by padding the new argument with zeros
	xarea_D2=makesame(xareaB2,xareaD2);
	xarea_D3=makesame(xareaB3,xareaD3);
	
	[corr_11,corr_12,corr_13]=opiecorr(xareaA1,xareaA2,xareaA3,xarea_C1,xarea_C2,xarea_C3);
								%Cross correlates area'n' with xcorr'n' in frame A
								%and returns corr_1'n'.  Uses "opiecorr.m"
	[corr_21,corr_22,corr_23]=opiecorr(xareaB1,xareaB2,xareaB3,xarea_D1,xarea_D2,xarea_D3);
								%Cross correlates area'n' with xcorr'n' in frame A
								%and returns corr_2'n'.  Uses "opiecorr.m"	


	for j=1:2
		for i=1:3
			i1=int2str(i);
			j1=int2str(j);
			k=int2str(frame_num);
			eval(['dot' i1 '=getdot(dot' i1 ',corr_' j1 i1 ',' k ',' j1 ',' i1 ');']);
			end
		end



	xarea_C1=xareaA1;
	xarea_C2=xareaA2;
	xarea_C3=xareaA3;
	xarea_D1=xareaB1;
	xarea_D2=xareaB2;
	xarea_D3=xareaB3;

	fprintf('\nFrame %g\n',frame_num+frame_start-1);				%Prints the current frame number
	drawnow;

	C=A;	
	D=B;

	A=xhair(A,dot1(frame_num,2),dot1(frame_num,1));				%Draws crosshairs on the selected point
	A=xhair(A,dot1(frame_num,4),dot1(frame_num,3));				%using "xhair.m".
	A=xhair(A,dot2(frame_num,2),dot2(frame_num,1));				%Draws crosshairs on the selected point
	A=xhair(A,dot2(frame_num,4),dot2(frame_num,3));				%using "xhair.m".
	A=xhair(A,dot3(frame_num,2),dot3(frame_num,1));				%Draws crosshairs on the selected point
	A=xhair(A,dot3(frame_num,4),dot3(frame_num,3));				%using "xhair.m".

	A=drawbox(A,area1(1,1),dot1(frame_num-1,2),dot1(frame_num-1,1));
	A=drawbox(A,area2(1,1),dot2(frame_num-1,2),dot2(frame_num-1,1));
	A=drawbox(A,area3(1,1),dot3(frame_num-1,2),dot3(frame_num-1,1));
	A=drawbox(A,area1(1,2),dot1(frame_num-1,4),dot1(frame_num-1,3));
	A=drawbox(A,area2(1,2),dot2(frame_num-1,4),dot2(frame_num-1,3));
	A=drawbox(A,area3(1,2),dot3(frame_num-1,4),dot3(frame_num-1,3));


	subplot(1,1,1),imshow(A,map_a);
	truesize(size(A));	
	drawnow;						%Forces MATLAB to draw the picture
	end

for k=1:frame_end-frame_start+1,
	dot1(k,:)=dot1(k,:).*cal;
	dot2(k,:)=dot2(k,:).*cal;
	dot3(k,:)=dot3(k,:).*cal;
	end

for i=1:8
	d(i,:)=dot1(i,:)-dot1(i+1,:);
	end

figure;
plot(dot1(:,2),dot1(:,1),dot1(:,4),dot1(:,3),dot2(:,2),dot2(:,1),dot2(:,4),dot2(:,3),dot3(:,2),dot3(:,1),dot3(:,4),dot3(:,3));
axis('ij');