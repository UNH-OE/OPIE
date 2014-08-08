clear all;
close all;
cd 'c:\';

% define the global variables
global bmp_row; % number of row per image from 1 camera
global bmp_col; % number of column per image from 1 camera
global bmp_2fr_start; % index of the starting column of the 2nd frame in the large bmp
global bmp_2fr_end;   % index of the last column of the 2nd frame in the large bmp

bmp_row = 484;
bmp_col = 645;
bmp_2fr_start = 646;
bmp_2fr_end = 1292;

menuncmms;
