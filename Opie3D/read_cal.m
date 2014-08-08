%
% Read the calibration file for the NCMMS
% 7/6/98  Bertrand Bobillier 
%


% Get Calibration file name
[tmp1 tmp2]=uigetfile('*.vcl','Select the Calibration file');
if tmp1 == 0, return, else vcl_file = tmp1; vcl_pth = tmp2; end;
drawnow;
cd(vcl_pth);

   
% specify new line haracter
NEWLINE = sprintf('\n');

% specify delimiting character
dlm = sprintf(',');

% setup character matrixes
alpha = 0;
beta = 0;
userpoint = [0 0 0];
calibration_diameter = 0;
calibration_units = '';
cal1x = 0;
cal1y = 0;
cal2x = 0;
cal2y = 0;
cal_file = '';
cal_pth = '';
errorflg = 0;

% open the file 

fid = fopen(vcl_file,'r');
if fid == (-1)
   error(['hdread: Could not open header file! ']);
end

% Read delimited format 

eol = NEWLINE;    % End Of Line char
line = fgets(fid); % get the 1st line, if any...
line = fgets(fid); 

dlmloc = find(double(line)==44);
if length(dlmloc) ~= 1 % verify that there is only one comma
   errorflg = 1;
   errordlg('VCL file format not valid');
   break
   return
end

alpha=str2num(setstr(line(dlmloc(1)+1:length(line))));

line = fgets(fid); % start on the second line
dlmloc = find(double(line)==44);
beta=str2num(setstr(line(dlmloc(1)+1:length(line))));

line = fgets(fid); 
dlmloc = find(double(line)==44);
cal(1,1)=str2num(setstr(line(dlmloc(1)+1:dlmloc(2)-1)));
cal(1,2)=str2num(setstr(line(dlmloc(2)+1:dlmloc(3)-1)));
cal(1,3)=str2num(setstr(line(dlmloc(3)+1:dlmloc(4)-1)));
cal(1,4)=str2num(setstr(line(dlmloc(4)+1:length(line))));

line = fgets(fid); 
dlmloc = find(double(line)==44);
cal_diameter=str2num(setstr(line(dlmloc(1)+1:length(line))));

line = fgets(fid); 
dlmloc = find(double(line)==44);
cal_units=char(setstr(line(dlmloc(1)+1:length(line))));

line = fgets(fid); 
dlmloc = find(double(line)==44);
cal_file=char(setstr(line(dlmloc(1)+1:length(line))));

line = fgets(fid); 
dlmloc = find(double(line)==44);
cal_path=char(setstr(line(dlmloc(1)+1:length(line))));

line = fgets(fid); 
dlmloc = find(double(line)==44);
userpoint(1,1)=str2num(setstr(line(dlmloc(1)+1:dlmloc(2)-1)));
userpoint(1,2)=str2num(setstr(line(dlmloc(2)+1:dlmloc(3)-1)));
userpoint(1,3)=str2num(setstr(line(dlmloc(3)+1:length(line))));
  
% close file
fclose(fid);

