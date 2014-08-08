clear
choice=0;
while choice~=5,
	clc
	fprintf('\n\n1)  Enter a new file name?\n2)  Calibrate\n');
	fprintf('3)  Find an angle?\n4)  Find a distance?\n5)  Quit');
	choice=input('? ');


	if choice==1
		file=input('What is the file name? ','s');
		file_name=['C:\matlab\bin\video\',file,'.bmp'];
		[B,map]=bmpread(file_name);
		imshow(B,map)
		end


	if choice==2
		cname=input('What is the name of the calibration file?  ','s');
		cfile=['C:\matlab\bin\video\',cname,'0001.bmp'];
		diam=input('What is the diameter of the calibration circle? ');
		Intensity=input('At what intensity should the calibration begin (0-256)?  ');
		dummy1=0;
		while dummy1~='y',
			pix=0;
			error=0;
			if dummy1==0
				fprintf('\nZoom in to the area of the Calibration Circle');
				[A,map]=bmpread(cfile);
				imshow(A,map);
				[C,rect]=imcrop;
				A=C;
			else
				C=A;
				end
			j=1;
			while j<=rect(1,3),
				i=1;
				p=0;
				while i<=rect(1,4),
					if C(i,j)<=Intensity
						p=p+1;
						C(i,j)=0;
						end
					i=i+1;
					end
				if p>pix
					pix=p;
					col=j;
					end
				j=j+1;
				end
			if pix==0
				error=1;
			else
				caly=diam/pix;
				end
			pix=0;
			i=1;
			while i<=rect(1,4),
				j=1;
				p=0;
				while j<=rect(1,3),
					if C(i,j)<=Intensity
						p=p+1;
						C(i,j)=0;
						end
					j=j+1;
					end
				if p>pix
					pix=p;
					row=i;
					end
				i=i+1;
				end
			if pix==0
				error=1;
			else
				calx=diam/pix;
				end
			if error==0
				C(row,1)=256;
				C(1,col)=256;
			else
				error='No pixels are that low an intensity.  Try a higher number.';
				error
				end		
			imshow(C,map);
			drawnow;
			dummy1=input('Is this calibration correct (y/n)?  ','s');
			if dummy1=='y' | isempty(dummy1)
				break
				end
			Intensity
			Intensity=input('What is the new intensity value (0-256)?  ');
			end
		end


	if choice==3
		imshow(B,map)
		dummy1='n';
		imzoom on;
		dummy1=input('When you are done zooming type [y] and press [Enter]  ','s');
		if dummy1 == 'y'
			imzoom off;
			[x1,y1,button] = ginput(1);
			imzoom out;
			end
		dummy1='n';
		imzoom on;
		dummy1=input('When you are done zooming type [y] and press [Enter]  ','s');
		if dummy1 == 'y'
			imzoom off;
			[x2,y2,button] = ginput(1);
			imzoom out;
			end
		imzoom off;
		theta=abs(atan(((y1-y2)*caly)/((x1-x2)*calx))*180/pi);
		fprintf('\nThe angle is %5f degrees from horizontal.\n',theta);
		fprintf('Press any key when ready.');
		pause;
		end


	if choice==4
		imshow(B,map)
		dummy1='n';
		imzoom on;
		dummy1=input('When you are done zooming type [y] and press [Enter]  ','s');
		if dummy1 == 'y'
			imzoom off;
			[x1,y1,button] = ginput(1);
			imzoom out;
			end
		dummy1='n';
		imzoom on;
		dummy1=input('When you are done zooming type [y] and press [Enter]  ','s');
		if dummy1 == 'y'
			imzoom off;
			[x2,y2,button] = ginput(1);
			imzoom out;
			end
		imzoom off;
		distance=sqrt(((x1-x2)*calx)^2+((y1-y2)*caly)^2);
		fprintf('\nThe distance between the points is %5f.\n',distance);
		fprintf('Press any key when ready.');
		pause;
		end
		
	end
