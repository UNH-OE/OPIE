global rect;

if l=='select'
	if l1==1
		imshow(A,map);
		end
	imzoom;
	end

if l=='filter'
	imzoom off;
	pix=0;
	error=0;
	if l2==1
		rect=axis;
		C=imcrop(A,[rect(1,1),rect(1,3),rect(1,2)-rect(1,1),rect(1,4)-rect(1,3)]);
		end
	dark;
	end


	
