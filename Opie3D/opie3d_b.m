%
%
%
%
%					OPIE-3D 
%		Optical Positioning Instrumentation and Evaluation
%				UNH-Ocean Engineering
%
%
%
%




clear							%Clears all variables in memory
clc							%Clears the screen
close(gcf);


fprintf('|------------------------------------------------------------------------|\n');
fprintf('|                                                                        |\n');
fprintf('|           O       PPP       III        EEE        333    DDD           |\n');
fprintf('|          O O      P  P       I         E             3   D  D          |\n');
fprintf('|         O   O     PPP        I         EEE    --    33   D   D         |\n');
fprintf('|          O O      P          I         E             3   D  D          |\n');
fprintf('|           O       P         III        EEE        333    DDD           |\n');
fprintf('|                                                                        |\n');
fprintf('|                                                                        |\n');
fprintf('|          3-D OPTICAL POSITIONING INSTRUMENTATION & EVALUATION          |\n');
fprintf('|                                                                        |\n');
fprintf('|                                                                        |\n');
fprintf('|            UNIVERSITY OF NEW HAMPSHIRE, OCEAN ENGINEERING              |\n');
fprintf('|                               1998                                     |\n');
fprintf('|                                                                        |\n');
fprintf('|------------------------------------------------------------------------|\n\n\n');




dummy=input('Do you want to run OPIE-3D from an input file (y/n)?','s');

if dummy=='y'
	input_file=input('What is the path and name of the input file?','s');
	eval(['load ' input_file ' -mat']);
else
	getinput;
	dummy=input('Do you want to create an input file (y/n)?','s');
	if dummy~='n'
		input_file=input('What should the name of the input file be?','s');
		makeinp;
		end
	end
 





%Analysis
t(1)=0;
tic;
for frame_num=2:1:frame_end-frame_start+1,				%For k from "Starting Frame" to "Ending Frame"

	[A,B]=loadfram(pth,fname,frame_num+frame_start-1);		%Loads the frames using "loadfram.m"

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

	[m1,n1]=size(A);
   
   if frame_num==2
      dot1_3d(1,:)=calc3d(dot1(1,:),cal,alpha,beta,m1,n1);
		dot2_3d(1,:)=calc3d(dot2(1,:),cal,alpha,beta,m1,n1);		%These lines get the 3-d position from the first frame
      dot3_3d(1,:)=calc3d(dot3(1,:),cal,alpha,beta,m1,n1);
      point_track(1,:)=objtrack(dot1_3d(1,:),dot2_3d(1,:),dot3_3d(1,:),userpoint);
      [pitch(1),roll(1),yaw(1)]=PRY(dot1_3d(1,:),dot2_3d(1,:),dot3_3d(1,:));
      end
      
   
   dot1_3d(frame_num,:)=calc3d(dot1(frame_num,:),cal,alpha,beta,m1,n1);
	dot2_3d(frame_num,:)=calc3d(dot2(frame_num,:),cal,alpha,beta,m1,n1);
	dot3_3d(frame_num,:)=calc3d(dot3(frame_num,:),cal,alpha,beta,m1,n1);
	point_track(frame_num,:)=objtrack(dot1_3d(frame_num,:),dot2_3d(frame_num,:),dot3_3d(frame_num,:),userpoint);
   [pitch(frame_num),roll(frame_num),yaw(frame_num)]=PRY(dot1_3d(frame_num,:),dot2_3d(frame_num,:),dot3_3d(frame_num,:));
   
	C=A;	
	D=B;
	t(frame_num)=t(frame_num-1)+1/frames_per_sec;
	end
toc




figure(2);
plot3(dot1_3d(:,1),dot1_3d(:,2),dot1_3d(:,3));
h=gca;
set(h,'Color',[.8 .8 .8]);
axis('ij');
xlabel('X');
ylabel('Y');
zlabel('Z');

figure(3);
plot3(dot2_3d(:,1),dot2_3d(:,2),dot2_3d(:,3));
h=gca;
set(h,'Color',[.8 .8 .8]);
axis('ij');
xlabel('X');
ylabel('Y');
zlabel('Z');

figure(4);
plot3(dot3_3d(:,1),dot3_3d(:,2),dot3_3d(:,3));
h=gca;
set(h,'Color',[.8 .8 .8]);
axis('ij');
xlabel('X');
ylabel('Y');
zlabel('Z');

figure(5);
plot3(dot1_3d(:,1),dot1_3d(:,2),dot1_3d(:,3),'y');
hold on;
h=gca;
set(h,'Color',[.8 .8 .8]);
axis('ij');
plot3(dot2_3d(:,1),dot2_3d(:,2),dot2_3d(:,3),'r');
plot3(dot3_3d(:,1),dot3_3d(:,2),dot3_3d(:,3),'w');
xlabel('X');
ylabel('Y');
zlabel('Z');
for k=1:length(dot1_3d)
	plane=[dot1_3d(k,:);dot2_3d(k,:);dot3_3d(k,:);dot1_3d(k,:)];
	fill3(plane(:,1),plane(:,2),plane(:,3),'b');
	end
hold off;

figure(6);
subplot(3,3,1);plot(t,dot1_3d(:,1)-mean(dot1_3d(:,1)));title('Surge');
subplot(3,3,2);plot(t,dot1_3d(:,2)-mean(dot1_3d(:,2)));title('Sway');
subplot(3,3,3);plot(t,dot1_3d(:,3)-mean(dot1_3d(:,3)));title('Heave');
subplot(3,3,4);plot(t,dot2_3d(:,1)-mean(dot2_3d(:,1)));title('Surge');
subplot(3,3,5);plot(t,dot2_3d(:,2)-mean(dot2_3d(:,2)));title('Sway');
subplot(3,3,6);plot(t,dot2_3d(:,3)-mean(dot2_3d(:,3)));title('Heave');
subplot(3,3,7);plot(t,dot3_3d(:,1)-mean(dot3_3d(:,1)));title('Surge');
subplot(3,3,8);plot(t,dot3_3d(:,2)-mean(dot2_3d(:,2)));title('Sway');
subplot(3,3,9);plot(t,dot3_3d(:,3)-mean(dot3_3d(:,3)));title('Heave');

figure(7);
subplot(2,3,1);plot(t,point_track(:,1)-mean(point_track(:,1)));title('Surge');
subplot(2,3,2);plot(t,point_track(:,2)-mean(point_track(:,2)));title('Sway');
subplot(2,3,3);plot(t,point_track(:,3)-mean(point_track(:,3)));title('Heave');
subplot(2,3,4);plot(t,pitch-mean(pitch));title('Pitch');
subplot(2,3,5);plot(t,roll-mean(roll));title('Roll');
subplot(2,3,6);plot(t,yaw-mean(yaw));title('Yaw');



clear dummy1 A B C D map k xareaA1 xareaA2 xareaA3 ans
clear xareaB1 xareaB2 xareaB3 xareaC1 xareaC2 xareaC3 xareaD1 xareaD2 xareaD3
clear xarea_C1 xarea_C2 xarea_C3 xarea_D1 xarea_D2 xarea_D3 corr_11 corr_12 corr_13
clear corr_21 corr_22 corr_23