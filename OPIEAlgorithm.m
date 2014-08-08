function [x,y,PicHeight,PicWidth]=OPIEAlgorithm(VideoPath,FileName,StartFrame,EndFrame,SampleRate,ROIScaleFactor,XCal,YCal,XRef,YRef,VideoOn,x,y)

global Quit;
Quit=0;

OPIEAnalysis;		%Draws the window for display of the results
drawnow;

axes(findobj('Tag','PlotAxes'));			%Sets the axes in the window to current


%*******************
%ANALYSIS
%*******************

ROI=ROIScaleFactor;	%To use a shorter name

for FrameCount=2:EndFrame-StartFrame+1;
   
   %The following lines read in the image file
   if FrameCount+StartFrame-1>=1 & FrameCount+StartFrame-1<10,
      A=imread([VideoPath,FileName,'000',num2str(FrameCount+StartFrame-1),'.bmp']);
   elseif FrameCount+StartFrame-1>=10 & FrameCount+StartFrame-1<100,
      A=imread([VideoPath,FileName,'00',num2str(FrameCount+StartFrame-1),'.bmp']);
   elseif FrameCount+StartFrame-1>=100 & FrameCount+StartFrame-1<1000,
      A=imread([VideoPath,FileName,'0',num2str(FrameCount+StartFrame-1),'.bmp']);
   elseif FrameCount+StartFrame-1>=1000,
      A=imread([VideoPath,FileName,num2str(FrameCount+StartFrame-1),'.bmp']);
   end
   
   [PicHeight,PicWidth]=size(A);			%Returns the dimensions of the array
   PicWidth=PicWidth-11;					%Accounts for the black strip down the right edge of the image
   
   %Extract the two ROI's from the image and find the minimum
   %value and its indeces in each
   [y1,x1,minimum]=...
      matmin(double(A(max(round(y(FrameCount-1,1)-(PicHeight/ROI)/2),0):min(round(y(FrameCount-1,1)+(PicHeight/ROI)/2),PicHeight),...
      max(round(x(FrameCount-1,1)-(PicWidth/ROI)/2),0):min(round(x(FrameCount-1,1)+(PicWidth/ROI)/2),PicWidth))));
   [y2,x2,minimum]=...
      matmin(double(A(max(round(y(FrameCount-1,2)-(PicHeight/ROI)/2),0):min(round(y(FrameCount-1,2)+(PicHeight/ROI)/2),PicHeight),...
      max(round(x(FrameCount-1,2)-(PicWidth/ROI)/2),0):min(round(x(FrameCount-1,2)+(PicWidth/ROI)/2),PicWidth))));
      
   %Adjust the location of the targets to global space from the ROI
   x(FrameCount,1:2)=[round(x1+x(FrameCount-1,1)-(PicWidth/ROI)/2) round(x2+x(FrameCount-1,2)-(PicWidth/ROI)/2)];
   y(FrameCount,1:2)=[round(y1+y(FrameCount-1,1)-(PicHeight/ROI)/2) round(y2+y(FrameCount-1,2)-(PicHeight/ROI)/2)];   
   
   
   %Checks to see if the video should be shown and then does so.
   if VideoOn==1,
      %Draw the black cross hairs
      A(max(round(y(FrameCount,1)-(PicHeight/ROI)/2),0):min(round(y(FrameCount,1)+(PicHeight/ROI)/2),PicHeight),...
         x(FrameCount,1):x(FrameCount,1)+1)=0;
      A(y(FrameCount,1):y(FrameCount,1)+1,...
         max(round(x(FrameCount,1)-(PicWidth/ROI)/2),0):min(round(x(FrameCount,1)+(PicWidth/ROI)/2),PicWidth))=0;
      A(max(round(y(FrameCount,2)-(PicHeight/ROI)/2),0):min(round(y(FrameCount,2)+(PicHeight/ROI)/2),PicHeight),...
         x(FrameCount,2):x(FrameCount,2)+1)=0;
      A(y(FrameCount,2):y(FrameCount,2)+1,...
         max(round(x(FrameCount,2)-(PicWidth/ROI)/2),0):min(round(x(FrameCount,2)+(PicWidth/ROI)/2),PicWidth))=0;
      %Show the image
      imshow(A);
      hold on;
      plot(x(:,1),y(:,1),'b',x(:,2),y(:,2),'r');
      hold off;
      drawnow;
      end
   
   set(findobj('Tag','ViewFrame'),'String',num2str(StartFrame+FrameCount-1));
   					%Changes the number of the current frame counter in the window
   set(findobj('Tag','PercentDone'),'String',num2str(round((FrameCount/(EndFrame-StartFrame+1)*100))));
   					%Changes the number of the Percent Done counter in the window
                  
   if Quit==1,
      clear all;
   	break;
      end;
   
   end

close(gcf);