
clc
clear
cname=input('What is the name of the calibration file?  ','s');
diam=input('What is the diameter of the calibration dot? ');
cfile=[path,cname,'0001.bmp'];
Intensity=input('At what intensity should the calibration begin (0-256)?  ');
dummy1=0;
while dummy1~='y',
	pix=0;
	error=0;
	if dummy1==0
		Zoom='Area of Calibration Circle';
		Zoom
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
		caly=pix/diam;
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
		calx=pix/diam;
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

Answer(1,:)=['The resolution is ',num2str(calx),' (pix/distance) horizontally'];
Answer(2,:)=['              and ',num2str(caly),' (pix/distance) vertically. '];
Answer
