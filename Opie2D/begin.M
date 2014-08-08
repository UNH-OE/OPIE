%Assign a handle to the window and clear it
clc


%set(gcf','name','OPIE Analysis Software','numbertitle','off');

% Text that identifies program
txt = uicontrol(gcf,'Style','text','Position',[220 370 120 35],...
'String','O.P.I.E. Analysis Program','BackgroundColor',[0 0 0],...
'ForegroundColor',[1 0 0]);

[A,map]=bmpread('cal0001.bmp');
imshow(A,map);

opt1=uicontrol(gcf,'Style','pushbutton','String',...
'Quit','Position',[75 10 120 25],'Callback','close(gcf)');

anl_opt=uicontrol(gcf,'Style','pushbutton','String',...
'Start Analysis','Position',[385 10 120 25],'Callback','close(gcf),info');

