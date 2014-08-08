function [cal1x,cal1y,cal2x,cal2y]=cal3d(pth,file)
%[cal1x,cal1y,cal2x,cal2y]=cal3d(pth,file)
%
%For use with OPIE-3D Software
%
%This takes the name of the calibration file, file, and
%its given path, pth, and returns the calibration factors in inches/pixel
%or meters/pixel depending on what measurement is given for the diameter
%of the calibration circle.


calibration_diameter=input('What is the diameter of the calibration ball? ');
calibration_units=input('What are the units of the above measurement? ','s');

calibration_file=[pth,file,'_1.bmp'];			%Sets up file name for use in bmpread

new_image =imread(calibration_file,'bmp');		%Reads in the images

m=484;
X=new_image(1:m,1:645);					%Extracts the first m by n chunk from the new image.
Y=new_image(1:m,646:1292);				%Extracts the second m by n chunk from the new image.
							%The numbers in the arguments were determined by looking
							%at the images and getting the dimensions from them.  It
							%would prove beneficial to get the system more automated
							%so that the progrma used the m by n method.


%Selection of area to be analyzed

dummy1=0;			%Sets condition to false
dummy2=1;			%Set Counter to 1 (To look at the first calibration image)
while dummy1==0,		%While condition is false

	fprintf('\nPlease choose the area which includes the calibration circle.\n');

	if dummy2==1				%If the counter is on 1 (first calibration frame)
		imshow(X);			%Show first calibration image
		title('Calibration Picture from First Camera');
		[X1,rect1]=imcrop;		%User defines the area including the calibration ball
		imshow(X1);			%Show cropped calibration image
		title('Cropped Image from First Camera');
		end

	if dummy2==2				%If the counter is on 2 (second calibration frame)
		imshow(Y);			%Show second calibration frame
		title('Calibration Picture from Second Camera');
		[Y1,rect2]=imcrop;		%User defines the area including the calibration ball
		imshow(Y1);			%Show cropped calibration image
		title('Cropped Image from Second Camera');
		end

	dummy3=input('Is this area satisfactory (y/n)? ','s');
	
	if dummy3=='y'				%If the user is satisfied
		dummy2=dummy2+1;		%Set the counter up one
		end		

	if dummy2==3
		if dummy3=='y'			%If the user is satisfied with the second selection
			break;			%Exit loop
			end
		end
	end



%Spatial calibration

dummy1=0;							%Set condition to false
dummy2=1;
dummy3=1;
while dummy1==0,						%While condition is false

	if dummy2==2
		imshow(C);								%Shows the cropped image
		drawnow;								%Forces the computer to show the image
		fprintf('\nThe intensity is currently %g.',intensity);			%Shows the current intensity setting
		intensity=input('What should the new intensity setting be (0-256 or [Enter] if OK)?');	%Sets new intensity level
		end											%or sets condition to exit
											

	if dummy2==1						%True at the begining of each frames calibration
		intensity=input('At what intensity should the calibration begin (0-256)? ');	%Sets the initial search criteria
		dummy2=2;					%Tells that it is not the first time through
		end

	if isempty(intensity)==1				%If calibration is OK
		dummy2=1;					%Reset to show first time through
		end

	if dummy3==1						%If the first calibration 
		C=X1;						%Set C = cropping of first picture
		[m,n]=size(C);					%Get size of cropped image (m is # rows,n is # cols)
		if isempty(intensity)==1				%If this calibration is done
			cal1x=calibration_diameter/max_pix_in_row;	%Calculate the x-calibration for camera 1
			cal1y=calibration_diameter/max_pix_in_col;	%Calculate the y-calibration for camera 1
			end
		end

	if dummy3==2						%If the second calibration
		C=Y1;						%Set C = cropping of second picture
		[m,n]=size(C);					%Get size of cropped image (m is # rows,n is # cols)
		if isempty(intensity)==1				%If this calibration is done
			cal2x=calibration_diameter/max_pix_in_row;	%Calculate the x-calibration for camera 2
			cal2y=calibration_diameter/max_pix_in_col;	%Calculate the y-calibration for camera 2
			end
		end

	if isempty(intensity)==1				%If the calibration is ok
		dummy3=dummy3+1;				%Increase counter by 1
		if dummy3==3					%If counter shows second calibration is done
			break;					%Exit loop
			end
		end


	max_pix_in_row=0;					%Set maximum # of pixels in a row to 0
	for i=1:m,						%For all of the rows
		pixel_count=0;					%Set pixel counter to 0
		for j=1:n,					%For all of the columns
			if C(i,j)<=intensity			%If the matrix element is less than intensity setting
				pixel_count=pixel_count+1;	%Increase pixel counter by 1
				C(i,j)=0;			%Change matrix element to black
				end
			end

		if pixel_count>max_pix_in_row			%If the pixel counter is greater than the max # of pixels in row
			max_pix_in_row=pixel_count;		%Set max # of pixels in row to pixel counter
			row=i;					%Record the row of this occurence
			end
		end

	max_pix_in_col=0;					%Set maximum # of pixels in a column to 0
	for j=1:n,						%For all of the columns
		pixel_count=0;					%Set pixel counter to 0
		for i=1:m,					%For all of the rows
			if C(i,j)<=intensity			%If matrix element is less than the intensity setting
				pixel_count=pixel_count+1;	%Increase pixel counter by 1
				end
			end

		if pixel_count>max_pix_in_col			%If the pixel counter is larger than the max # of pixels in columm
			max_pix_in_col=pixel_count;		%Set max # of pixels in column to pixel counter
			col=j;					%Record the column of this occurence
			end
		end

	if max_pix_in_row==0					%If there are no pixels of that low an intensity
		if isempty(intensity)==0			%If the user is not done this calibration
			fprintf('\nNo pixels have that low an intensity.  Please try a higher number.');
			end
	else
		C(row,1)=256;					%Indicates the row with the most qualifiing pixels with a white dot
		C(1,col)=256;					%Indicates the column with the most qualifiing pixels with a white dot
		end

end
