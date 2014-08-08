function area=setAOI2D(C,dots)
%area=setAOI2D(C,dots)
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
while dummy1==0,

	if dummy2==0

		n=input('What should the size of the area of intrest be (pixels)? ');
		dummy2=1;

	else
		C1=C;

		x1=dots(1,1);
		y1=dots(1,2);
		x2=dots(1,3);
		y2=dots(1,4);

		C1=drawbox(C1,n,x1,y1);
		C1=drawbox(C1,n,x2,y2);
	
		imshow(C1);
		fprintf('\nThe area of intrest is currently %g.\n',n);
		n=input('What should the new value be ([Enter] if ok)? ');
		end




	if isempty(n)==1
		area=n1;
		break;
	else
		n1=n;
		end


	end