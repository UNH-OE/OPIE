clear
clc
fprintf('What path and directory are the files in? (ie c:\\matlab\\bin\\video\\)');
pth=input('? ','s');
fname=input('What is the name of the file?  ','s');
f=input('How many frames should be analyzed?  ');
fps=input('What is the sampling rate (Frames/sec)?  ');
diam=input('What is the diameter of the calibration circle?  ');
units=input('What are the units of the diameter?  ','s');
numpnt=2;
t(1)=0;




%Calibration
cname=input('What is the name of the calibration file?  ','s');
cfile=[pth,cname,'.bmp'];
Intensity=input('At what intensity should the calibration begin (0-256)?  ');
dummy1=0;
while dummy1~='y',
	pix=0;
	error=0;
	if dummy1==0
		fprintf('\nZoom in to the area of the Calibration Circle\n');
		A=imread(cfile,'bmp');
		imshow(A);
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
	imshow(C);
	drawnow;
	dummy1=input('Is this calibration correct (y/n)?  ','s');
	if dummy1=='y' | isempty(dummy1)
		break
		end
	Intensity
	Intensity=input('What is the new intensity value (0-256)?  ');
	end
cal(1)=calx;
cal(2)=caly;
cal(3)=calx;
cal(4)=caly;





%Frame Analysis


for k=1:f,

	file=[pth,fname,'_',int2str(k),'.bmp'];
	A=imread(file,'bmp');
	[m,n]=size(A);
	
   
   
%Pick the Points
	if k==1
		fprintf('\nYou will have to pick two points to follow.\n');
		dummy4=1;
		end
	fprintf('\nFrame %.0f\t%s\n',k,file);
	dummy1='n';
	dummy4=1;
	while k<=1 & dummy1=='n',
		imshow(A);
		dummy2=input('Do you want to zoom to the point (y/n)?  ','s');
		if dummy2=='y'
			imzoom on;
			dummy3=input('When you are finished zooming press (y) then Return.  ','s');
			if dummy3=='y'
				imzoom off;
				end
			end

		[x(dummy4),x(dummy4+1)]=ginput(1);						%x(odd)=x-direction
																			%x(even)=y-direction
		C=A;
		C=xhair(C,x(dummy4),x(dummy4+1));
		imshow(C);
		dummy1=input('Is this point satisfactory (y/n)?  ','s');
		if dummy1=='y' & dummy4<2*numpnt-1
			dummy4=dummy4+2;
			dummy1='n';
			end
		end

	if k==1
		B(1,:)=round(x);
      xref=B(1,:);
      d=setAOI2d(A,B(1,:));
      xareaC=getAOI(A,d,[B(1,1),B(1,2)]);		%Extracts the area of intrest from the image
	   xareaD=getAOI(A,d,[B(1,3),B(1,4)]);		%Extracts the area of intrest from the image

	else
      
      
      
      
%Gets predicted values
		b=B(k-1,:);
	
		
 %Finds points 
      count=1;
		while count<=2*numpnt-1,
			j=b(count)-d/2;
			min=256;
			while j<=b(count)+d/2 & j<=n & j>=1,
				i=b(count+1)-d/2;
				while i<=b(count+1)+d/2 & i<=m & i>=1,
					rad=sqrt((b(count)-j)^2+(b(count+1)-i)^2);
					if rad<=d/2 & A(round(i),round(j))<min
						x(count)=round(j);
						x(count+1)=round(i);
						min=A(round(i),round(j));
						end
					i=i+1;
					end
				j=j+1;
				end
			B(k,count)=round(x(count));
			B(k,count+1)=round(x(count+1));
			if count==2
				d=d/k+sqrt((B(k,3)-B(k,1))^2+(B(k,4)-B(k,2))^2)/k;
				dact=dact/k+sqrt(((B(k,3)-B(k,1))*calx)^2+((B(k,4)-B(k,2))*caly)^2)/k;
				end
			count=count+2;
			end		
      end



%Shows location of point
	count=1;
	C=A;
   C=xhair(C,round(B(k,1)),round(B(k,2)));
   C=xhair(C,round(B(k,3)),round(B(k,4)));
	C=drawbox(C,d,round(B(k,1)),round(B(k,2)));
	C=drawbox(C,d,round(B(k,3)),round(B(k,4)));
	imshow(C);
	drawnow;
	t(k,1)=(k-1)/fps;
	k=k+1;
	end



%Calculations and Plots
for k=1:f
	for count=1:4
		B(k,count)=B(k,count)*cal(count);
		end
	end

for k=1:f
	for count=1:4
		D(k,count)=B(k,count)-xref(count)*cal(count);
		end
	end

for count=1:4
	vel(1,count)=(B(2,count)-B(1,count))*fps;
	end

