function fig = OPIEgrapher()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.

load OPIEgrapher

h0 = figure('Units','points', ...
   'Color',[0.8 0.8 0.8], ...
   'Colormap',mat0, ...
   'MenuBar','none',...
	'Name','OPIE Grapher', ...
	'NextPlot','replace', ...
	'NumberTitle','off', ...
	'PointerShapeCData',mat1, ...
	'Position',[98.25 159.75 576.75 372], ...
	'Tag','Fig2');
h1 = uicontrol('Parent',h0, ...
   'Callback','close(gcf);OPIEsave;',...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[376.5 6 76.5 23.25], ...
	'String','Continue', ...
	'Tag','Pushbutton2', ...
	'TooltipString','Quit the OPIE Grapher and go to the save screen.');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'Callback','close(gcf);clear;', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[0.0741222366710013 0.01814516129032258 0.1261378413524057 0.06048387096774194], ...
	'String','Quit', ...
	'Tag','Pushbutton1', ...
	'TooltipString','Exit OPIE and Clear Workspace');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontAngle','italic', ...
	'FontName','Ariel', ...
	'FontSize',28, ...
	'FontWeight','bold', ...
	'ForegroundColor',[0 0 1], ...
	'ListboxTop',0, ...
	'Position',[0.3 0.8928571428571429 0.3821428571428572 0.1], ...
	'String','O P I E', ...
	'Style','text', ...
	'Tag','StaticText1', ...
	'TooltipString','Optical Positioning Instrumentation and Evaluation');
h1 = axes('Parent',h0, ...
   'CreateFcn','zoom on;',...
   'Box','on',...
   'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'Color',[1 1 1], ...
	'ColorOrder',mat2, ...
	'Position',[58 65 545 376], ...
	'Tag','PlotAxes', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4981617647058824 -0.06399999999999984 9.160254037844386], ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.05330882352941176 0.4960000000000001 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',mat3, ...
	'Tag','Axes1Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4981617647058824 1.018666666666667 9.160254037844386], ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = uicontrol('Parent',h0, ...
   'Callback',[''...
      'PlotType=''Trajectory'';'...
      'set(findobj(''Tag'',''X1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''X2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Y1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Y2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vx1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vx2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vy1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vy2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ax1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ax2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ay1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ay2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Theta''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Omega''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Alpha''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''VelocityVector''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''AccelerationVector''),''Enable'',''on'');'...
      ],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[453.75 308.25 61.5 21.75], ...
	'String','Trajectory', ...
	'Tag','Trajectory', ...
   'TooltipString','Plot the trajectories of the targets.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[457.5 289.5 45 15], ...
	'String','Target 1', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
   'Position',[505.5 293.25 15 15], ...
   'ForegroundColor','b',...
	'String','__', ...
	'Style','text', ...
	'Tag','Target1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[457.5 273.75 45 15], ...
	'String','Target 2', ...
	'Style','text', ...
	'Tag','StaticText4');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
   'Position',[506.25 276 15 15], ...
   'ForegroundColor','r',...
	'String','__', ...
	'Style','text', ...
	'Tag','Target2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[456.75 258.75 56.25 17.25], ...
	'String','Velocity', ...
	'Style','checkbox', ...
	'Tag','VelocityVector', ...
   'TooltipString','Plot velocity vectors on the trajectory plot.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
   'Position',[533.25 260.25 15 15], ...
   'ForegroundColor','g',...
	'String','__', ...
	'Style','text', ...
	'Tag','VelocityVectorT');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[456.75 240 76.5 18.75], ...
	'String','Acceleration', ...
	'Style','checkbox', ...
	'Tag','AccelerationVector', ...
   'TooltipString','Plot acceleration vectors on the trajectory plot.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'ListboxTop',0, ...
   'Position',[534 243 15 15], ...
   'ForegroundColor','m',...
	'String','__', ...
	'Style','text', ...
	'Tag','AccelerationVectorT');
