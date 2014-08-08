function [x,y,X,Y,Vx,Vy,Ax,Ay,Theta,Omega,Alpha,Time]=OPIEextrapolate(x,y,XCal,YCal,XRef,YRef,SampleRate,PicHeight)

%This function uses the position data contained in x and y, calibrates them with
%XCal and YCal, creates a time series using SampleRate and extrapolates to find
%Displacements (using XRef and YRef), Velocities, Accelerations and Angular information.


%Change trajectory to 'xy' coordinates from 'ij'
y=PicHeight-y;

%Displacement
X(:,1)=(x(:,1)-XRef(1))*XCal;
X(:,2)=(x(:,2)-XRef(2))*XCal;
Y(:,1)=(y(:,1)-(PicHeight-YRef(1)))*YCal;
Y(:,2)=(y(:,2)-(PicHeight-YRef(2)))*YCal;

%Velocity
Vx(2:length(X),:)=diff(X)*SampleRate;
Vy(2:length(Y),:)=diff(Y)*SampleRate;
Vx(1,:)=Vx(2,:);
Vy(1,:)=Vy(2,:);

%Acceleration
Ax(2:length(Vx),:)=diff(Vx)*SampleRate;
Ay(2:length(Vx),:)=diff(Vy)*SampleRate;
Ax(1,:)=Ax(2,:);
Ay(1,:)=Ay(2,:);


%Angular measurments
Theta=atan2((y(:,2)-y(:,1))*YCal,(x(:,2)-x(:,1))*XCal)*180/pi;
Omega(2:length(Theta))=diff(Theta)*SampleRate;
Omega(1)=Omega(2);
Alpha(2:length(Theta))=diff(Omega)*SampleRate;
Alpha(1)=Alpha(2);

%Time Series
Time=linspace(0,length(X),length(X))/SampleRate;