for k=2:1:f
	for count=1:1:4
		vel(k,count)=(B(k,count)-B(k-1,count))*fps;
		if k==3
			accel(1,count)=(vel(3,count)-vel(2,count))*fps;
			accel(2,count)=(vel(3,count)-vel(2,count))*fps;
			end
		if k>=3
			accel(k,count)=(vel(k,count)-vel(k-1,count))*fps;
			end
		end
	end
for k=1:f
	veltot1(k)=sqrt(vel(k,1)^2+vel(k,2)^2);
	veltot2(k)=sqrt(vel(k,3)^2+vel(k,4)^2);
	acctot1(k)=sqrt(accel(k,1)^2+accel(k,2)^2);
	acctot2(k)=sqrt(accel(k,3)^2+accel(k,4)^2);
	end

theta_ref=atan2(-1*(xref(4)-xref(2))*cal(1,2),(xref(3)-xref(1))*cal(1,1));
theta=atan2(-1*(B(:,4)-B(:,2)),(B(:,3)-B(:,1)))-theta_ref;


omega(1)=(theta(2)-theta(1))*fps;

for k=2:f
	omega(k)=(theta(k)-theta(k-1))*fps;
	if abs(omega(k)) > pi*fps
		if theta(k) <0 & theta(k-1) > 0
			omega(k)=(2*pi+theta(k)-theta(k-1))*fps;
		elseif theta(k) > 0 & theta(k-1) < 0
			omega(k)=(theta(k)-(2*pi+theta(k-1)))*fps;
			end
		end
	end


alpha(1)=(omega(3)-omega(2))*fps;
alpha(2)=(omega(3)-omega(2))*fps;

for k=3:f
	alpha(k)=(omega(k)-omega(k-1))*fps;
	end

figure
plot(B(:,1),B(:,2),'-',B(:,3),B(:,4),'-');
axis([0,n*cal(1),0,m*cal(2)]);
axis('ij');
title('Position in Frame');
xaxis=['Position (',units,')  Yell = 1  Purp = 2'];
xlabel(xaxis);
yaxis=['Position (',units,')'];
ylabel(yaxis);


figure
t2(:,1)=t;
t2(:,2)=t;
h=axes('ydir','reverse','zdir','reverse');
axis([0,n*cal(1),0,t(f),0,m*cal(2)]);
axes(h);
hold on;
plot3(B(:,1),t,B(:,2),'g',B(:,3),t,B(:,4),'r');
for k=1:f
	plot3(B(k,1:2:3),t2(k,:),B(k,2:2:4),'b');
	end
hold off;
title('Marker Paths    Green = 1 Red = 2');
xaxis=['Position (',units,')'];
xlabel(xaxis);
yaxis=['Time (sec)'];
ylabel(yaxis);
zaxis=['Position (',units,')'];
zlabel(zaxis);

figure
plot(t(:),D(:,1),t(:),D(:,2),t(:),D(:,3),t(:),D(:,4));
axis('xy');
title('Displacement from Equilibrium');
xlabel('Time (s)   Yell = X1  Purp = Y1  Blue = X2  Red = Y2');
yaxis=['Displacement (',units,')'];
ylabel(yaxis);

figure
plot(t(:),vel(:,1),t(:),vel(:,2),t(:),vel(:,3),t(:),vel(:,4));
title('Veloctiy Components of Both Points');
xlabel('Time (s)   Yell = X1  Purp = Y1  Blue = X2  Red = Y2');
yaxis=['Velocity (',units,'/s)'];
ylabel(yaxis);

figure
plot(t(:),accel(:,1),t(:),accel(:,2),t(:),accel(:,3),t(:),accel(:,4));
title('Acceleration Components of Both Points');
xlabel('Time (s)   Yell = X1  Purp = Y1  Blue = X2  Red = Y2');
yaxis=['Acceleration (',units,'/s^2)'];
ylabel(yaxis);

figure
plot(t(:),veltot1(:),t(:),veltot2(:),t(:),acctot1(:),t(:),acctot2(:));
title('Speed and Total Acceleration for Both Points')
xlabel('Time (s)   Yell = V1  Purp = V2  Blue = A1  Red = A2');
yaxis=['Velocity (',units,'/s) & Acceleration (',units,'/s^2)'];
ylabel(yaxis);

figure
polar(theta(:),t(:));
title('Angular Displacement');
text(-.75*t(f),-1.25*t(f),'Radial axis = time (s)   Angle in deg.');

figure
plot(t(:),omega(:),t(:),alpha(:));
title('Angular Velocity and Acceleration')
xlabel('Time (s)   Yell = Ang Vel  Purp = Ang Accel');
ylabel('Rad/s and Rad/s^2');
