function fig = OPIEequilibrium()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.

load OPIEequilibrium

h0 = figure('Units','points', ...
	'Color',[0.8 0.8 0.8], ...
   'Colormap',mat0, ...
   'MenuBar','none',...
	'Name','OPIE Equilibrium', ...
	'NumberTitle','off', ...
	'PointerShapeCData',mat1, ...
	'Position',[173.25 215.25 420 315], ...
	'Tag','Fig2');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontAngle','italic', ...
	'FontName','Ariel', ...
	'FontSize',28, ...
	'FontWeight','bold', ...
	'ForegroundColor',[0 0 1], ...
	'ListboxTop',0, ...
	'Position',[0.3 0.8976190476190477 0.3821428571428571 0.1], ...
	'String','O P I E', ...
	'Style','text', ...
	'Tag','StaticText1', ...
	'TooltipString','Optical Positioning Instrumentation and Evaluation');
h1 = uicontrol('Parent',h0, ...
   'Callback',['close(gcf);'...
      'save c:\matlab\opie\DefaultData VideoPath FileName CalibrationFile EquilFile '...
      'StartFrame EndFrame SampleRate Diameter ROIScaleFactor XCal YCal XRef YRef x y;'...
      'OPIEfirstframe;'],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[329.25 5.25 76.5 23.25], ...
	'String','Continue', ...
	'Tag','Pushbutton2', ...
	'TooltipString','Save these reference locations for each target and select the targets.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','close(gcf);OPIEinfo;', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[229.25 5.25 76.5 23.25], ...
	'String','Back', ...
	'Tag','Pushbutton2', ...
	'TooltipString','Return to the information window.');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'Callback','close(gcf);clear;', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',mat2, ...
	'String','Quit', ...
	'Tag','Pushbutton1', ...
	'TooltipString','Exit OPIE and Clear Workspace');
h1 = uicontrol('Parent',h0, ...
   'Callback',['set(findobj(''Tag'',''Clear Ref''),''Value'',0);'...
      '[XRef(1),YRef(1)]=ginput(1);XRef=round(XRef);YRef=round(YRef);'],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',12, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[365 169.5 50 24], ...
	'String','Point 1', ...
	'Tag','Pushbutton3', ...
	'TooltipString',mat3);
h1 = uicontrol('Parent',h0, ...
   'Callback',['set(findobj(''Tag'',''Clear Ref''),''Value'',0);'...
      '[XRef(2),YRef(2)]=ginput(1);XRef=round(XRef);YRef=round(YRef);'],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',12, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[365 134.25 50 24], ...
	'String','Point 2', ...
	'Tag','Pushbutton4', ...
   'TooltipString',mat4);
h1 = uicontrol('Parent',h0, ...
   'Callback','if get(gcbo,''Value'')==1, XRef(1:2)=0;YRef(1:2)=0; end;',...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[363 77.25 54.75 21], ...
	'String','No Equil', ...
	'Style','checkbox', ...
	'Tag','Clear Ref', ...
	'TooltipString','Set the equilibrium point to [0,0] (the upper left corner) for both targets.');
h1 = axes('Parent',h0, ...
   'CreateFcn','A=imread([VideoPath,EquilFile,''0001.bmp'']);imshow(A);zoom on;',...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'Color',[1 1 1], ...
	'ColorOrder',mat5, ...
	'Position',[19 49 463 321], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4978354978354978 -0.07500000000000018 9.160254037844386], ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.06277056277056277 0.496875 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-0.04112554112554112 1.15625 9.160254037844386], ...
	'Tag','Axes1Text2');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4978354978354978 1.021875 9.160254037844386], ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
if nargout > 0, fig = h0; end
