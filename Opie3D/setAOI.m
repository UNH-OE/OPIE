function [area1,area2,area3]=setAOI(A,B,dot1,dot2,dot3)
%[area1,area2,area3]=setAOI(A,B,dot1,dot2,dot3)
%
%Asks the user to specify the size of the area of intrest.
%The area is returned as a 1 by 2 where the size of the
%dot 1, camera1 area of intrest is stored in (1,1) and
%the dot 1, camera1 area of intrest is stored in (1,2).
%
%The areas of intrests are square and measured in pixels.
%They are centered on the position of the cuurent dot in the
%current view.

dummy1=0;
dummy2=0;
camera_count=1;
dot_count=0;
while dummy1==0,

	if dot_count == 0
		if camera_count==1
			C=A;
			end
		if camera_count==2
			C=B;
			end
		dot_count=1;
		end

	fprintf('\nCamera %s:  Dot # %s.\n',int2str(camera_count),int2str(dot_count));

	if dummy2==0

		n=input('What should the size of the area of intrest be (pixels)? ');
		dummy2=1;

	else
		C1=C;

		if camera_count==1
			eval(['x=dot' int2str(dot_count) '(1,1);']);
			eval(['y=dot' int2str(dot_count) '(1,2);']);
			end
		if camera_count==2
			eval(['x=dot' int2str(dot_count) '(1,3);']);
			eval(['y=dot' int2str(dot_count) '(1,4);']);
			end

		C1=drawbox(C1,n,y,x);


	
		imshow(C1);
		title_label=['Camera # ',int2str(camera_count),':  Dot # ',int2str(dot_count)];	%Text for title
		title(title_label);								%Label as current camera view

		fprintf('\nThe area of intrest is currently %g.\n',n);
		n=input('What should the new value be ([Enter] if ok)? ');
		end




	if isempty(n)==1

		eval(['area' int2str(dot_count) '(1,' int2str(camera_count) ')=n1;']);
		dot_count=dot_count+1;
		dummy2=0;

		if dot_count > 3
			camera_count=camera_count+1;
			dot_count=0;
			if camera_count==3
				break;
				end
			end


	else
		n1=n;

		end


	end