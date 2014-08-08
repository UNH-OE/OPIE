
%Frame Analysis



k=2;
t(1)=0;
while k<=f,
	file=[path,fname,'_',int2str(k),'.bmp'];
	[A,map]=bmpread(file);
	[m,n]=size(A);
	

	d=sqrt((B(1,3)-B(1,1))^2+(B(1,4)-B(1,2))^2);
	dact=sqrt(((B(1,3)-B(1,1))*calx)^2+((B(1,4)-B(1,2))*caly)^2);				
	
			
	
		

%Finds predicted values
		count=1;
		while count<=2*numpnt,
			b(count)=B(k-1,count);
			count=count+1;
			end

%Finds points near predicted value
		count=1;
		
		while count<=2*numpnt-1,
			j=b(count)-d/ratio;
			min=256;
			while j<=b(count)+d/ratio & j<=n & j>=1,
				i=b(count+1)-d/ratio;
				while i<=b(count+1)+d/ratio & i<=m & i>=1,
					rad=round(sqrt((b(count)-j)^2+(b(count+1)-i)^2));
					if rad<=d/ratio & A(round(i),round(j))<min
						B(k,count)=round(j);
						B(k,count+1)=round(i);
						min=A(round(i),round(j));
						end
					i=i+1;
					end
				j=j+1;
				end
			count=count+2;
			end		
		

%Shows location of point
	count=1;
	C=A;
	while count<2*numpnt,
		j=1;
		i=1;
		while j>=1 & j<=n,
			C(B(k,count+1),j)=1;
			C(B(k,count+1)+1,j)=1;
			j=j+1;
			end
		while i>=1 & i<=m,
			C(i,B(k,count))=1;
			C(i,B(k,count)+1)=1;
			i=i+1;
			end
		C(B(k,count+1),B(k,count))=256;
		count=count+2;
		end

txt = uicontrol(gcf,'Style','text','Position',[65 390 225 20],...
'String','O.P.I.E. Position Locator','BackgroundColor',[0 0 0],...
'ForegroundColor',[1 1 1]);

frame_txt = uicontrol(gcf,'Style','text','Position',[375 390 130 25],...
'String','Currently Viewing Frame:  ','BackgroundColor',[0 0 0],...
'ForegroundColor',[1 .8 1],'HorizontalAlignment','Left');

frame_txt2 = uicontrol(gcf,'Style','text','Position',[420 370 25 20],...
'String',int2str(k),'BackgroundColor',[0 0 0],...
'ForegroundColor',[1 1 .8]);

quit=uicontrol(gcf,'Style','pushbutton','String',...
'Quit','Position',[200 5 115 25],'BackgroundColor',[.9 1 1],'Callback',...
['close(gcf)',',Return,']);


	imshow(C,map);
	drawnow;
	t(k,1)=(k-1)/fps;
	k=k+1;	
	end



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


cd ..