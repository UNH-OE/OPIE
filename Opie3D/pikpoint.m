function [dot1,dot2,dot3]=pikpoint(A,B);
%[dot1,dot2,dot3]=pikpoint(A,B);
%
%Has the user choose the three points in each camera view
%and then returns the coordinates of the dots in the form
%  x1  y1  x2  y2 from cameras 1 and 2

fprintf('\n\nPick the Points from each view.\n');	%Shows the operation being performed
cam_count=1;					%Sets camera counter to 1
dot_count=0;					%Sets dot counter to 1
while cam_count<=2,				%While camera counter is less than or equal to 2

	if cam_count==1				%If it is the first camera view
		if dot_count==0			%If it is the first time through
			C=A;			%Set C = image A
			dot_count=1;		%Increase dot counter to 2
			end
		end

	if cam_count==2				%If it is the second camera view
		if dot_count==0			%If it is the first time through
			C=B;			%Set C = image A
				dot_count=1;		%Increase dot counter to 2
			end
		end

	dummy1='n';										%condition is 'not ok'
	while dummy1~='y',									%While condition is 'not ok'
		fprintf('\nCamera %s: Please pick Dot # %s.\n',int2str(cam_count),int2str(dot_count));	
		imshow(C);									%Show the current image
		title_label=['Camera # ',int2str(cam_count)];					%Text for title
		title(title_label);								%Label as current camera view
		label_label=['Please Choose Dot # ',int2str(dot_count),'.'];			%Text for next line
		xlabel(label_label);								%Label the current dot number
		
		dummy2=input('Do you want to zoom (y/n)? ','s');				%Do you want to zoom
		if dummy2=='y'									%If you want to zoom
			dummy3='n';								%Set condition to false
			while dummy3~='y',							%While condition is false
				imzoom on;							%Turn zoom on
				dummy3=input('Are you done zooming (y/n)? ','s');		%Are you done zooming
				if dummy3=='y'
					imzoom off;						%Turn zoom off
					[y,x,button]=ginput(1);
					imzoom out;
					end
				end

			dummy2='n';								%Set "want to zoom" to 'no'
		else
			[y,x,button]=ginput(1);							%Have user pick point
			end
		x=round(x);
		y=round(y);	
		C1=xhair(C,y,x);								%Puts crosshair at point and
		imshow(C1);									%displays it
		dummy1=input('Is this satisfactory (y/n)? ','s');				%Is this ok
		end

	if dummy1=='y'									%If current selection is satisfactory

		if cam_count==1							%If it is the first camera
			eval(['dot' int2str(dot_count) '(1,1)=x;']);		%Put x in dot'n' (1,1)
			eval(['dot' int2str(dot_count) '(1,2)=y;']);		%Put y in dot'n' (1,2)
			end
		if cam_count==2							%If it is the second camera
			eval(['dot' int2str(dot_count) '(1,3)=x;']);		%Put x in dot'n' (1,3)
			eval(['dot' int2str(dot_count) '(1,4)=y;']);		%Put y in dot'n' (1,4)
			end

		dot_count=dot_count+1;							%Increase the dot counter by 1
		if dot_count > 3							%If on the third dot
			cam_count=cam_count+1;						%Increase camera counter by 1
			if cam_count==2							%If starting the second camera
				dot_count=0;						%Set dot counter for first time through
				end
			end

		end

	end