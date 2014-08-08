
dummy1=0;						%Set condition to false
while dummy1==0,					%While condition is false
	dummy1=1;					%Set condition to true


	fprintf('\nWhat path and directory are the video and calibration files in? (ie c:\\matlab\\bin\\video\\)');
	pth=input('? ','s');

	fname=input('What is the file name for the frames (four char max)?  ','s');
	

	if dummy1 ~= 0										%If the condition is not already false
		if chekfile(pth,[fname,'_1.bmp'])==0 						%If either of the files does not exist (uses "chekfile.m")
			fprintf('The file %s%s_1.bmp does not exist please re-enter the path and file name.\n',pth,fname);
			dummy1=0;								%Set condition to true
			end
		end

	end



dummy1=0;						%Set condition to false
while dummy1==0,					%While condition is false
	dummy1=1;					%Set condition to true
	frame_start=input('What frame should the analysis begin with (Default is 1)?  ');
	if isempty(frame_start)==1,			%if the answer to above question is Enter
		frame_start=1;				%set frame_start to 1
		end

	frame_end=input('What frame should the analysis end with?  ');

	if frame_start >= frame_end,			%if the begining frame is greater than or equal to the end frame
		fprintf('\nThe begining frame number must be less than the ending frame number.\n');	%re-enter the answers
		dummy1=0;				%sets the condition to re-enter the loop
		end
	end

frames_per_sec=input('What is the sampling rate (frames per second)? ');

%d1=input('What is the distance from Camera 1 to the target? ');
%d2=input('What is the distance from Camera 2 to the target? ');
%d3=input('What is the distance from Camera 1 to Camera 2? ');
%[alpha,beta,gamma]=lawofcos(d2,d1,d3);
%alpha=alpha-pi/2;
%beta=beta-pi/2;



%Defining Areas of Interest


[A,B]=loadfram(pth,fname,frame_start);			%Loads the first frame using "loadfram.m"

fprintf('\nPlease pick the points in a clock-wise direction.\n');
[dot1,dot2,dot3]=pikpoint(A,B);				%Has the user pick the points from the first frame

[area1,area2,area3]=setAOI(A,B,dot1,dot2,dot3);		%Obtains user defined areas of interest using "areaint.m"

xareaC1=getAOI(A,area1(1,1),dot1(1,1:2));		%Extracts the area of intrest from the image
xareaC2=getAOI(A,area2(1,1),dot2(1,1:2));		%Extracts the area of intrest from the image
xareaC3=getAOI(A,area3(1,1),dot3(1,1:2));		%Extracts the area of intrest from the image
xareaD1=getAOI(B,area1(1,2),dot1(1,3:4));		%Extracts the area of intrest from the image
xareaD2=getAOI(B,area2(1,2),dot2(1,3:4));		%Extracts the area of intrest from the image
xareaD3=getAOI(B,area3(1,2),dot3(1,3:4));		%Extracts the area of intrest from the image

C=A;
D=B;