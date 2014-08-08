



%Frame Analysis

k=2;
t(1)=0;
while k<=f,
	file=[path,fname,'_',int2str(k),'.bmp'];
	[A,map]=bmpread(file);
	[m,n]=size(A);
	n=n-11;

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
			j=b(count)-d/2;
			min=256;
			while j<=b(count)+d/2 & j<=n & j>=1,
				i=b(count+1)-d/2;
				while i<=b(count+1)+d/2 & i<=m & i>=1,
					rad=sqrt((b(count)-j)^2+(b(count+1)-i)^2);
					if rad<=d/4 & A(i,j)<min
						B(k,count)=j;
						B(k,count+1)=i;
						min=A(i,j);
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

txt = uicontrol(gcf,'Style','text','Position',[25 340 225 20],...
'String','O.P.I.E. Position Locator','BackgroundColor',[0 0 0],...
'ForegroundColor',[1 1 1]);

frame_txt = uicontrol(gcf,'Style','text','Position',[375 350 130 25],...
'String','Currently Viewing Frame:  ','BackgroundColor',[0 0 0],...
'ForegroundColor',[1 .8 1],'HorizontalAlignment','Left');

frame_txt2 = uicontrol(gcf,'Style','text','Position',[420 330 25 20],...
'String',int2str(k),'BackgroundColor',[0 0 0],...
'ForegroundColor',[1 1 .8]);

quit=uicontrol(gcf,'Style','pushbutton','String',...
'Quit','Position',[200 5 115 25],'BackgroundColor',[.9 1 1],'Callback',...
['close(gcf)',',Return,']);


	imshow(C,map);
	drawnow;
	k=k+1;
	t(k+1)=k/fps;
	end



for k=1:f
	for count=1:4
		B(k,count)=B(k,count)*cal(count);
		end
	end

for k=1:f
	for count=1:4
		if k==1
			D(1,count)=B(2,count)-xref(count)*cal(count);
		else
			D(k,count)=B(k,count)-xref(count)*cal(count);
			end
		end
	end

for count=1:4
	vel(1,count)=(B(2,count)-B(1,count))*fps;
	end
for k=1:3
	for count=1:4
		accel(k,count)=0;
		end
	end
for k=2:1:f
	for count=1:1:4
		vel(k,count)=(B(k,count)-B(k-1,count))*fps;
		if k>=4
			accel(k,count)=vel(k,count)-vel(k-1,count)*fps;
			end
		end
	end
for k=1:f
	veltot1(k)=sqrt(vel(k,1)^2+vel(k,2)^2);
	veltot2(k)=sqrt(vel(k,3)^2+vel(k,4)^2);
	acctot1(k)=sqrt(accel(k,1)^2+accel(k,2)^2);
	acctot2(k)=sqrt(accel(k,3)^2+accel(k,4)^2);
	end

if xref(1) < xref(3) & xref(2) <= xref(4)
	theta_ref=asin((xref(4)-xref(2))/dact);
	end
if xref(1) >= xref(3) & xref(2) < xref(4)
	theta_ref=3.14159/2+asin((xref(4)-xref(2))/dact);
	end
if xref(1) > xref(3) & xref(2) >= xref(4)
	theta_ref=3.14159+asin((xref(4)-xref(2))/dact);
	end
if xref(1) <= xref(3) & xref(2) > xref(4)
	theta_ref=3*3.14159/2 +asin((xref(4)-xref(2))/dact);
	end

for k=1:f
	if B(k,1) < B(k,3) & B(k,2) <= B(k,4)
		theta(k)=asin(((B(k,4)-B(k,2))/dact)-theta_ref);
		end
	if B(k,1) >= B(k,3) & B(k,2) < B(k,4)
		theta(k)=3.14159/2+asin(((B(k,4)-B(k,2))/dact)-theta_ref);
		end
	if B(k,1) > B(k,3) & B(k,2) >= B(k,4)
		theta(k)=3.14159+asin(((B(k,4)-B(k,2))/dact)-theta_ref);
		end
	if B(k,1) <= B(k,3) & B(k,2) > B(k,4)
		theta(k)=3*3.14159/2+asin(((B(k,4)-B(k,2))/dact)-theta_ref);
		end

	end

omega(1)=(theta(2)-theta(1))*fps;
alpha(1)=0;
for k=2:f
	omega(k)=(theta(k)-theta(k-1))*fps;
	alpha(k)=(omega(k)-omega(k-1))*fps;
	end

units=['Inches'];

figure
plot(B(1:f,1),B(1:f,2),'-',B(1:f,3),B(1:f,4),'-');
axis([0,n*cal(1),0,m*cal(2)]);
axis('ij');
title('Position in Frame');
xaxis=['Position (',units,')'];
xlabel(xaxis);
yaxis=['Position (',units,')'];
ylabel(yaxis);


figure
plot(t(1:f),D(1:f,1),t(1:f),D(1:f,2),t(1:f),D(1:f,3),t(1:f),D(1:f,4));
axis('xy');
title('Displacement from Equilibrium');
xlabel('Time (s)');
yaxis=['Displacement (',units,')'];
ylabel(yaxis);

figure
plot(t(1:f),vel(1:f,1),t(1:f),vel(1:f,2),t(1:f),accel(1:f,1),t(1:f),accel(1:f,2));
title('Veloctiy and Acceleration Components of the First Point');
xlabel('Time (s)');
yaxis=['Velocity (',units,'/s) & Acceleration (',units,'/s^2)'];
ylabel(yaxis);

figure
plot(t(1:f),vel(1:f,3),t(1:f),vel(1:f,4),t(1:f),accel(1:f,3),t(1:f),accel(1:f,4));
title('Velocity and Acceleration Components of the Second Point');
xlabel('Time (s)');
yaxis=['Velocity (',units,'/s) & Acceleration (',units,'/s^2)'];
ylabel(yaxis);

figure
plot(t(1:f),veltot1(1:f),t(1:f),veltot2(1:f),t(1:f),acctot1(1:f),t(1:f),acctot2(1:f));
title('Speed and Acceleration for Both Points')
xlabel('Time (s)');
yaxis=['Velocity (',units,'/s) & Acceleration (',units,'/s^2)'];
ylabel(yaxis);

cd C:\MATLAB\bin