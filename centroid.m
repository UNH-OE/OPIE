function [X,Y]=centroid(ROI)

%[X,Y]=centroid(ROI)
%
%This function accepts a region of intrest from an image
%and returns the centriod of the darkest part of the image

%Improve the contrast of the image
ROI=histeq(ROI,256);

%Comput the histogram of the image
[num,levels]=imhist(ROI,256);

%Find the darkest colors in the area (These are assumed to be part of the dot)
%Find the threshold level ThreshLevel
ThreshLevel=0;
dummy1=0;
for i=1:length(num)
   ThreshLevel=ThreshLevel+1;
   if dummy1==0,
      if num(i)>0;
         dummy1=1;
      end
   else
      if num(i)==0;
         break;
      end
   end
end

%Threshold the image at ThreshLevel
ROI=im2bw(ROI,ThreshLevel/256);

%Filter***************

%simple single erosion
%ROIfiltered=bwmorph(ROI,'dilate');

%Erosion until empty
%[num,levels]=imhist(ROI,2);
%ROIfiltered=ROI;
%while num(1)>=1,
%   ROIfiltered1=ROIfiltered;
%   ROIfiltered=bwmorph(ROIfiltered,'dilate');
%   [num,levels]=imhist(ROIfiltered,2);
%   if num>=1
%      ROIfiltered1=ROIfiltered;
%   else
%      break;
%   end
%      imshow(ROIfiltered);
%   drawnow;
%   end
%ROI=ROIfiltered1;

%cleaning in parts
ROIfiltered=ROI;
[m,n]=size(ROIfiltered);
ROIfiltered(1:m,1)=1;
ROIfiltered(1:m,n)=1;
ROIfiltered(1,1:n)=1;
ROIfiltered(m,1:n)=1;

%imshow(ROIfiltered);drawnow;pause(1);
ROIfiltered=bwmorph(ROIfiltered,'dilate');
%imshow(ROIfiltered);drawnow;pause(1);
ROIfiltered=bwmorph(ROIfiltered,'clean');
%imshow(ROIfiltered);drawnow;pause(1);
ROIfiltered=bwmorph(ROIfiltered,'diag');
%imshow(ROIfiltered);drawnow;pause(1);
ROIfiltered=bwmorph(ROIfiltered,'spur');
%imshow(ROIfiltered);drawnow;pause(1);

%Check to make sure the filtering did not destroy the data
[num,levels]=imhist(ROI,2);
if num(1)~=0
   ROI=ROIfiltered;
end

%Count the number of dark pixels and find thier locations
[m,n]=size(ROI);
NumPix=0;
for i=1:m
   for j=1:n
      if ROI(i,j)==0;
         NumPix=NumPix+1;
         x(NumPix)=j;
         y(NumPix)=i;
      end
   end
end

%Calculate centroid
X=sum(x)/NumPix;
Y=sum(y)/NumPix;