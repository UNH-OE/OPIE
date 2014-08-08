function [area1,area2,area3]=areaint(A,B,map_a,map_b,option)
%[area1,area2,area3]=areaint(A,B,map_a,map_b,option)
%
%Option is a string either saying ['Area of Interest'] or
%['Cross Correlation Area']
%
%Given two images (A and B) and their colormaps (map_a and map_b),
%the function asks the user to define areas of interest or an area
%to be used in a cross correlation for each of the three dots used
%in the analysis.
%
%The area for each dot is returned as 2 by 4 array
%where:
%	Picture 1	
%
%       --------------> (1,1)
%	_______________________________________
%   |   |                                     |
%   |   |                    (1,3)            |
%   |   |              <-------------->       |
%   |   |              ________________       |
%  \/   |           /\ |               |      |
% (1,2) |            | |               |      |
%       |       (1,4)| |               |      |
%       |            | |               |      |
%       |           \/ -----------------      |
%       |                                     |
%       |                                     |
%       ---------------------------------------
%
%	Picture 2	
%
%       --------------> (2,1)
%	_______________________________________
%   |   |                                     |
%   |   |             (2,3)                   |
%   |   |       <----------------->           |
%   |   |       ___________________           |
%  \/   |    /\ |                  |          |
% (2,2) |     | |                  |          |
%       |(2,4)| |                  |          |
%       |     | |                  |          |
%       |    \/ --------------------          |
%       |                                     |
%       |                                     |
%       ---------------------------------------

fprintf('\n\n%s\n',option);			%Shows the operation being performed
dummy1='n';					%Sets condition to false
cam_count=1;					%Sets camera counter to 1
dot_count=0;					%Sets dot counter to 1
while cam_count<=2,				%While camera counter is less than or equal to 2

	if cam_count==1				%If it is the first camera view
		if dot_count==0			%If it is the first time through
			C=A;			%Set C = image A
			map=map_a;		%Set the colormap = map_a
			dot_count=1;		%Increase dot counter to 2
			end
		end

	if cam_count==2				%If it is the second camera view
		if dot_count==0			%If it is the first time through
			C=B;			%Set C = image A
			map=map_b;		%Set the colormap = map_b
			dot_count=1;		%Increase dot counter to 2
			end
		end




	fprintf('\nCamera %s: Dot # %s\n',int2str(cam_count),int2str(dot_count));
	imshow(C,map);									%Show the current image
	title_label=['Camera # ',int2str(cam_count)];					%Text for title
	title(title_label);								%Label as current camera view
	label_label=['Please Choose the ',option,' for Dot # ',int2str(dot_count),'.'];	%Text for next line
	xlabel(label_label);								%Label the current dot number
	[C1,rect]=imcrop;								%Crop image to selected size
	imshow(C1,map);									%Show cropped image
	title_label=['Camera # ',int2str(cam_count)];					%Text for title
	title(title_label);								%Label as current camera view
	label_label=['Is this ',option,' for Dot # ',int2str(dot_count),' satisfactory (y/n)?'];	%Text for next line
	xlabel(label_label);								%Ask if OK with dot number
	drawnow;									%Forces MATLAB to draw picture
	dummy1=input('Is this satisfactory (y/n)? ','s');

	if dummy1=='y'									%If current selection is satisfactory

		rect=round(rect);							%Rounds the elements of rect to whole numbers

		rect(1,3)=2*round(rect(1,3)/2)-1;					%Forces the size of the area of intrest
		rect(1,4)=2*round(rect(1,4)/2)-1;					%to be an odd number. This forces the AOI
											%to have an even number of rows and columns
											%which is useful later in "opiecorr".

		eval([ 'area' int2str(dot_count) '(' int2str(cam_count) ',:)=rect;' ]);	%This line evaluates the command 
											%inside. Putting the coordinates
											%from 'rect' in the proper rows.

		dot_count=dot_count+1;							%Increase the dot counter by 1
		if dot_count > 3							%If on the third dot
			cam_count=cam_count+1;						%Increase camera counter by 1
			if cam_count==2							%If starting the second camera
				dot_count=0;						%Set dot counter for first time through
				end
			end

		end
	end




