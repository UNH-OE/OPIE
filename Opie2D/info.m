clear;
clc;
k=1;
count=1;
numpnt=2;

backcolor = uicontrol(gcf,'Style','frame','Pos',[0 0 1 1],'units','normalized',...
'BackgroundColor',[1 1 1]);

txt = uicontrol(gcf,'Style','text','Position',[145 320 180 20],...
'String','Testing Parameters','BackgroundColor',[1 1 1],...
'ForegroundColor',[0 0 0]);

input_frame = uicontrol(gcf,'Style','frame','Pos',[95 65 295 240],...
'BackgroundColor',[.701961 .701961 .701961]);

path_txt=uicontrol(gcf,'Style','text','pos',[105 275 50 15],'String',...
'Path','BackgroundColor',[.701961 .701961 .701961],'Horiz','Left');

shade0 = uicontrol(gcf,'Style','frame','pos',[220 275 156 21],...
'BackgroundColor',[1 1 1]);

path_val =uicontrol(gcf,'Style','edit','pos',[223 278 152 16],...
'BackgroundColor',[1 1 1],'CallBack',['get(path_val,''String'');',...
'path = get(path_val,''String'');']);

fname_txt=uicontrol(gcf,'Style','text','pos',[105 250 215 15],'String',...
'Enter Sequence File Name','BackgroundColor',[.701961 .701961 .701961],'Horiz','Left');

shade = uicontrol(gcf,'Style','frame','pos',[322 247 54 21],...
'BackgroundColor',[1 1 1]);

FNAME_val =uicontrol(gcf,'Style','edit','pos',[325 250 50 15],...
'BackgroundColor',[1 1 1],'CallBack',['get(FNAME_val,''String'');',...
'fname = get(FNAME_val,''String'');']);

cname_txt=uicontrol(gcf,'Style','text','pos',[105 175 215 15],'String',...
'Enter Name of Calibration Image','BackgroundColor',[.701961 .701961 .701961],'Horiz','Left');

shade2 = uicontrol(gcf,'Style','frame','pos',[322 172 54 21],...
'BackgroundColor',[1 1 1]);

cname_val =uicontrol(gcf,'Style','edit','pos',[325 175 50 15],...
'BackgroundColor',[1 1 1],'CallBack',['get(cname_val,''String'');',...
'cname = get(cname_val,''String'');']);

diam_txt=uicontrol(gcf,'Style','text','pos',[105 100 215 15],'String',...
'Enter diameter of calibration circle','BackgroundColor',...
[.701961 .701961 .701961],'Horiz','Left');

shade3 = uicontrol(gcf,'Style','frame','pos',[322 97 54 21],...
'BackgroundColor',[1 1 1]);

diam_val=uicontrol(gcf,'Style','edit','pos',[325 100 50 15],...
'BackgroundColor',[1 1 1],'CallBack',['get(diam_val,''String'');',...
'diam = str2num(get(diam_val,''String''));']);

ename_txt=uicontrol(gcf,'Style','text','pos',[105 125 215 15],'String',...
'Enter Name of Equilibrium Image','BackgroundColor',[.701961 .701961 .701961],'Horiz','Left');


shade4 = uicontrol(gcf,'Style','frame','pos',[322 122 54 21],...
'BackgroundColor',[1 1 1]);

ename_val =uicontrol(gcf,'Style','edit','pos',[325 125 50 15],...
'BackgroundColor',[1 1 1],'CallBack',['get(ename_val,''String'');',...
'ename = get(ename_val,''String'');']);

f_txt=uicontrol(gcf,'Style','text','pos',[105 225 215 15],'String',...
'Number of Frames in Sequence','BackgroundColor',[.701961 .701961 .701961],...
'Horiz','Left');

shade5 = uicontrol(gcf,'Style','frame','pos',[322 222 54 21],...
'BackgroundColor',[1 1 1]);

F_val=uicontrol(gcf,'Style','edit','pos',[325 225 50 15],...
'BackgroundColor',[1 1 1],'CallBack',['get(F_val,''String'');',...
'f=str2num(get(F_val,''String''));']);

units_txt=uicontrol(gcf,'Style','text','pos',[105 150 215 15],'String',...
'Enter the Units of the Calibration Dot','BackgroundColor',...
[.701961 .701961 .701961],'Horiz','Left');

shade6 = uicontrol(gcf,'Style','frame','pos',[322 147 54 21],...
'BackgroundColor',[1 1 1]);

units_val=uicontrol(gcf,'Style','edit','pos',[325 150 50 15],...
'BackgroundColor',[1 1 1],'Value',2,'CallBack',['get(units_val,''String'');',...
'units=get(units_val,''String'');']);

fps_txt=uicontrol(gcf,'Style','text','pos',[105 200 160 15],'String',...
'Sampling Rate (frames/sec)','BackgroundColor',[.701961 .701961 .701961]);

shade = uicontrol(gcf,'Style','frame','pos',[322 197 54 21],...
'BackgroundColor',[1 1 1]);

FPS_val=uicontrol(gcf,'Style','edit','pos',[325 200 50 15],...
'BackgroundColor',[1 1 1],'Value',30,'CallBack',['get(FPS_val,''String'');',...
'fps = str2num(get(FPS_val,''String''));']);

shade7 = uicontrol(gcf,'Style','frame','pos',[322 72 54 21],...
'BackgroundColor',[1 1 1]);

ratio_txt=uicontrol(gcf,'Style','text','pos',[105 72 215 15],'String',...
'Enter the Search Area Scaling Factor','BackgroundColor',...
[.701961 .701961 .701961],'Horiz','Left');

ratio_val=uicontrol(gcf,'Style','edit','pos',[325 75 50 15],...
'BackgroundColor',[1 1 1],'CallBack',['get(ratio_val,''String'');',...
'ratio = str2num(get(ratio_val,''String''));']);

quit=uicontrol(gcf,'Style','pushbutton','String',...
'Quit','Position',[15 5 115 25],'BackgroundColor',[.9 1 1],'Callback',...
['close(gcf)',',Return,']);


finished=uicontrol(gcf,'Style','pushbutton','String',...
'Continue','Position',[370 5 115 25],'BackgroundColor',[.9 1 1],'Callback',...
['close(gcf),calb']);