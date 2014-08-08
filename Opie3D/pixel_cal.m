function pixel_cal(cal_image,title,action)
%
% This function allows interactive plotting of psd's
%
global HCal; % variables used to return the calibration factor
global VCal;

if nargin<3,
   action='initialize';
end;

if strcmp(action,'initialize'),
    oldFigNumber=watchon;
    callbackstr='temp=get(gcf,''userdata''); delete(temp(2)), clear temp';
    figNumber(1)=figure('Visible','off', ...
       'NumberTitle','off', ...
       'resize','off', ...
       'position',[5 30 627 446], ...
       'deletefcn',callbackstr, ...
       'Name',title, ...
       'paperorientation','landscape', ...
       'paperposition',[-.75 0 10.5 8]);
    a(13)=imshow(cal_image,'truesize');
    callbackstr='temp=get(gcf,''userdata''); delete(temp(1)), clear temp';
    figNumber(2)=figure('Visible','off', ...
       'NumberTitle','off', ...
       'resize','on', ...
       'deletefcn',callbackstr, ...
       'menubar','none', ...
       'position',[640 30 150 530], ...
       'Name','Pixel Calibration');
    axis off;
    
    a(14) = 0; % x coordinate of the top point
    a(15) = 0; % y coordinate of the top point
    
    a(16) = 0; % x coordinate of the bottom point
    a(17) = 0; % y coordinate of the bottom point
    
    a(18) = 0; % x coordinate of the left point
    a(19) = 0; % y coordinate of the left point
    
    a(20) = 0; % x coordinate of the right point
    a(21) = 0; % y coordinate of the right point
    
    HCal = 0;
    VCal = 0;
    
    %====================================
    % Information for all buttons
    %====================================
   
    figColor=get(gcf,'color');
    labelColor=figColor;
    top=370;
    bottom=10;
    yInitLabelPos=480;
    left=10; %15
    labelWid=120;
    labelHt=12.5;
    btnWid=80;  %100
    frmWid=90; %120
    btnHt=12.5;
    editWid=30;
    editHt=14;
    textWid=70; %90
    textHt=12.5;
    btnOffset=1;
    editOffset=3;
    spacing=20;
    frmBorder=7.5;
     
    %====================================Main Menu=====================================
    
    
    %======================================
    % Text Help
    %======================================
    
    btnNumber=1;
    yPos=(top-(btnNumber-1)*(labelHt)); 
    labelStr='Left Click to zoom in';
    callbackStr='';
    labelPos=[left+10 yPos labelWid-30 labelHt];
    % moved the opaque frame drawing (bertrand)
    a(1)=uicontrol('Style','text', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',labelPos, ...
       'BackgroundColor',labelColor, ...
       'HorizontalAlignment','left', ...
       'String',labelStr);
    
    yPos=yPos - (labelHt + editOffset ); 
    labelStr='Right Click to zoom out';
    callbackStr='';
    labelPos=[left+10 yPos labelWid-30 labelHt];
    a(2)=uicontrol('Style','text', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',labelPos, ...
       'BackgroundColor',labelColor, ...
       'HorizontalAlignment','left', ...
       'String',labelStr);


    %======================================
    % The Horizontal Calibration and Vertical Calibration Buttons
    %======================================
    
    % The Horizontal Calibration button.
    
    btnNumber = 3;
    yPos=(top-(btnNumber-1)*(btnHt+labelHt+btnOffset));
    btnPos=[left yPos btnWid+20 1.5*btnHt];
    callbackstr='pixel_cal(cal_image,title,''hcal'')';
    a(3)=uicontrol('Style','pushbutton', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',btnPos, ...
       'String','Horizontal Calibration', ...
       'Callback',callbackstr);
    
    
    % The Vertical Calibration button.
    
    btnNumber = 4;
    yPos=(top-(btnNumber-1)*(btnHt+labelHt+btnOffset));
    btnPos=[left yPos btnWid+20 1.5*btnHt];
    callbackstr='pixel_cal(cal_image,title,''vcal'')';
    a(4)=uicontrol('Style','pushbutton', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',btnPos, ...
       'String','Vertical Calibration', ...
       'Callback',callbackstr);

    
    %====================================
    % The Pixel Calibration window
    %====================================
    
    btnNumber=3;
    yPos=(top-(btnNumber-1)*(btnHt+labelHt+spacing))-btnHt;
    labelStr='   Pixel Calibration';
    callbackStr='';
    yPos=yPos-labelHt;
    labelPos=[left+20 yPos labelWid-40 labelHt];
    % moved the opaque frame drawing (bertrand)
    yPosFrame=yPos-editHt-btnOffset-editHt-btnOffset;
    frmPos=[left-frmBorder yPosFrame-frmBorder frmWid+2*frmBorder ...
          .5*labelHt+2*btnOffset+2*editHt+frmBorder];
    a(5)=uicontrol('Style','frame', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',frmPos, ...
       'foregroundcolor',[.5 .5 .5], ...
       'BackgroundColor',figColor);
    a(6)=uicontrol('Style','text', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',labelPos, ...
       'BackgroundColor',labelColor, ...
       'HorizontalAlignment','left', ...
       'String',labelStr);
    yPos=yPos-editHt-btnOffset;
    btnPos=[left yPos editWid editHt];
    a(7)=uicontrol('Style','text', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',btnPos, ...
       'String',num2str(abs(a(18)-a(20))), ...
       'Callback',callbackStr);
    btnPos=[left+editWid+editOffset yPos-1.5 textWid textHt];
    a(8)=uicontrol('Style','text', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'horizontalalignment','left', ...
       'Position',btnPos, ...
       'backgroundcolor',labelColor, ...
       'String','Horizontal (pixels)');
    yPos=yPos-editHt-btnOffset;
    btnPos=[left yPos editWid editHt];
    a(9)=uicontrol('Style','text', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',btnPos, ...
       'String',num2str(abs(a(15)-a(17))), ...
       'Callback',callbackStr);
    btnPos=[left+editWid+editOffset yPos-1.5 textWid editHt];
    a(10)=uicontrol('Style','text', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'horizontalalignment','left', ...
       'Position',btnPos, ...
       'backgroundcolor',labelColor, ...
       'String','Vertical (pixels)');
    
    
    %====================================
    % Ok, Cancel, buttons
    %====================================
    
    btnNumber=7;
    yPos=(top-(btnNumber-1)*(btnHt+labelHt+spacing))-4*btnHt;
    
    % The OK Button
    
    yPos=yPos-1.5*btnHt;
    btnPos=[left yPos btnWid+20 1.5*btnHt];
    callbackStr = ['done = 1; HCal; VCal;'...
          'delete(gcf);'];
    a(11)=uicontrol('Style','pushbutton', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',btnPos, ...
       'String','Ok', ...
       'Callback',callbackStr);
    
    % The Cancel button.
    
    yPos=yPos-1.5*btnHt-1.5*btnOffset;
    btnPos=[left yPos btnWid+20 1.5*btnHt];
    callbackstr='done = 2; delete(gcf)';
    a(12)=uicontrol('Style','pushbutton', ...
       'parent',figNumber(2), ...
       'Units','points', ...
       'Position',btnPos, ...
       'String','Close', ...
       'Callback',callbackstr);
    
    