h1 = uicontrol('Parent',h0, ...
   'Callback',[''...
      'PlotType=''TimeSeries'';'...
      'set(findobj(''Tag'',''X1''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''X2''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Y1''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Y2''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Vx1''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Vx2''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Vy1''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Vy2''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Ax1''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Ax2''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Ay1''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Ay2''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Theta''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Omega''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''Alpha''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''VelocityVector''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''AccelerationVector''),''Enable'',''off'');'...
      ],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[453.75 217.5 64.5 21], ...
	'String','Time Series', ...
	'Tag','TimeSeries', ...
	'TooltipString','Plot time series of the variable selected below.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[455.25 198 33 15], ...
	'String','X 1', ...
	'Style','checkbox', ...
	'Tag','X1', ...
	'TooltipString','Horizontal displacement of the first target from its specified equilibrium.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[486.75 201 15 15], ...
   'ForegroundColor','b',...
	'String','__', ...
	'Style','text', ...
	'Tag','x1t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[517.5 197.25 33 15], ...
	'String','X 2', ...
	'Style','checkbox', ...
	'Tag','X2', ...
	'TooltipString','Horizontal displacement of the second target from its specified equilibrium.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[549.75 198.75 15 15], ...
   'ForegroundColor','b',...
	'String','--', ...
	'Style','text', ...
	'Tag','x2t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[455.25 177.75 33 15], ...
	'String','Y 1', ...
	'Style','checkbox', ...
   'Tag','Y1', ...
	'TooltipString','Vertical displacement of the first target from its specified equilibrium.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[486.75 180.75 15 15], ...
   'ForegroundColor','r',...
	'String','__', ...
	'Style','text', ...
	'Tag','y1t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[517.5 177 33 15], ...
	'String','Y 2', ...
	'Style','checkbox', ...
	'Tag','Y2', ...
	'TooltipString','Vertical displacement of the second target from its specified equilibrium.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[549.75 178.5 15 15], ...
   'ForegroundColor','r',...
	'String','--', ...
	'Style','text', ...
	'Tag','y2t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[455.25 157.5 33 15], ...
	'String','Vx1', ...
	'Style','checkbox', ...
	'Tag','Vx1', ...
	'TooltipString','Horizontal velocity of the first target.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[486.75 160.5 15 15], ...
   'ForegroundColor','c',...
	'String','__', ...
	'Style','text', ...
	'Tag','Vx1t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[517.5 156.75 33 15], ...
	'String','Vx2', ...
	'Style','checkbox', ...
	'Tag','Vx2', ...
	'TooltipString','Horizontal velocity of the second target.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[549.75 158.25 15 15], ...
   'ForegroundColor','c',...
	'String','--', ...
	'Style','text', ...
	'Tag','Vx2t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[455.25 138 33 15], ...
	'String','Vy1', ...
	'Style','checkbox', ...
	'Tag','Vy1', ...
	'TooltipString','Vertical velocity of the first target.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[486.75 141 15 15], ...
   'ForegroundColor','m',...
	'String','__', ...
	'Style','text', ...
	'Tag','Vy1t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[517.5 137.25 33 15], ...
	'String','Vy2', ...
	'Style','checkbox', ...
	'Tag','Vy2', ...
	'TooltipString','Vertical velocity of the second target.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[549.75 138.75 15 15], ...
   'ForegroundColor','m',...
	'String','--', ...
	'Style','text', ...
	'Tag','Vy2t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[455.25 117.75 33 15], ...
	'String','Ax1', ...
	'Style','checkbox', ...
	'Tag','Ax1', ...
	'TooltipString','Horizontal acceleration of the first target.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[486.75 120.75 15 15], ...
   'ForegroundColor','g',...
	'String','__', ...
	'Style','text', ...
	'Tag','Ax1t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[517.5 117 33 15], ...
	'String','Ax2', ...
	'Style','checkbox', ...
	'Tag','Ax2', ...
	'TooltipString','Horizontal acceleration of the second target.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[549.75 118.5 15 15], ...
   'ForegroundColor','g',...
	'String','--', ...
	'Style','text', ...
	'Tag','Ax2t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[455.25 97.5 33 15], ...
	'String','Ay1', ...
	'Style','checkbox', ...
	'Tag','Ay1', ...
	'TooltipString','Vertical acceleration of the first taget.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[486.75 100.5 15 15], ...
   'ForegroundColor','k',...
	'String','__', ...
	'Style','text', ...
	'Tag','Ay1t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[517.5 96.75 33 15], ...
	'String','Ay2', ...
	'Style','checkbox', ...
	'Tag','Ay2', ...
	'TooltipString','Vertical acceleration of the second target.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[549.75 98.25 15 15], ...
   'ForegroundColor','k',...
	'String','--', ...
	'Style','text', ...
	'Tag','Ay2t');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Symbol', ...
	'FontSize',14, ...
	'FontWeight','demi', ...
	'ListboxTop',0, ...
	'Position',[486 76.5 30 15], ...
	'String','q', ...
	'Style','checkbox', ...
	'Tag','Theta', ...
	'TooltipString','Angle from horizontal (positive counter-clockwise) of the line between the targets.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[513 78 15 15], ...
   'ForegroundColor','b',...
	'String','...', ...
	'Style','text', ...
	'Tag','ThetaT');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Symbol', ...
	'FontSize',14, ...
	'FontWeight','demi', ...
	'ListboxTop',0, ...
	'Position',[486 56.25 30 15], ...
	'String','w', ...
	'Style','checkbox', ...
	'Tag','Omega', ...
	'TooltipString','Angular velocity of the line between the targets.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[513 57.75 15 15], ...
   'ForegroundColor','r',...
	'String','...', ...
	'Style','text', ...
	'Tag','OmegaT');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Symbol', ...
	'FontSize',14, ...
	'FontWeight','demi', ...
	'ListboxTop',0, ...
	'Position',[486 36.75 30 15], ...
	'String','a', ...
	'Style','checkbox', ...
	'Tag','Alpha', ...
	'TooltipString','Angular acceleration of the line between the targets.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
   'Position',[513 37.5 15 15], ...
   'ForegroundColor','m',...
	'String','...', ...
	'Style','text', ...
	'Tag','AlphaT');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn',[''...
      'PlotType=''Trajectory'';'...
      'set(findobj(''Tag'',''X1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''X2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Y1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Y2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vx1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vx2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vy1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Vy2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ax1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ax2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ay1''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Ay2''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Theta''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Omega''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''Alpha''),''Enable'',''off'');'...
      'set(findobj(''Tag'',''VelocityVector''),''Enable'',''on'');'...
      'set(findobj(''Tag'',''AccelerationVector''),''Enable'',''on'');'...
      'axes(findobj(''Tag'',''PlotAxes''));'...
      'hold on;'...
      'plot(x(:,1)*XCal,y(:,1)*YCal,''b'',x(:,2)*XCal,y(:,2)*YCal,''r'');'...
      'axis([0,PicWidth*XCal,0,PicHeight*YCal]);'...
      'xlabel(''Trajectory'');'...
      ''],...
   'Callback',[''...
      'if PlotType == ''Trajectory'','...
      	'axes(findobj(''Tag'',''PlotAxes''));'...
      	'cla;reset(gca);'...
         'set(gca,''Tag'',''PlotAxes'');'...
   	   'hold on;'...
   	   'plot(x(:,1)*XCal,y(:,1)*YCal,''b'',x(:,2)*XCal,y(:,2)*YCal,''r'');'...
   	   'axis([0,PicWidth*XCal,0,PicHeight*YCal]);'...
         'xlabel(''Trajectory'');'...
         'if get(findobj(''Tag'',''VelocityVector''),''Value'')==1,'...
         	'quiver(x(1:length(x)-1,1)*XCal,y(1:length(y)-1,1)*YCal,Vx(2:length(Vx),1),Vy(2:length(Vy),1),''g'');'...
            'quiver(x(1:length(x)-1,2)*XCal,y(1:length(y)-1,2)*YCal,Vx(2:length(Vx),2),Vy(2:length(Vy),2),''g'');'...
            'end;'...
         'if get(findobj(''Tag'',''AccelerationVector''),''Value'')==1,'...
         	'quiver(x(1:length(x)-1,1)*XCal,y(1:length(y)-1,1)*YCal,Ax(2:length(Ax),1),Ay(2:length(Ay),1),''m'');'...
            'quiver(x(1:length(x)-1,2)*XCal,y(1:length(y)-1,2)*YCal,Ax(2:length(Ax),2),Ay(2:length(Ay),2),''m'');'...
            'end;'...
         'end;'...
      'if PlotType == ''TimeSeries'','...
         'axes(findobj(''Tag'',''PlotAxes''));'...
         'cla;reset(gca);'...
         'set(gca,''Tag'',''PlotAxes'');'...
         'hold on;'...
         'if get(findobj(''Tag'',''X1''),''Value'')==1,plot(Time,X(:,1),''b-'');end;'...   
         'if get(findobj(''Tag'',''X2''),''Value'')==1,plot(Time,X(:,2),''b--'');end;'...
         'if get(findobj(''Tag'',''Y1''),''Value'')==1,plot(Time,Y(:,1),''r-'');end;'...
         'if get(findobj(''Tag'',''Y2''),''Value'')==1,plot(Time,Y(:,2),''r--'');end;'...
         'if get(findobj(''Tag'',''Vx1''),''Value'')==1,plot(Time,Vx(:,1),''c-'');end;'...
         'if get(findobj(''Tag'',''Vx2''),''Value'')==1,plot(Time,Vx(:,2),''c--'');end;'...
         'if get(findobj(''Tag'',''Vy1''),''Value'')==1,plot(Time,Vy(:,1),''m-'');end;'...
         'if get(findobj(''Tag'',''Vy2''),''Value'')==1,plot(Time,Vy(:,2),''m--'');end;'...
         'if get(findobj(''Tag'',''Ax1''),''Value'')==1,plot(Time,Ax(:,1),''g-'');end;'...
         'if get(findobj(''Tag'',''Ax2''),''Value'')==1,plot(Time,Ax(:,2),''g--'');end;'...
         'if get(findobj(''Tag'',''Ay1''),''Value'')==1,plot(Time,Ay(:,1),''k-'');end;'...
         'if get(findobj(''Tag'',''Ay2''),''Value'')==1,plot(Time,Ay(:,2),''k--'');end;'...
         'if get(findobj(''Tag'',''Theta''),''Value'')==1,plot(Time,Theta,''b:'');end;'...
         'if get(findobj(''Tag'',''Omega''),''Value'')==1,plot(Time,Omega,''r:'');end;'...
         'if get(findobj(''Tag'',''Alpha''),''Value'')==1,plot(Time,Alpha,''m:'');end;'...
      	'xlabel(''Time (sec)'');'...
      	'end;'...
      ''...
      'hold off;'...
      ],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[477.75 6 59.25 23.25], ...
	'String','Graph', ...
	'Tag','Pushbutton5', ...
   'TooltipString','Press to refresh the graph.');
h1 = uicontrol('Parent',h0, ...
   'Callback','OPIEexport;',...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[300 6 60 23.25], ...
	'String','Export', ...
	'Tag','Pushbutton2', ...
	'TooltipString','Choose a method of export.');
if nargout > 0, fig = h0; end