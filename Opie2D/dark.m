%calibration calculations

j=1;
D1=C;
Intensity=get(Inten_val,'Value');
	while j<=rect(1,2)-rect(1,1),
		i=1;
		p=0;
		while i<=rect(1,4)-rect(1,3),
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
	while i<=rect(1,4)-rect(1,3),
		j=1;
		p=0;
		while j<=rect(1,2)-rect(1,1),
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
	end
C=D1;
cal(1)=calx;
cal(2)=caly;
cal(3)=calx;
cal(4)=caly;