% ============== Uncover the Figure ============================================
    
    watchoff(oldFigNumber);
    hndlList=[figNumber a];
    figure(figNumber(2));
    set(figNumber(2),'Visible','on','resize','off', ...
       'UserData',hndlList);
    figure(figNumber(1))
    set(gcf,'Visible','on', ...
       'UserData',hndlList);
    
    zoom on; % activate the zoom function
    
    pixel_cal(cal_image,title,'eval');

    %=============== Horizontal Calibration =================
elseif strcmp(action,'hcal'),
   a=get(gcf,'UserData');
   figNumber=a(1:2);
   a=a(3:length(a));
   
   figure(figNumber(1)); %activate the image window 
   [X, Y ] = ginput(1);	 %Get the Left Point
   a(18) = round(X);
   a(19) = round(Y);
   [X, Y ] = ginput(1);	 %Get the Right Point
   a(20) = round(X);
   a(21) = round(Y);
   
   HCal = abs(a(18)-a(20));
   set(a(7),'String',num2str(HCal)); %update the calibration factor
   
   pixel_cal(cal_image,title,'eval');
   
    %=============== Vertical Calibration =================
elseif strcmp(action,'vcal'),
   a=get(gcf,'UserData');
   figNumber=a(1:2);
   a=a(3:length(a));
   
   figure(figNumber(1)); %activate the image window 
   [X, Y ] = ginput(1);	 %Get the Top Point
   a(14) = round(X);
   a(15) = round(Y);
   [X, Y ] = ginput(1);	 %Get the Bottom Point
   a(16) = round(X);
   a(17) = round(Y);
   
   VCal = abs(a(15)-a(17));
   set(a(9),'String',num2str(VCal)); %update the calibration factor
   
   pixel_cal(cal_image,title,'eval');
   
elseif strcmp(action,'eval'),
   
   a=get(gcf,'UserData');
   figNumber=a(1:2);
   a=a(3:length(a));
  
end
