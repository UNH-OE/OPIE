%
% Create the calibration file for the NCMMS
% 7/6/98  Bertrand Bobillier 
%

% define the global variables
global bmp_row; % number of row per image from 1 camera
global bmp_col; % number of column per image from 1 camera
global bmp_2fr_start; % index of the starting column of the 2nd frame in the large bmp
global bmp_2fr_end;   % index of the last column of the 2nd frame in the large bmp
global HCal; % used by pixel_cal to return the horizontal calibration factor
global VCal; % used by pixel_cal to return the horizontal calibration factor

% Get Calibration file name
[tmp1 tmp2]=uigetfile('*.bmp','Select the Calibration file');
if tmp1 == 0, return, else cal_file = tmp1; cal_pth = tmp2; end;
drawnow;
cd(cal_pth);

% Get the configuration Set-up
config_cal;
uiwait(a(1));
%drawnow;
%if errorflag == 1, return, end

% Load the picture
cal_bmp = imread(cal_file);

% calibrate the first camera
cal_image = cal_bmp(1:bmp_row,1:bmp_col);
title = 'Camera 1';
done = 0; %reset the flag from the pixel_cal procedure
pixel_cal(cal_image,title);

while (done == 0)
   pause(1);
end

if (done == 1) % the calibration procedure was exited by pressing ok
   cal1x=calibration_diameter/HCal;	%Calculate the x-calibration for camera 1
   cal1y=calibration_diameter/VCal;	%Calculate the y-calibration for camera 1
elseif (done ==2)% the calibration procedure was exited by pressing cancel
   return;
end

% calibrate the second camera
cal_image = cal_bmp(1:bmp_row,bmp_2fr_start:bmp_2fr_end);
title = 'Camera 2';
done = 0; %reset the flag from the pixel_cal procedure
pixel_cal(cal_image,title');

while (done == 0)
   pause(1);
end

if (done == 1) % the calibration procedure was exited by pressing ok
   cal2x=calibration_diameter/HCal;	%Calculate the x-calibration for camera 1
   cal2y=calibration_diameter/VCal;	%Calculate the y-calibration for camera 1
elseif (done ==2)% the calibration procedure was exited by pressing cancel
   return;
end
   
   %save the calibration file
%   if ~exist([testnm,'.prg'],'file')
fid1 = fopen([cal_file,'.vcl'],'wt+');
if (fid1 == -1)
   errordlg('Couldn''t create the calibration file .vcl');
   return;
end
      
fprintf(fid1,['Video calibration file\n']);
fprintf(fid1,'alpha,%f\n',alpha);
fprintf(fid1,'beta,%f\n',beta);
fprintf(fid1,'cal,%f,%f,%f,%f\n',cal1x,cal1y,cal2x,cal2y);
fprintf(fid1,'cal_diameter,%f\n',calibration_diameter);
fprintf(fid1,'cal_units,%s\n',calibration_units);
fprintf(fid1,'cal_file,%s\n',cal_file);
fprintf(fid1,'cal_path,%s\n',cal_pth);
fprintf(fid1,'userpoint,%f,%f,%f\n',userpoint(1,1),userpoint(1,2),userpoint(1,3));
fclose(fid1);


   alpha
   beta
   userpoint
   calibration_diameter
   calibration_units
   cal1x
   cal1y
   cal2x
   cal2y
   cal_file
   cal_pth
   

clear prgrstexthndl prgrstextstr filt custfilt cutoff output tmp1 tmp2;
