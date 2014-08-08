function fig = OPIEinfo()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.

load OPIEinfo

h0 = figure('Units','points', ...
   'CreateFcn','load c:\matlab\opie\DefaultData;',...
	'Color',[0.8 0.8 0.8], ...
   'Colormap',mat0, ...
   'MenuBar','none',...
	'Name','OPIE Information', ...
	'NumberTitle','off', ...
	'PointerShapeCData',mat1, ...
	'Position',[174.75 215.25 420 315], ...
	'Tag','Fig1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontAngle','italic', ...
	'FontName','Ariel', ...
	'FontSize',36, ...
	'FontWeight','bold', ...
	'ForegroundColor',[0 0 1], ...
	'ListboxTop',0, ...
	'Position',[139.5 277.5 135 35.25], ...
	'String','O P I E', ...
	'Style','text', ...
	'Tag','StaticText1', ...
	'TooltipString','Optical Positioning Instrumentation and Evaluation');
h1 = uicontrol('Parent',h0, ...
   'Callback','close(gcf);clear;',...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[27 13.5 81 30.75], ...
	'String','Quit', ...
	'Tag','Pushbutton1', ...
	'TooltipString','Quit OPIE and Clear the Memory');
h1 = uicontrol('Parent',h0, ...
   'Callback',[...
      'VideoPath=get(findobj(''Tag'',''VideoPath''),''String'');'...
      'FileName=get(findobj(''Tag'',''FileName''),''String'');'...
      'CalibrationFile=get(findobj(''Tag'',''CalibrationFile''),''String'');'...
      'EquilFile=get(findobj(''Tag'',''EquilFile''),''String'');'...
      'StartFrame=str2num(get(findobj(''Tag'',''StartFrame''),''String''));'...
      'EndFrame=str2num(get(findobj(''Tag'',''EndFrame''),''String''));'...
      'SampleRate=str2num(get(findobj(''Tag'',''SampleRate''),''String''));'...
      'Diameter=str2num(get(findobj(''Tag'',''Diameter''),''String''));'...
      'ROIScaleFactor=str2num(get(findobj(''Tag'',''ROIScaleFactor''),''String''));'...
      'save c:\matlab\opie\DefaultData VideoPath FileName CalibrationFile EquilFile '...
      'StartFrame EndFrame SampleRate Diameter ROIScaleFactor XCal YCal XRef YRef x y;'...
      'close(gcf);'...
   	'OPIEequilibrium;'],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',13, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[157.875 12.75 111 32.25], ...
	'String','Skip Calibration', ...
	'Tag','Pushbutton2', ...
	'TooltipString','Skip the Calibration and Define Target Reference Points');
h1 = uicontrol('Parent',h0, ...
   'Callback',[...
      'VideoPath=get(findobj(''Tag'',''VideoPath''),''String'');'...
      'FileName=get(findobj(''Tag'',''FileName''),''String'');'...
      'CalibrationFile=get(findobj(''Tag'',''CalibrationFile''),''String'');'...
      'EquilFile=get(findobj(''Tag'',''EquilFile''),''String'');'...
      'StartFrame=str2num(get(findobj(''Tag'',''StartFrame''),''String''));'...
      'EndFrame=str2num(get(findobj(''Tag'',''EndFrame''),''String''));'...
      'SampleRate=str2num(get(findobj(''Tag'',''SampleRate''),''String''));'...
      'Diameter=str2num(get(findobj(''Tag'',''Diameter''),''String''));'...
      'ROIScaleFactor=str2num(get(findobj(''Tag'',''ROIScaleFactor''),''String''));'...
      'save c:\matlab\opie\DefaultData VideoPath FileName CalibrationFile EquilFile '...
      'StartFrame EndFrame SampleRate Diameter ROIScaleFactor XCal YCal XRef YRef x y;'...
      'close(gcf);'...
      'OPIEcalibration;'...
   	],...
	'Units','points', ...
	'FontName','Ariel', ...
	'FontSize',14, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[318.75 12.75 77.25 32.25], ...
	'String','Continue', ...
	'Tag','Pushbutton3', ...
	'TooltipString','Perform Calibration');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[39.75 242.25 156.75 12.75], ...
	'String','Path Containing Video Files', ...
	'Style','text', ...
	'Tag','StaticText2');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',VideoPath);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 242 96.75 15], ...
	'Style','edit', ...
	'Tag','VideoPath', ...
	'TooltipString','Enter the Path and Directory where all the Files can be found.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[38.25 219 158.25 13.5], ...
	'String','Video File Name', ...
	'Style','text', ...
	'Tag','StaticText3');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',FileName);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 219 50 15], ...
	'Style','edit', ...
	'Tag','FileName', ...
	'TooltipString','Enter the four character prefix of the video files.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[38.25 196.5 158.25 12.75], ...
	'String','Calibration File Name', ...
	'Style','text', ...
	'Tag','StaticText4');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',CalibrationFile);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 195.75 49.5 15], ...
	'Style','edit', ...
	'Tag','CalibrationFile', ...
	'TooltipString','Enter the four letter prefix of the calibration file.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[37.5 173.25 159 12.75], ...
	'String','Equilibrium File Name', ...
	'Style','text', ...
	'Tag','StaticText5');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',EquilFile);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 173 50 15], ...
	'Style','edit', ...
	'Tag','EquilFile', ...
	'TooltipString','Enter the four letter prefix of the equilibrium file');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[36.75 150 159.75 13.5], ...
	'String','Analyze Frames:', ...
	'Style','text', ...
	'Tag','StaticText6');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',StartFrame);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 150 30 15], ...
	'Style','edit', ...
	'Tag','StartFrame', ...
	'TooltipString','Enter the frame to begin the analysis with.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[243 149.25 20.25 13.5], ...
	'String','to', ...
	'Style','text', ...
	'Tag','StaticText7');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',EndFrame);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[267.75 150 30 15], ...
	'Style','edit', ...
	'Tag','EndFrame', ...
	'TooltipString','Enter the frame to end the analysis with.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[36.75 127.5 159.75 12.75], ...
	'String','Sampling Rate', ...
	'Style','text', ...
	'Tag','StaticText8');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',SampleRate);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 127 50 15], ...
	'Style','edit', ...
   'Tag','SampleRate',...
	'TooltipString','Enter the rate at which pictures were taken.');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[264 128.25 62.25 13.5], ...
	'String','Frames/sec', ...
	'Style','text', ...
	'Tag','StaticText9');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[36 104.25 160.5 12.75], ...
	'String','Calibration Circle Diameter', ...
	'Style','text', ...
	'Tag','StaticText10');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',Diameter);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 104 50 15], ...
	'Style','edit', ...
   'Tag','Diameter',...
	'TooltipString','Enter the diameter of the calibration circle. Dimensions will be consistent with the results');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','right', ...
	'ListboxTop',0, ...
	'Position',[35.25 81 161.25 13.5], ...
	'String','Search Area Size Factor', ...
	'Style','text', ...
	'Tag','StaticText11');
h1 = uicontrol('Parent',h0, ...
   'CreateFcn','set(gcbo,''String'',ROIScaleFactor);',...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'FontName','Ariel', ...
	'FontSize',10, ...
	'FontWeight','bold', ...
	'HorizontalAlignment','left', ...
	'ListboxTop',0, ...
	'Position',[210 81 50 15], ...
	'Style','edit', ...
   'Tag','ROIScaleFactor',...
	'TooltipString','Enter the scaling factor used to determine the size of the search area.');
if nargout > 0, fig = h0; end
